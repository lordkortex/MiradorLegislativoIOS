//
//  TableViewControllerStatus.swift
//  MiradorLegislativoApp
//
//  Created by mac on 02/08/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerStatus: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {

    
    
    @IBOutlet weak var s: UISearchBar!
    
    var arrayOfXmlSesionesResult :[XmlEstatus] = [XmlEstatus]()
    var arrayOfXmlStatus :[XmlEstatus] = [XmlEstatus]()
    
    var arrayOfXmlProyectos :[XmlProyectos] = [XmlProyectos]()
    var arrayOfXmlIntervenciones :[XmlIntervenciones] = [XmlIntervenciones]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlStatusName)!
        arrayOfXmlStatus = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlEstatus]
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Sesiones"
        
        
        var color: UIColor = UIColor(red: 62/255, green: 93/255, blue: 132/255, alpha: 1.0)
        
        self.navigationController?.navigationBar.barTintColor = color
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        //self.navigationController?.navigationBar.titleTextAttributes = titleDict as [NSObject : AnyObject]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchString)
        return true
    }
    
    
    func searchDisplayController(controller: UISearchDisplayController!,
        shouldReloadTableForSearchScope searchOption: Int) -> Bool {
            let scope = self.searchDisplayController!.searchBar.scopeButtonTitles as! String
            //self.filterContentForSearchText(self.searchDisplayController!.searchBar.text, scope: scope[searchOption])
            return true
    }
    
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        self.arrayOfXmlSesionesResult = arrayOfXmlStatus.filter({( sesion : XmlEstatus) -> Bool in
            //var categoryMatch = (scope == "All") || (diputado.partido_nombre == scope)
            var stringMatch = sesion.status_nombre.lowercaseString.rangeOfString(searchText.lowercaseString)
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
            return arrayOfXmlStatus.count ?? 0
        }
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*let cell = tableView.dequeueReusableCellWithIdentifier("SessionCell") as UITableViewCell*/
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("StatusCell") 
        
        var sesion : XmlEstatus
        if tableView == self.searchDisplayController!.searchResultsTableView {
            sesion = arrayOfXmlSesionesResult[indexPath.row]
        } else {
            sesion = arrayOfXmlStatus[indexPath.row]
        }
        
        cell!.textLabel?.text = sesion.status_nombre
        
        
        return cell!
    }
     
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var sesion : XmlEstatus
        if tableView == self.searchDisplayController!.searchResultsTableView {
            sesion = arrayOfXmlSesionesResult[indexPath.row]
        } else {
            sesion = arrayOfXmlStatus[indexPath.row]
        }
        
        ProyecFiltro.status = sesion.status_nombre
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    
}
