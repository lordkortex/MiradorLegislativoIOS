//
//  TableViewControllerDiputadosPorComision.swift
//  MiradorLegislativoApp
//
//  Created by mac on 26/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerDiputadosPorComision: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var arrayOfXmlProponente :[XmlProponentesPorComision] = [XmlProponentesPorComision]()
    var arrayOfXmlProponenteResuls :[XmlProponentesPorComision] = [XmlProponentesPorComision]()
    
    
    var arrayOfXmlProyectos :[XmlProyectos] = [XmlProyectos]()
    var arrayOfXmlIntervenciones :[XmlIntervenciones] = [XmlIntervenciones]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Comisiones"
        
        
        var color: UIColor = UIColor(red: 62/255, green: 93/255, blue: 132/255, alpha: 1.0)
        
        self.navigationController?.navigationBar.barTintColor = color
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        //self.navigationController?.navigationBar.titleTextAttributes = titleDict as! NSObject
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        /*    self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Lobster 1.4", size: 34)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]*/
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
        self.arrayOfXmlProponenteResuls = self.arrayOfXmlProponente.filter({( diputado : XmlProponentesPorComision) -> Bool in
            //var categoryMatch = (scope == "All") || (diputado.partido_nombre == scope)
            let stringMatch = diputado.diputado_nombre.lowercaseString.rangeOfString(searchText.lowercaseString)
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
            return self.arrayOfXmlProponenteResuls.count ?? 0
        } else {
            return self.arrayOfXmlProponente.count ?? 0
        }
        
    }
    
    override func tableView(tableView:UITableView, heightForRowAtIndexPath indexPath:NSIndexPath)->CGFloat
    {
        return 100
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("DiputadoCell") as! TableViewControllerDiputadosCell
        
        
        var diputado : XmlProponentesPorComision
        if tableView == self.searchDisplayController!.searchResultsTableView {
            diputado = arrayOfXmlProponenteResuls[indexPath.row]
            cell.labelNombre.text = diputado.diputado_nombre
            cell.LabelPartido.text = diputado.comision_dictaminadora_nombre
            cell.LabelDescripcion.text = diputado.descripcion_corta
            return cell
        } else {
            diputado = arrayOfXmlProponente[indexPath.row]
            cell.labelNombre.text = diputado.diputado_nombre
            cell.LabelPartido.text = diputado.comision_dictaminadora_nombre
            cell.LabelDescripcion.text = diputado.descripcion_corta
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        let svc = segue.destinationViewController as! ViewControllerDashboardDiputados;
        
        var arrayOfXmlProyectosFilter :[XmlProyectos] = [XmlProyectos]()
        var arrayOfXmlIntervencionesFilter :[XmlIntervenciones] = [XmlIntervenciones]()
        
        
        if (segue.identifier == "viewDashboardDiputados") {
            
            var indexPath : NSIndexPath
            var diputado : XmlProponentesPorComision
            
            if(self.tableView.indexPathForSelectedRow == nil){
                indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow!
                
                diputado  = arrayOfXmlProponenteResuls[indexPath.row]
            } else {
                
                indexPath = self.tableView.indexPathForSelectedRow!
                diputado  = arrayOfXmlProponente[indexPath.row]
            }
            
            
            svc.linea1 = diputado.diputado_nombre
            svc.linea2 = diputado.comision_dictaminadora_nombre
            svc.linea3 = diputado.descripcion_corta
            svc.diputado_nombre = diputado.diputado_nombre
            
             
            for item in arrayOfXmlIntervenciones {
                if(item.diputado_nombre == diputado.diputado_nombre){
                    arrayOfXmlIntervencionesFilter.append(item)
                }
            }
            
            for item in arrayOfXmlProyectos {
                if(item.diputado_nombre == diputado.diputado_nombre){
                    arrayOfXmlProyectosFilter.append(item)
                }
            }
            
            
            
            svc.arrayOfXmlIntervenciones = arrayOfXmlIntervencionesFilter
            svc.arrayOfXmlProyectos = arrayOfXmlProyectosFilter
            
            
        }
    }
    
}
