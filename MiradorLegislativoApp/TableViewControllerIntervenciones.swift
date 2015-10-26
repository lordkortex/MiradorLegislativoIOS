//
//  TableViewControllerIntervenciones.swift
//  MiradorLegislativoApp
//
//  Created by mac on 23/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerIntervenciones: UITableViewController {

    var arrayOfXmlIntervenciones :[XmlIntervenciones] = [XmlIntervenciones]()
    var id_sesion_proyecto = NSString()
    var imageCache = [String:UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 80.0
    }
    
    

    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Intervenciones"
        
        
        var color: UIColor = UIColor(red: 62/255, green: 93/255, blue: 132/255, alpha: 1.0)
        
        self.navigationController?.navigationBar.barTintColor = color
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        //self.navigationController?.navigationBar.titleTextAttributes = titleDict as [NSObject : AnyObject]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
         
        
        /*    self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Lobster 1.4", size: 34)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfXmlIntervenciones.count
    }
    
       
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
       /* let cell : TableViewControllerIntervencionesCellP = tableView.dequeueReusableCellWithIdentifier("IntervencionCell", forIndexPath: indexPath) as! TableViewControllerIntervencionesCellP*/
        
       let intervencion = arrayOfXmlIntervenciones[indexPath.row]
        
          
        
        let cell : ImageCellDiputado = tableView.dequeueReusableCellWithIdentifier("ImageCellDiputado", forIndexPath: indexPath) as! ImageCellDiputado
        
        
        var urlString: NSString = intervencion.diputado_imagen as NSString
        
        if(urlString.length > 10){
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
            
            
        }else{
            cell.imageDiputado.image = UIImage(named: "ico_diputados")
            
        }
        
        
        cell.titleDiputado.text = intervencion.diputado_nombre
        cell.label1.text = intervencion.partido_nombre
        cell.label2.text = intervencion.intervencion_fecha_creacion
        cell.label3.text = intervencion.proyecto_nombre
        cell.subtitleDiputado.text = intervencion.intervencion_texto
        
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //let selectedItem = items.objectAtIndex(indexPath.row) as String
        //let itemId = selectedItem.componentsSeparatedByString("$%^")
        // add to self.selectedItems
        //selectedItems[itemId[1]] = true
    }
    
    

}
