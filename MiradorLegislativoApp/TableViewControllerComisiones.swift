//
//  TableViewControllerComisiones.swift
//  MiradorLegislativoApp
//
//  Created by mac on 24/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerComisiones: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate  {

    //var arrayOfXmlComisiones :[XmlComisiones] = [XmlComisiones]()
    var arrayOfXmlComisionesDistinct :[XmlComisionesDistinct] = [XmlComisionesDistinct]()
    var arrayOfXmlComisionesResults :[XmlComisionesDistinct] = [XmlComisionesDistinct]()
    
    var arrayOfXmlProyectos :[XmlProyectos] = [XmlProyectos]()
    var arrayOfXmlIntervenciones :[XmlIntervenciones] = [XmlIntervenciones]()
    var arrayOfXmlProponentes :[XmlProponentesPorComision] = [XmlProponentesPorComision]()
    
    var imageCache = [String:UIImage]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Comisiones"
        
        
        var color: UIColor = UIColor(red: 62/255, green: 93/255, blue: 132/255, alpha: 1.0)
        
        self.navigationController?.navigationBar.barTintColor = color
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        //self.navigationController?.navigationBar.titleTextAttributes = titleDict as [NSObject : AnyObject]
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
        self.arrayOfXmlComisionesResults = self.arrayOfXmlComisionesDistinct.filter({( comision : XmlComisionesDistinct) -> Bool in
            //var categoryMatch = (scope == "All") || (partido.partido_nombre == scope)
            let stringMatch = comision.comision_dictaminadora_nombre.lowercaseString.rangeOfString(searchText.lowercaseString)
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
            return self.arrayOfXmlComisionesResults.count ?? 0
        } else {
            return self.arrayOfXmlComisionesDistinct.count ?? 0
        }

    }
    
    override func tableView(tableView:UITableView, heightForRowAtIndexPath indexPath:NSIndexPath)->CGFloat
    {
        return 100
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        /*let cell : TableViewControllerComisionesCell = tableView.dequeueReusableCellWithIdentifier("ComisionCell", forIndexPath: indexPath) as TableViewControllerComisionesCell*/
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("ComisionCell") as! TableViewControllerComisionesCell

        
        var comision : XmlComisionesDistinct
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            comision = arrayOfXmlComisionesResults[indexPath.row]
        } else {
            comision = arrayOfXmlComisionesDistinct[indexPath.row]
        } 
        
        var urlString: NSString = comision.imagen as NSString
        var imgURL  = NSURL(string: urlString as String)
        
        cell.im.image = UIImage(named: "ico_comisiones")
        
        if let img = imageCache[urlString as String] {
            cell.im.image = img
        }
        else {
            let request: NSURLRequest = NSURLRequest(URL: imgURL!)
            let mainQueue = NSOperationQueue.mainQueue()
            NSURLConnection.sendAsynchronousRequest(request, queue: mainQueue, completionHandler: { (response, data, error) -> Void in
                if error == nil {
                    let image = UIImage(data: data!)
                    self.imageCache[urlString as String] = image
                    dispatch_async(dispatch_get_main_queue(), {
                        if let cellToUpdate = tableView.cellForRowAtIndexPath(indexPath) {
                            cell.im.image = image
                        }
                    })
                }
                else {
                    print("Error: \(error!.localizedDescription)")
                }
            })
        }
        

        
        cell.labelComision.text = comision.comision_dictaminadora_nombre
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
     
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        let svc = segue.destinationViewController as! ViewControllerDashboardComisiones;
        
        if (segue.identifier == "viewDashboardComisiones") {
            
            var indexPath : NSIndexPath
            var comision : XmlComisionesDistinct
            
            if(self.tableView.indexPathForSelectedRow == nil){
                indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow!
                comision = arrayOfXmlComisionesResults[indexPath.row]
            } else {
                indexPath = self.tableView.indexPathForSelectedRow!
                comision = arrayOfXmlComisionesDistinct[indexPath.row]
            }
             
            
            var arrayOfXmlProyectosFilter :[XmlProyectos] = [XmlProyectos]()
            var arrayOfXmlDiputadosFilter :[XmlProponentesPorComision] = [XmlProponentesPorComision]()
            
            svc.linea1 = comision.comision_dictaminadora_nombre
            svc.diputado_imagen = comision.imagen
            
            //var arrayOfXmlProyectos :[XmlProyectos] = [XmlProyectos]()
            //var arrayOfXmlIntervenciones :[XmlIntervenciones] = [XmlIntervenciones]()
            //var arrayOfXmlProponentes :[XmlProponentes] = [XmlProponentes]()
            
            
            for item in arrayOfXmlProyectos {
                if(item.comision_dictaminadora_nombre == comision.comision_dictaminadora_nombre){
                    arrayOfXmlProyectosFilter.append(item)
                }
            }
            
         
            for item in arrayOfXmlProponentes {
                if(item.comision_dictaminadora_nombre == comision.comision_dictaminadora_nombre){
                    arrayOfXmlDiputadosFilter.append(item)
                }
            }
            
            
            
            svc.arrayOfXmlDiputadosFilter = arrayOfXmlDiputadosFilter
            svc.arrayOfXmlProyectosFilter = arrayOfXmlProyectosFilter
            svc.arrayOfXmlIntervencionesFilter = arrayOfXmlIntervenciones
            
        }

    }

}
