//
//  TableViewControllerDebate.swift
//  MiradorLegislativoApp
//
//  Created by mac on 02/08/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerDebate: UITableViewController,UISearchBarDelegate, UISearchDisplayDelegate {
    
    @IBOutlet weak var ser: UISearchBar!
    var arrayOfXmlSesionesResult :[XmlDebates] = [XmlDebates]()
    var arrayOfXmlDebates :[XmlDebates] = [XmlDebates]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlDebatesName)!
        arrayOfXmlDebates = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlDebates]
        
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
        self.arrayOfXmlSesionesResult = arrayOfXmlDebates.filter({( sesion : XmlDebates) -> Bool in
            let stringMatch = sesion.tipo_debate_nombre.lowercaseString.rangeOfString(searchText.lowercaseString)
            return (stringMatch != nil)
        })
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.arrayOfXmlSesionesResult.count ?? 0
        } else {
            return arrayOfXmlDebates.count ?? 0
        }
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("DebateCell")
        
        var sesion : XmlDebates
        if tableView == self.searchDisplayController!.searchResultsTableView {
            sesion = arrayOfXmlSesionesResult[indexPath.row]
        } else {
            sesion = arrayOfXmlDebates[indexPath.row]
        }
        
        cell!.textLabel?.text = sesion.tipo_debate_nombre
        
        
        return cell!
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var sesion : XmlDebates
        if tableView == self.searchDisplayController!.searchResultsTableView {
            sesion = arrayOfXmlSesionesResult[indexPath.row]
        } else {
            sesion = arrayOfXmlDebates[indexPath.row]
        }
        
        ProyecFiltro.debate = sesion.tipo_debate_nombre
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var svc = segue.destinationViewController as! TableViewControllerProyectosP;
        
       
    }
    
    
    
}
