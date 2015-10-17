//
//  ViewControllerFilterProject.swift
//  MiradorLegislativoApp
//
//  Created by mac on 23/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class ViewControllerFilterProject: UIViewController {
    
    
    var arrayOfXmlSesiones :[XmlSesiones] = [XmlSesiones]()
    var arrayOfXmlTipoActos :[XmlTipoActos] = [XmlTipoActos]()
    var arrayOfXmlDebates :[XmlDebates] = [XmlDebates]()
    var arrayOfXmlStatus :[XmlEstatus] = [XmlEstatus]()
    var arrayOfXmlProponentes :[XmlProponentes] = [XmlProponentes]()
    var arrayOfXmlPartidos :[XmlPartidos] = [XmlPartidos]()
    var arrayOfXmlComisiones :[XmlComisionesDistinct] = [XmlComisionesDistinct]()
    var arrayOfXmlProyectos :[XmlProyectos] = [XmlProyectos]()
    var arrayOfXmlIntervenciones :[XmlIntervenciones] = [XmlIntervenciones]()
    
    
    
    
    @IBOutlet weak var LabelActo: UITextField!
    @IBOutlet weak var LabelSesion: UITextField!
    @IBOutlet weak var LabelTipoActo: UITextField!
    @IBOutlet weak var LabelDebate: UITextField!
    @IBOutlet weak var LabelStatus: UITextField!
    @IBOutlet weak var LabelComision: UITextField!
    @IBOutlet weak var LabelPartido: UITextField!
    @IBOutlet weak var LabelProponente: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LabelActo.text = ""
        LabelSesion.text = ""
        LabelTipoActo.text = ""
        LabelDebate.text = ""
        LabelStatus.text = ""
        LabelComision.text = ""
        LabelPartido.text = ""
        LabelProponente.text = ""
        
    }
    
    @IBAction func enviar(sender: UIButton) {
        
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let user:String = prefs.stringForKey("USERNAME")!

        
        var appendString1 = ""
        
        if(ProyecFiltro.status != ""){
            appendString1 = appendString1 + " status_nombre = '" + ProyecFiltro.status + "'"
            
        }
         
        if(ProyecFiltro.sesion != ""){
            if(appendString1 == ""){
                appendString1 = appendString1 + " fecha_creacion = '" + ProyecFiltro.sesion + "'"
            }else{
                appendString1 = appendString1 + " AND fecha_creacion = '" + ProyecFiltro.sesion + "'"
            }
        }
        
        if(ProyecFiltro.tipoActo != ""){
            if(appendString1 == ""){
                appendString1 = appendString1 + " legislacion_nombre = '" + ProyecFiltro.tipoActo + "'"
            }else{
                appendString1 = appendString1 + " AND legislacion_nombre = '" + ProyecFiltro.tipoActo + "'"
            }
        }
        
        if(ProyecFiltro.debate != ""){
            if(appendString1 == ""){
                appendString1 = appendString1 + " tipo_debate_nombre = '" + ProyecFiltro.debate + "'"
            }else{
                appendString1 = appendString1 + " AND tipo_debate_nombre = '" + ProyecFiltro.debate + "'"
            }
        }
      
        if(ProyecFiltro.comision != ""){
            if(appendString1 == ""){
                appendString1 = appendString1 + " comision_dictaminadora_nombre = '" + ProyecFiltro.comision + "'"
            }else{
                appendString1 = appendString1 + " AND comision_dictaminadora_nombre = '" + ProyecFiltro.comision + "'"
            }
        }
        
        if(ProyecFiltro.partido != ""){
            if(appendString1 == ""){
                appendString1 = appendString1 + " partido_nombre = '" + ProyecFiltro.partido + "'"
            }else{
                appendString1 = appendString1 + " AND partido_nombre = '" + ProyecFiltro.partido + "'"
            }
        }
        
        if(ProyecFiltro.proponente != "" ){
            if(appendString1 == ""){
                appendString1 = appendString1 + " diputado_nombre = '" + ProyecFiltro.proponente + "'"
            }else{
                appendString1 = appendString1 + " AND diputado_nombre = '" + ProyecFiltro.proponente + "'"
            }
        }
        
        if(ProyecFiltro.acto != "" ){
            if(appendString1 == ""){
                appendString1 = appendString1 + " proyecto_nombre = '" + ProyecFiltro.acto + "'"
            }else{
                appendString1 = appendString1 + " AND proyecto_nombre = '" + ProyecFiltro.acto + "'"
            }
        }


       
        let post:NSString = "<tem:filtro>\(appendString1)</tem:filtro><tem:usuario>\(Variables.user)</tem:usuario>"
        
        
        let soapMessage1 = "<?xml version='1.0' encoding='utf-8'?><soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:tem='http://tempuri.org/'><soapenv:Header/><soapenv:Body><tem:enviar_email>\(post)</tem:enviar_email></soapenv:Body></soapenv:Envelope>"
        
        
        let urlString = "http://miradorlegislativo.com/monitorservice.asmx"
        
        let url = NSURL(string: urlString)
        
        let theRequest = NSMutableURLRequest(URL: url!)
        
        let msgLength = String(soapMessage1.characters.count)
        
        NSLog(soapMessage1);
        
        
        theRequest.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        theRequest.addValue(msgLength, forHTTPHeaderField: "Content-Length")
        theRequest.HTTPMethod = "POST"
        theRequest.HTTPBody = soapMessage1.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) // or false
        
        let connection = NSURLConnection(request: theRequest, delegate: self, startImmediately: true)
        connection?.start();
        
        
        if (connection == true) {
            var mutableData : Void = NSMutableData.initialize()
        }
        
        
        
        
        
    }
    
    
    // NSURL
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
    }
    
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        
        
        NSLog("Success: %ld", "Success");
        
        var error_msg:NSString
        
        let alertView:UIAlertView = UIAlertView()
        alertView.title = "Reporte enviado"
        alertView.message = "Exito"
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
        
        
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Reportes"
        
        
        var color: UIColor = UIColor(red: 62/255, green: 93/255, blue: 132/255, alpha: 1.0)
        
        self.navigationController?.navigationBar.barTintColor = color
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        //self.navigationController?.navigationBar.titleTextAttributes = titleDict as [NSObject : AnyObject]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        LabelActo.text = ProyecFiltro.acto
        LabelSesion.text = ProyecFiltro.sesion
        LabelTipoActo.text = ProyecFiltro.tipoActo
        LabelDebate.text = ProyecFiltro.debate
        LabelStatus.text = ProyecFiltro.status
        LabelComision.text = ProyecFiltro.comision
        LabelPartido.text = ProyecFiltro.partido
        LabelProponente.text = ProyecFiltro.proponente
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        ProyecFiltro.acto = LabelActo.text!
        ProyecFiltro.sesion = LabelSesion.text!
        ProyecFiltro.tipoActo = LabelTipoActo.text!
        ProyecFiltro.debate = LabelDebate.text!
        ProyecFiltro.status = LabelStatus.text!
        ProyecFiltro.comision = LabelComision.text!
        ProyecFiltro.partido = LabelPartido.text!
        ProyecFiltro.proponente = LabelProponente.text!

        
        if (segue.identifier == "viewProyectos") {
            let svc = segue.destinationViewController as! TableViewControllerProyectosP;
            
            var arrayOfXmlProyectosFilter :[XmlProyectos] = [XmlProyectos]()
            
            var status = NSString()
    
            
            
            for item in arrayOfXmlProyectos {
                status = "S"
                
                if(ProyecFiltro.status != ""){
                    if(item.status_nombre != ProyecFiltro.status ){
                        status = "N"
                    } 
                }
                if(ProyecFiltro.sesion != "" && status == "S"){
                    if(item.fecha_creacion != ProyecFiltro.sesion ){
                        status = "N"
                    }
                }
                if(ProyecFiltro.tipoActo != "" && status == "S"){
                    if(item.legislacion_nombre != ProyecFiltro.tipoActo ){
                        status = "N"
                    }
                }
                if(ProyecFiltro.debate != "" && status == "S"){
                    if(item.tipo_debate_nombre != ProyecFiltro.debate ){
                        status = "N"
                    }
                }
                if(ProyecFiltro.comision != "" && status == "S"){
                    if(item.comision_dictaminadora_nombre != ProyecFiltro.comision ){
                        status = "N"
                    }
                }
                if(ProyecFiltro.partido != "" && status == "S"){
                    if(item.partido_nombre != ProyecFiltro.partido ){
                        status = "N"
                    }
                }
                if(ProyecFiltro.proponente != "" && status == "S"){
                    if(item.diputado_nombre != ProyecFiltro.proponente ){
                        status = "N"
                    }
                }
                
                if(ProyecFiltro.acto != "" ){
                    if(item.proyecto_nombre != ProyecFiltro.acto ){
                        status = "N"
                    }
                }
                
                if  (status == "S") {
                    arrayOfXmlProyectosFilter.append(item)
                }
                
                
                
            }
            
            svc.arrayOfXmlProyectosP = arrayOfXmlProyectosFilter
            svc.arrayOfXmlIntervencionesP = arrayOfXmlIntervenciones
            
        }
        
        
    }
    
    
    
    
}
