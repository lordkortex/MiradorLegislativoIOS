//
//  ViewControllerDashboardPartidos.swift
//  MiradorLegislativoApp
//
//  Created by mac on 25/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit
 
class ViewControllerDashboardPartidos: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelNombre: UILabel!
    @IBOutlet weak var labelPartido: UILabel!
    @IBOutlet weak var labelDescripcion: UILabel!
    
    var imageCache = [String:UIImage]()

    
    var arrayOfXmlProyectosFilter :[XmlProyectos] = [XmlProyectos]()
    var arrayOfXmlDiputadosFilter :[XmlProponentes] = [XmlProponentes]()
    var arrayOfXmlIntervencionesFilter :[XmlIntervenciones] = [XmlIntervenciones]()
     
    
    var linea1 = NSString()
    var linea2 = NSString()
    var linea3 = NSString()
    var diputado_imagen = NSString()


    
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSLog("diputado_imagen: %@",diputado_imagen);
        
        var urlString: NSString = diputado_imagen as NSString
        var imgURL  = NSURL(string: urlString as String)
        
        self.imageView.image = UIImage(named: "ico_diputados")
        
        NSLog("Url: %@",urlString);
        
        if let img = imageCache[urlString as String] {
            self.imageView.image = img
        }
        else {
            let request: NSURLRequest = NSURLRequest(URL: imgURL!)
            let mainQueue = NSOperationQueue.mainQueue()
            NSURLConnection.sendAsynchronousRequest(request, queue: mainQueue, completionHandler: { (response, data, error) -> Void in
                if error == nil {
                    let image = UIImage(data: data!)
                    self.imageCache[urlString as String] = image
                    dispatch_async(dispatch_get_main_queue(), {
                        self.imageView.image = image
                    })
                }
                else {
                    print("Error: \(error!.localizedDescription)")
                }
            })
        }

        
        labelNombre.text = linea1 as String
        labelPartido.text = linea2 as String
        labelDescripcion.text = linea3 as String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
 
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        
        if (segue.identifier == "viewProyectos") {
            let svc = segue.destinationViewController as! TableViewControllerProyectosP;
            svc.arrayOfXmlProyectosP = arrayOfXmlProyectosFilter
            svc.arrayOfXmlIntervencionesP = arrayOfXmlIntervencionesFilter
        }
        
        if (segue.identifier == "viewDiputados") {
            let svc = segue.destinationViewController as! TableViewControllerDiputados;
            svc.arrayOfXmlIntervenciones = arrayOfXmlIntervencionesFilter
            svc.arrayOfXmlProponente = arrayOfXmlDiputadosFilter
            svc.arrayOfXmlProyectos = arrayOfXmlProyectosFilter
        }
        
    }

}
