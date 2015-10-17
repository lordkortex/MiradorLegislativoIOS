//
//  TableViewControllerSesiones.swift
//  MiradorLegislativoApp
//
//  Created by mac on 23/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerSesiones: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    var arrayOfXmlSesiones :[XmlSesiones] = [XmlSesiones]()
    var arrayOfXmlSesionesResult :[XmlSesiones] = [XmlSesiones]()
    
    var arrayOfXmlProyectos :[XmlProyectos] = [XmlProyectos]()
    var arrayOfXmlIntervenciones :[XmlIntervenciones] = [XmlIntervenciones]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("reloadData"), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl
        
        
    }
    
    
    func reloadData() {
        arrayOfXmlSesiones[0].descripcion_larga="testing"
        tableView.reloadData()
        refreshControl?.endRefreshing()
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
            //let scope = self.searchDisplayController!.searchBar.scopeButtonTitles as String
            //self.filterContentForSearchText(self.searchDisplayController!.searchBar.text, scope: scope[searchOption])
            return true
    }
    
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        self.arrayOfXmlSesionesResult = self.arrayOfXmlSesiones.filter({( sesion : XmlSesiones) -> Bool in
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
            return self.arrayOfXmlSesiones.count ?? 0
        }
        
        return self.arrayOfXmlSesiones.count;
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*let cell = tableView.dequeueReusableCellWithIdentifier("SessionCell") as UITableViewCell*/
        
         let cell = self.tableView.dequeueReusableCellWithIdentifier("SessionCell") as UITableViewCell!
        
        var sesion : XmlSesiones
        if tableView == self.searchDisplayController!.searchResultsTableView {
            sesion = arrayOfXmlSesionesResult[indexPath.row]
        } else {
            sesion = arrayOfXmlSesiones[indexPath.row]
        }
        
        cell.textLabel?.text = sesion.descripcion_larga
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //let selectedItem = items.objectAtIndex(indexPath.row) as String
        //let itemId = selectedItem.componentsSeparatedByString("$%^")
        // add to self.selectedItems
        //selectedItems[itemId[1]] = true
        
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
