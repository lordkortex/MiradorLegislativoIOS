//
//  CandyTableViewController.swift
//  MiradorLegislativoApp
//
//  Created by mac on 26/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class CandyTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    var candies = [XmlProponentes]()
    
    var filteredCandies = [XmlProponentes]()
    
    override func viewDidLoad() {
        // Sample Data for candyArray
        self.candies = [XmlProponentes(id_diputado: "", diputado_nombre: "hos", partido_nombre: "", descripcion_corta: "", descripcion_larga: "", diputado_imagen: "", diputado_nombre_lower: ""),
            XmlProponentes(id_diputado: "", diputado_nombre: "marlon", partido_nombre: "", descripcion_corta: "", descripcion_larga: "", diputado_imagen: "", diputado_nombre_lower: "")
            ]
        
        // Reload the table
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredCandies.count
        } else {
            return self.candies.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //ask for a reusable cell from the tableview, the tableview will create a new one if it doesn't have any
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as TableViewControllerPartidosCell
        
        var candy : XmlProponentes
        // Check to see whether the normal table or search results table is being displayed and set the Candy object from the appropriate array
        if tableView == self.searchDisplayController!.searchResultsTableView {
            candy = filteredCandies[indexPath.row]
        } else {
            candy = candies[indexPath.row] 
        }
        
        // Configure the cell
        cell.LabelPartido.text = candy.diputado_nombre
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        self.filteredCandies = self.candies.filter({( candy : XmlProponentes) -> Bool in
            //var categoryMatch = (scope == "All") || (candy.category == scope)
            var stringMatch = candy.diputado_nombre.rangeOfString(searchText)
            return  (stringMatch != nil)
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        let scopes = self.searchDisplayController!.searchBar.scopeButtonTitles as [String]
        let selectedScope = scopes[self.searchDisplayController!.searchBar.selectedScopeButtonIndex] as String
        self.filterContentForSearchText(searchString, scope: selectedScope)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController!,
        shouldReloadTableForSearchScope searchOption: Int) -> Bool {
            let scope = self.searchDisplayController!.searchBar.scopeButtonTitles as [String]
            self.filterContentForSearchText(self.searchDisplayController!.searchBar.text, scope: scope[searchOption])
            return true
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("candyDetail", sender: tableView)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "candyDetail" {
            let candyDetailViewController = segue.destinationViewController as UIViewController
            if sender as UITableView == self.searchDisplayController!.searchResultsTableView {
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow()!
                let destinationTitle = self.filteredCandies[indexPath.row].diputado_nombre
                candyDetailViewController.title = destinationTitle
            } else {
                let indexPath = self.tableView.indexPathForSelectedRow()!
                let destinationTitle = self.candies[indexPath.row].diputado_nombre
                candyDetailViewController.title = destinationTitle
            }
        }
    }
}
