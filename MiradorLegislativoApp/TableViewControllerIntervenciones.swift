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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    override func tableView(tableView:UITableView, heightForRowAtIndexPath indexPath:NSIndexPath)->CGFloat
    {
        return 150
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell : TableViewControllerIntervencionesCellP = tableView.dequeueReusableCellWithIdentifier("IntervencionCell", forIndexPath: indexPath) as! TableViewControllerIntervencionesCellP
        
       let intervencion = arrayOfXmlIntervenciones[indexPath.row]
        
        cell.labelDiputado.text = intervencion.diputado_nombre
        cell.labelPartido.text = intervencion.partido_nombre
        cell.labelFecha.text = intervencion.intervencion_fecha_creacion
        cell.LabelDescripcion.text = intervencion.proyecto_nombre
        cell.LabelDetalle.text = intervencion.intervencion_texto
        cell.LabelDetalle.lineBreakMode = .ByWordWrapping ;
        
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //let selectedItem = items.objectAtIndex(indexPath.row) as String
        //let itemId = selectedItem.componentsSeparatedByString("$%^")
        // add to self.selectedItems
        //selectedItems[itemId[1]] = true
    }
    
    

}
