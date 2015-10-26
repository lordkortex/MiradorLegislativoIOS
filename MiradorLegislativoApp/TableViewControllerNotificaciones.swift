//
//  TableViewControllerNotificaciones.swift
//  MiradorLegislativoApp
//
//  Created by mac on 24/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerNotificaciones: UITableViewController {
    
    var arrayOfXmlIntervenciones :[XmlIntervencionesPorUsuario] = [XmlIntervencionesPorUsuario]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 80.0
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Notificaciones"
        
        
        var color: UIColor = UIColor(red: 62/255, green: 93/255, blue: 132/255, alpha: 1.0)
        
        self.navigationController?.navigationBar.barTintColor = color
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        //self.navigationController?.navigationBar.titleTextAttributes = titleDict as [NSObject : AnyObject]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
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
    
    /*override func tableView(tableView:UITableView, heightForRowAtIndexPath indexPath:NSIndexPath)->CGFloat
    {
        return 150
    }*/
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        let notificacion = arrayOfXmlIntervenciones[indexPath.row]
        
        let cell : ImageCellDiputado = tableView.dequeueReusableCellWithIdentifier("ImageCellDiputado", forIndexPath: indexPath) as! ImageCellDiputado
        
        cell.titleDiputado.text = notificacion.diputado_nombre
        cell.label1.text = notificacion.partido_nombre
        cell.label2.text = notificacion.intervencion_fecha_creacion
        cell.label3.text = notificacion.proyecto_nombre
        cell.subtitleDiputado.text = notificacion.intervencion_texto
        
        
         return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        /*var svc = segue.destinationViewController as TableViewControllerIntervenciones;
        
        if (segue.identifier == "viewIntervenciones") {
        
        
        let indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow()!
        let partido : XmlPartidos = arrayOfXmlPartidos[indexPath.row]
        
        var arrayOfXmlIntervencionesilter :[XmlIntervenciones] = [XmlIntervenciones]()
        
        svc.id_sesion_proyecto = proyecto.id_sesion_proyecto
        
        for item in arrayOfXmlIntervenciones {
        if(item.id_sesion_proyecto == proyecto.id_sesion_proyecto){
        arrayOfXmlIntervencionesilter.append(item)
        }
        }
        
        svc.arrayOfXmlIntervenciones = arrayOfXmlIntervencionesilter
        }*/
    }
}
