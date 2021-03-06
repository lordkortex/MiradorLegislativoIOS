//
//  TableViewControllerSesionesPicker.swift
//  MiradorLegislativoApp
//
//  Created by mac on 02/08/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerSesionesPicker: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    @IBOutlet weak var d: UISearchBar! 
    
    var arrayOfXmlSesionesResult :[XmlSesiones] = [XmlSesiones]()
    var arrayOfXmlSesiones :[XmlSesiones] = [XmlSesiones]()
    
    var arrayOfXmlProyectos :[XmlProyectos] = [XmlProyectos]()
    var arrayOfXmlIntervenciones :[XmlIntervenciones] = [XmlIntervenciones]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlSesionesName)!
        arrayOfXmlSesiones = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlSesiones]
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Sesiones"
        
        
        var color: UIColor = UIColor(red: 62/255, green: 93/255, blue: 132/255, alpha: 1.0)
        
        self.navigationController?.navigationBar.barTintColor = color
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        //self.navigationController?.navigationBar.titleTextAttributes = titleDict as [NSObject : AnyObject]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String?) -> Bool {
        self.filterContentForSearchText(searchString!)
        return true
    }
    
    
    func searchDisplayController(controller: UISearchDisplayController!,
        shouldReloadTableForSearchScope searchOption: Int) -> Bool {
            let scope = self.searchDisplayController!.searchBar.scopeButtonTitles as! String
            //self.filterContentForSearchText(self.searchDisplayController!.searchBar.text, scope: scope[searchOption])
            return true
    }
    
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        self.arrayOfXmlSesionesResult = arrayOfXmlSesiones.filter({( sesion : XmlSesiones) -> Bool in
            //var categoryMatch = (scope == "All") || (diputado.partido_nombre == scope)
            let stringMatch = sesion.descripcion_larga.lowercaseString.rangeOfString(searchText.lowercaseString)
            return (stringMatch != nil)
        })
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.arrayOfXmlSesionesResult.count ?? 0
        } else {
            return arrayOfXmlSesiones.count ?? 0
        }
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*let cell = tableView.dequeueReusableCellWithIdentifier("SessionCell") as UITableViewCell*/
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("SessionCell")
        
        var sesion : XmlSesiones
        if tableView == self.searchDisplayController!.searchResultsTableView {
            sesion = arrayOfXmlSesionesResult[indexPath.row]
        } else {
            sesion = arrayOfXmlSesiones[indexPath.row]
        }
        
        cell!.textLabel?.text = sesion.descripcion_larga
        
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var sesion : XmlSesiones
        if tableView == self.searchDisplayController!.searchResultsTableView {
            sesion = arrayOfXmlSesionesResult[indexPath.row]
        } else {
            sesion = arrayOfXmlSesiones[indexPath.row]
        }

        ProyecFiltro.sesion = sesion.descripcion_larga
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let svc = segue.destinationViewController as! TableViewControllerProyectosP;
        
        //if (segue.identifier == "viewProyectos") {
        
        var indexPath : NSIndexPath
        var sesion : XmlSesiones
        
        if(self.tableView.indexPathForSelectedRow == nil){
            indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow!
            
            sesion  = arrayOfXmlSesionesResult[indexPath.row]
        } else {
            
            indexPath = self.tableView.indexPathForSelectedRow!
            sesion  = arrayOfXmlSesiones[indexPath.row]
        }
        
        
        var arrayOfXmlProyectosFilter :[XmlProyectos] = [XmlProyectos]()
        
        svc.sesionFechaP = sesion.descripcion_larga
        
        for item in arrayOfXmlProyectos {
            if(item.sesion_nombre == sesion.sesion_nombre){
                arrayOfXmlProyectosFilter.append(item)
            }
        }
        
        svc.arrayOfXmlProyectosP = arrayOfXmlProyectosFilter
        svc.arrayOfXmlIntervencionesP = arrayOfXmlIntervenciones
        
        //}
        
        //var svc = segue.destinationViewController as TableViewControllerProyectos;
        //svc.arrayOfXmlProyectos = arrayOfXmlProyectos
        
    }
    
    
    
}
