//
//  ViewController.swift
//  MiradorLegislativoApp
//
//  Created by mac on 22/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class ViewController: UIViewController , NSURLConnectionDelegate, NSXMLParserDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
              
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Menu"
        
        
        var color: UIColor = UIColor(red: 62/255, green: 93/255, blue: 132/255, alpha: 1.0)
        
        self.navigationController?.navigationBar.barTintColor = color
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        //self.navigationController?.navigationBar.titleTextAttributes = titleDict as [NSObject : AnyObject]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        
        
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let isLoggedIn:Int? = prefs.integerForKey("ISLOGGEDIN") as Int
        if (isLoggedIn != 0 || isLoggedIn == nil)  {
            self.performSegueWithIdentifier("gotoLogin", sender: self)
        }
        
        ProyecFiltro.acto = ""
        ProyecFiltro.comision = ""
        ProyecFiltro.debate = ""
        ProyecFiltro.partido = ""
        ProyecFiltro.proponente = ""
        ProyecFiltro.sesion = ""
        ProyecFiltro.status = ""
        ProyecFiltro.tipoActo = ""
        
        
      }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
 
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
 
        if (segue.identifier == "viewSesiones") {
            let svc = segue.destinationViewController as! TableViewControllerSesiones;
            
        
            var arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlSesionesName)!
            svc.arrayOfXmlSesiones = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlSesiones]
            
            arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlProyectosName)!
            svc.arrayOfXmlProyectos = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlProyectos]
            //svc.arrayOfXmlProyectos = Variables.arrayOfXmlProyectos
        
            arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlIntervencionesName)!
            svc.arrayOfXmlIntervenciones = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlIntervenciones]
        
        }
          
         
        if (segue.identifier == "viewReportes") {
            let svc = segue.destinationViewController as! ViewControllerFilterProject;
            
     
            var arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlSesionesName)!
            svc.arrayOfXmlSesiones = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlSesiones]
            //svc.arrayOfXmlSesiones = Variables.arrayOfXmlSesiones
            //svc.arrayOfXmlSesiones = ModelStructParser.arrayOfXmlSesiones
   
            arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlProyectosName)!
            svc.arrayOfXmlProyectos = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlProyectos]
            //svc.arrayOfXmlTipoActos = Variables.arrayOfXmlTipoActos
            
            arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlIntervencionesName)!
            svc.arrayOfXmlIntervenciones = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlIntervenciones]
            //svc.arrayOfXmlTipoActos = Variables.arrayOfXmlTipoActos
       
            
            arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlTipoActosName)!
            svc.arrayOfXmlTipoActos = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlTipoActos]
            //svc.arrayOfXmlTipoActos = Variables.arrayOfXmlTipoActos
            
            
            arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlDebatesName)!
            svc.arrayOfXmlDebates = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlDebates]
            //svc.arrayOfXmlDebates = Variables.arrayOfXmlDebates
            
            arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlStatusName)!
            svc.arrayOfXmlStatus = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlEstatus]
            //svc.arrayOfXmlStatus = Variables.arrayOfXmlStatus
            
            arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlProponentesName)!
            svc.arrayOfXmlProponentes = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlProponentes]
            //svc.arrayOfXmlProponentes = Variables.arrayOfXmlProponentes
            
            arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlPartidosName)!
            svc.arrayOfXmlPartidos = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlPartidos]
            //svc.arrayOfXmlPartidos = Variables.arrayOfXmlPartidos
            
            arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlComisionesName)!
            svc.arrayOfXmlComisiones = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlComisionesDistinct]
            //svc.arrayOfXmlComisiones = Variables.arrayOfXmlComisionesDistinct
            
            NSLog("arrayOfXmlSesiones ==> %@", "\(svc.arrayOfXmlSesiones.count)"  );
            NSLog("arrayOfXmlTipoActos ==> %@", "\(svc.arrayOfXmlTipoActos.count)"  );
            NSLog("arrayOfXmlDebates ==> %@", "\(svc.arrayOfXmlDebates.count)"  );
            NSLog("arrayOfXmlStatus ==> %@", "\(svc.arrayOfXmlStatus.count)"  );
            NSLog("arrayOfXmlProponentes ==> %@", "\(svc.arrayOfXmlProponentes.count)"  );
            NSLog("arrayOfXmlPartidos ==> %@", "\(svc.arrayOfXmlPartidos.count)"  );
            NSLog("arrayOfXmlComisiones ==> %@", "\(svc.arrayOfXmlComisiones.count)"  );
            
            
            
        }
        
        
        
        
        if (segue.identifier == "viewDiputados") {
            let svc = segue.destinationViewController as! TableViewControllerDiputados;
            
            var arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlProponentesName)!
            svc.arrayOfXmlProponente = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlProponentes]
            
            arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlProyectosName)!
            svc.arrayOfXmlProyectos = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlProyectos]
            
            arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlIntervencionesName)!
            svc.arrayOfXmlIntervenciones = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlIntervenciones]
            
            
        }
        
        
        if (segue.identifier == "viewPartidos") {
            let svc = segue.destinationViewController as! TableViewControllerPartidos;
            
            var arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlPartidosName)!
            svc.arrayOfXmlPartidos = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlPartidos]
            
            arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlProyectosName)!
            svc.arrayOfXmlProyectos = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlProyectos]
            
            arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlIntervencionesName)!
            svc.arrayOfXmlIntervenciones = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlIntervenciones]
            
            arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlProponentesName)!
            svc.arrayOfXmlProponentes = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlProponentes]
            
            //NSLog("someInts is of type [Int] with \(Variables.arrayOfXmlIntervenciones.count) items.");
            
            
            
        }
        
        if (segue.identifier == "viewComisiones") {
            let svc = segue.destinationViewController as! TableViewControllerComisiones;
  
            var arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlComisionesDistinctName)!
            svc.arrayOfXmlComisionesDistinct = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlComisionesDistinct]
  
            
            arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlProyectosName)!
            svc.arrayOfXmlProyectos = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlProyectos]
            
            arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlIntervencionesName)!
            svc.arrayOfXmlIntervenciones = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlIntervenciones]
            
            arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlProponentesPorComisionName)!
            svc.arrayOfXmlProponentes = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlProponentesPorComision]
            
        }
        
        if (segue.identifier == "viewNotificaciones") {
            let svc = segue.destinationViewController as! TableViewControllerNotificaciones;
            
            let arrayOfObjectsUnarchivedData = prefs.dataForKey(Variables.arrayOfXmlIntervencionesPorUsuarioName)!
            svc.arrayOfXmlIntervenciones = NSKeyedUnarchiver.unarchiveObjectWithData(arrayOfObjectsUnarchivedData) as! [XmlIntervencionesPorUsuario]
            
        }
        
        
        if (segue.identifier == "gotoLogin") {
            let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
            prefs.setObject("", forKey: Variables.username)
            prefs.setObject("", forKey: Variables.password)
            prefs.setInteger(1, forKey: "ISLOGGEDIN")
            prefs.synchronize()
            
                     
        }
        
    }
    
    
    }

