//
//  TableViewControllerProyectosP.swift
//  MiradorLegislativoApp
//
//  Created by mac on 01/08/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerProyectosP: UITableViewController {
    
    
    var arrayOfXmlProyectosP :[XmlProyectos] = [XmlProyectos]()
    var arrayOfXmlIntervencionesP :[XmlIntervenciones] = [XmlIntervenciones]()
    var mutableData:NSMutableData  = NSMutableData.init()
    var sesionFechaP = NSString()
    
    
    
   

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 300
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = sesionFechaP as String
        
        
        var color: UIColor = UIColor(red: 62/255, green: 93/255, blue: 132/255, alpha: 1.0)
        
        self.navigationController?.navigationBar.barTintColor = color
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        //self.navigationController?.navigationBar.titleTextAttributes = titleDict as NSObject
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfXmlProyectosP.count
    }
    
   override func tableView(tableView:UITableView, heightForRowAtIndexPath indexPath:NSIndexPath)->CGFloat
    {
        return 250
        //return UITableViewAutomaticDimension;
        
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
    
        return UITableViewAutomaticDimension
        
    }
    
    func configureTableView() {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 160.0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : TableViewControllerProyectosCell = tableView.dequeueReusableCellWithIdentifier("ProyectoCell", forIndexPath: indexPath) as! TableViewControllerProyectosCell
        
        let proyecto = arrayOfXmlProyectosP[indexPath.row]
        
        cell.LabelNombre.text = proyecto.proyecto_nombre
        cell.LabelTipoActo.text = proyecto.legislacion_nombre
        cell.LabelProponente.text = proyecto.diputado_nombre
        cell.LabelSesion.text = proyecto.fecha_creacion
        cell.LabelStatus.text = proyecto.status_nombre
        cell.LabelPrimerDebate.text = proyecto.tipo_debate_nombre
        cell.LabelDescripcion.text = proyecto.proyecto_descripcion
        cell.LabelDescripcion.lineBreakMode = .ByWordWrapping ;
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        let svc = segue.destinationViewController as! TableViewControllerIntervenciones;
        
        if (segue.identifier == "viewIntervenciones") {
            
            
            let indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow!
            let proyecto : XmlProyectos = arrayOfXmlProyectosP[indexPath.row]
            
            var arrayOfXmlIntervencionesilter :[XmlIntervenciones] = [XmlIntervenciones]()
            
            svc.id_sesion_proyecto = proyecto.id_sesion_proyecto
            
            for item in arrayOfXmlIntervencionesP {
                if(item.id_sesion_proyecto == proyecto.id_sesion_proyecto){
                    arrayOfXmlIntervencionesilter.append(item)
                }
            }
            
            svc.arrayOfXmlIntervenciones = arrayOfXmlIntervencionesilter
        }
    }
    
    
    
    
    
}
