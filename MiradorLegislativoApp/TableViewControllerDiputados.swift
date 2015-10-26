//
//  TableViewControllerDiputados.swift
//  MiradorLegislativoApp
//
//  Created by mac on 01/08/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerDiputados: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate  {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var imageCache = [String:UIImage]()
    
    
    var arrayOfXmlProponente :[XmlProponentes] = [XmlProponentes]()
    var arrayOfXmlProponenteResuls :[XmlProponentes] = [XmlProponentes]()
    
    
    var arrayOfXmlProyectos :[XmlProyectos] = [XmlProyectos]()
    var arrayOfXmlIntervenciones :[XmlIntervenciones] = [XmlIntervenciones]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        configureTableView()
    }
    
    func configureTableView() {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 160.0
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Diputados"
        
        
        var color: UIColor = UIColor(red: 62/255, green: 93/255, blue: 132/255, alpha: 1.0)
        
        self.navigationController?.navigationBar.barTintColor = color
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        //elf.navigationController?.navigationBar.titleTextAttributes = titleDict! as NSDictionary
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        //Pendiente el cambio de color
        //otro cambio
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
        self.arrayOfXmlProponenteResuls = self.arrayOfXmlProponente.filter({( diputado : XmlProponentes) -> Bool in
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
        
        //if tableView == self.searchDisplayController!.searchResultsTableView {
            return 100
        //}
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("DiputadoCell") as! TableViewControllerDiputadoCellP
        
        
        var diputado : XmlProponentes
        if tableView == self.searchDisplayController!.searchResultsTableView {
            diputado = arrayOfXmlProponenteResuls[indexPath.row]
        } else {
            diputado = arrayOfXmlProponente[indexPath.row]
        }
        
        
        var urlString: NSString = diputado.diputado_imagen as NSString
        //var imgURL: NSURL = NSURL(string: urlString)!
        var imgURL  = NSURL(string: urlString as String)
        
        cell.ImageViewDiputado.image = UIImage(named: "ico_diputados")
        
        if let img = imageCache[urlString as String] {
            cell.ImageViewDiputado.image = img
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
                            cell.ImageViewDiputado.image = image
                        }
                    })
                }
                else {
                    print("Error: \(error!.localizedDescription)")
                }
            })
        }
        
        
        cell.labelNombre.text = diputado.diputado_nombre
        cell.LabelPartido.text = diputado.partido_nombre
        cell.labelDescripcion.text = diputado.descripcion_corta
        
        return cell
        
        //return imageCellAtIndexPath(indexPath)
        
        
        
    }
    
    func imageCellAtIndexPath(indexPath:NSIndexPath) -> ImageCellDiputado {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("ImageCellDiputado") as! ImageCellDiputado
        
        
        var diputado : XmlProponentes
        if tableView == self.searchDisplayController!.searchResultsTableView {
            diputado = arrayOfXmlProponenteResuls[indexPath.row]
        } else {
            diputado = arrayOfXmlProponente[indexPath.row]
        }
        
        
        var urlString: NSString = diputado.diputado_imagen as NSString
        var imgURL  = NSURL(string: urlString as String)
        
        cell.imageDiputado.image = UIImage(named: "ico_diputados")
        
        if let img = imageCache[urlString as String] {
            cell.imageDiputado.image = img
        }
        else {
            let request: NSURLRequest = NSURLRequest(URL: imgURL!)
            let mainQueue = NSOperationQueue.mainQueue()
            NSURLConnection.sendAsynchronousRequest(request, queue: mainQueue, completionHandler: { (response, data, error) -> Void in
                if error == nil {
                    let image = UIImage(data: data!)
                    self.imageCache[urlString as String] = image
                    dispatch_async(dispatch_get_main_queue(), {
                        //if let cellToUpdate = tableView.cellForRowAtIndexPath(indexPath) {
                            cell.imageDiputado.image = image
                        //}
                    })
                }
                else {
                    print("Error: \(error!.localizedDescription)")
                }
            })
        }

        
        cell.titleDiputado.text = diputado.diputado_nombre
        cell.subtitleDiputado.text = diputado.partido_nombre

        
        return cell
    }

    
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        let svc = segue.destinationViewController as! ViewControllerDashboardDiputados;
        
        var arrayOfXmlProyectosFilter :[XmlProyectos] = [XmlProyectos]()
        var arrayOfXmlIntervencionesFilter :[XmlIntervenciones] = [XmlIntervenciones]()
        
        
        if (segue.identifier == "viewDashboardDiputados") {
            
            var indexPath : NSIndexPath
            var diputado : XmlProponentes
            
            if(self.tableView.indexPathForSelectedRow == nil){
                indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow!
                
                diputado  = arrayOfXmlProponenteResuls[indexPath.row]
            } else {
                
                indexPath = self.tableView.indexPathForSelectedRow!
                diputado  = arrayOfXmlProponente[indexPath.row]
            }
            
            
            svc.linea1 = diputado.diputado_nombre
            svc.linea2 = diputado.partido_nombre
            svc.linea3 = diputado.descripcion_corta
            svc.diputado_nombre = diputado.diputado_nombre
            svc.diputado_imagen = diputado.diputado_imagen
            
            NSLog("Call diputado_imagen: %@",diputado.diputado_imagen);
            
            
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
