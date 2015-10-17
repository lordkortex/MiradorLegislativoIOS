//
//  TableViewControllerPartidos.swift
//  MiradorLegislativoApp
//
//  Created by mac on 24/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerPartidos: UITableViewController , UISearchBarDelegate, UISearchDisplayDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var arrayOfXmlPartidos :[XmlPartidos] = [XmlPartidos]()
    var arrayOfXmlPartidosResults :[XmlPartidos] = [XmlPartidos]()
    
    var arrayOfXmlProyectos :[XmlProyectos] = [XmlProyectos]()
    var arrayOfXmlIntervenciones :[XmlIntervenciones] = [XmlIntervenciones]()
    var arrayOfXmlProponentes :[XmlProponentes] = [XmlProponentes]()
    
    
    var imageCache = [String:UIImage]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Partidos"
        
        
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
        self.arrayOfXmlPartidosResults = self.arrayOfXmlPartidos.filter({( partido : XmlPartidos) -> Bool in
            //var categoryMatch = (scope == "All") || (partido.partido_nombre == scope)
            let stringMatch = partido.partido_nombre.lowercaseString.rangeOfString(searchText.lowercaseString)
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
            return self.arrayOfXmlPartidosResults.count ?? 0
        } else {
            return self.arrayOfXmlPartidos.count ?? 0
        }
        
    }
    
    override func tableView(tableView:UITableView, heightForRowAtIndexPath indexPath:NSIndexPath)->CGFloat
    {
        return 100
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*let cell : TableViewControllerPartidosCell = tableView.dequeueReusableCellWithIdentifier("PartidoCell", forIndexPath: indexPath) as TableViewControllerPartidosCell*/
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("PartidoCell") as! TableViewControllerPartidosCell
        
        
        var partido : XmlPartidos
         
        if tableView == self.searchDisplayController!.searchResultsTableView {
             partido = arrayOfXmlPartidosResults[indexPath.row]
        } else {
             partido = arrayOfXmlPartidos[indexPath.row]
        }
        
        
        var urlString: NSString = partido.partido_imagen as NSString
        var imgURL  = NSURL(string: urlString as String)
        
        cell.LabelImagen.image = UIImage(named: "ico_partidos")
        
        if let img = imageCache[urlString as String] {
            cell.LabelImagen.image = img
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
                            cell.LabelImagen.image = image
                        }
                    })
                }
                else {
                    print("Error: \(error!.localizedDescription)")
                }
            })
        }
        
        cell.LabelPartido.text = partido.partido_nombre
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        let svc = segue.destinationViewController as! ViewControllerDashboardPartidos;
        
        if (segue.identifier == "viewDashboardPartidos") {
            
            var indexPath : NSIndexPath
            var partido : XmlPartidos
            if(self.tableView.indexPathForSelectedRow == nil){
                indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow!
                partido = arrayOfXmlPartidosResults[indexPath.row]
                
            } else {
                indexPath = self.tableView.indexPathForSelectedRow!
                partido = arrayOfXmlPartidos[indexPath.row]
            }
            
            
            
            
            var arrayOfXmlProyectosFilter :[XmlProyectos] = [XmlProyectos]()
            var arrayOfXmlDiputadosFilter :[XmlProponentes] = [XmlProponentes]()
            
            svc.linea1 = partido.partido_nombre
            svc.linea2 = partido.descripcion_corta
            svc.linea3 = partido.descripcion_larga
            svc.diputado_imagen = partido.partido_imagen
            
            for item in arrayOfXmlProyectos {
                if(item.partido_nombre == partido.partido_nombre){
                    arrayOfXmlProyectosFilter.append(item)
                }
            }
            
            
            for item in arrayOfXmlProponentes {
                if(item.partido_nombre == partido.partido_nombre){
                    arrayOfXmlDiputadosFilter.append(item)
                }
            } 
            
            
            
            svc.arrayOfXmlDiputadosFilter = arrayOfXmlDiputadosFilter
            svc.arrayOfXmlProyectosFilter = arrayOfXmlProyectosFilter
            svc.arrayOfXmlIntervencionesFilter = arrayOfXmlIntervenciones
            
        }
        
    }
}

