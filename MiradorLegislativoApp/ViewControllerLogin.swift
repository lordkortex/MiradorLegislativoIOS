//
//  ViewControllerLogin.swift
//  MiradorLegislativoApp
//
//  Created by mac on 01/08/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class ViewControllerLogin: UIViewController  , NSURLConnectionDelegate, NSXMLParserDelegate,UITextFieldDelegate  {
    
    
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var textUserName: UITextField!
    @IBOutlet weak var progressView: UIProgressView!
    
    var contador:Int = 0 {
        didSet {
            let fractionalProgress = Float(contador) / 100.0
            let animated = contador != 0
            
            progressView.setProgress(fractionalProgress, animated: animated)
        }
    }
    
    
    var mutableData:NSMutableData  = NSMutableData()
    
    
    @IBAction func login(sender: UIButton) {
        
        //Temporalmente
        /*let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let username:NSString = textUserName.text!
        let password:NSString = textPassword.text!
        prefs.setValue(username, forKey: "USERNAME")
        prefs.setValue(password, forKey: "PASSWORD")
        prefs.setInteger(0, forKey: "ISLOGGEDIN")
        prefs.synchronize()
        self.dismissViewControllerAnimated(true, completion: nil)*/
        
        
      
        
        
        let username:NSString = textUserName.text!
        let password:NSString = textPassword.text!
        
        if ( username.isEqualToString("") || password.isEqualToString("") ) {
            
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign in Failed!"
            alertView.message = "Please enter Username and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
            
        } else {
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            
            self.contador = 30;
            let fractionalProgress = Float(self.contador) / 100.0
            progressView.setProgress(fractionalProgress, animated: true)
            
            for i in 0..<100 {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
                    sleep(1)
                    dispatch_async(dispatch_get_main_queue(), {
                        self.contador++
                        if self.contador == 90{
                            self.contador = 0
                        }
                        return
                    })
                })
            }
            
            let post:NSString = "<tem:usuario_nombre>\(username)</tem:usuario_nombre><tem:password>\(password)</tem:password>"
            
            
            
            let soapMessage1 = "<?xml version='1.0' encoding='utf-8'?><soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:tem='http://tempuri.org/'><soapenv:Header/><soapenv:Body><tem:retornarSeveralTables>\(post)</tem:retornarSeveralTables></soapenv:Body></soapenv:Envelope>"
            
             
            let urlString = "http://miradorlegislativo.com/monitorservice.asmx"
            
            let url = NSURL(string: urlString)
            
            let theRequest = NSMutableURLRequest(URL: url!)
            
            let msgLength = String(soapMessage1.characters.count)
            
            NSLog("PostData: %@",soapMessage1);
            
            theRequest.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
            theRequest.addValue(msgLength, forHTTPHeaderField: "Content-Length")
            theRequest.HTTPMethod = "POST"
            theRequest.HTTPBody = soapMessage1.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) // or false
            
            let connection = NSURLConnection(request: theRequest, delegate: self, startImmediately: true)
            connection?.start();
            
            
            if (connection == true) {
                var mutableData : Void = NSMutableData.initialize()
            }else{
                
                /*let alertView:UIAlertView = UIAlertView()
                alertView.title = "Sign in Failed!"
                alertView.message = "En estos momentos no tienes conexion!!"
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()*/

            }
            
        }
        
            
        
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.setProgress(0, animated: true)
        
        textPassword.delegate = self
        textUserName.delegate = self
        
        textPassword.returnKeyType = UIReturnKeyType.Done
        textUserName.returnKeyType = UIReturnKeyType.Done
        
        // Do any additional setup after loading the view.
    }
    
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    // NSURL
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        mutableData.length = 0;
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        mutableData.appendData(data)
    }
    
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        let xmlParser = NSXMLParser(data: mutableData)
        xmlParser.delegate = self
        xmlParser.parse()
        xmlParser.shouldResolveExternalEntities = true
        //NSLog("finish ==> %@", element);
        
        let success:NSInteger = 1 as NSInteger
        
        //[jsonData[@"success"] integerValue];
        
        
        NSLog("Success: %ld", success);
        
        if ModelStructParser.arrayOfXmlProyectos.count > 0 {
            
            NSLog("Login SUCCESS");
            
            let username:NSString = textUserName.text!
            let password:NSString = textPassword.text!
            
            let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
            //prefs.setObject(username, forKey: Variables.username)
            //prefs.setObject(password, forKey: Variables.password)
            
            let dictionaryUser: NSDictionary = [Variables.username:username]
            let dictionaryPassword: NSDictionary = [Variables.password:password]
            
            NSUserDefaults.standardUserDefaults().setObject(dictionaryUser, forKey: Variables.username)
            NSUserDefaults.standardUserDefaults().setObject(dictionaryPassword, forKey: Variables.password)
            NSUserDefaults.standardUserDefaults().synchronize()
            
            
            prefs.setInteger(0, forKey: "ISLOGGEDIN")
            prefs.synchronize()
            
            /*NSUserDefaults.standardUserDefaults().setObject(username, forKey: "USERNAME")
            NSUserDefaults.standardUserDefaults().setObject(password, forKey: "PASSWORD")
            NSUserDefaults.standardUserDefaults().setInteger(0, forKey: "ISLOGGEDIN")
            NSUserDefaults.standardUserDefaults().synchronize()*/
            
            
            Variables.user = textUserName.text!
          
            //Variables.arrayOfXmlSesiones = ModelStructParser.arrayOfXmlSesiones
            var arrayOfObjectsData = NSKeyedArchiver.archivedDataWithRootObject(ModelStructParser.arrayOfXmlSesiones)
            prefs.setObject(arrayOfObjectsData, forKey: Variables.arrayOfXmlSesionesName)
            
            /*Variables.arrayOfXmlSesiones = ModelStructParser.arrayOfXmlSesiones
            arrayOfObjectsData = NSKeyedArchiver.archivedDataWithRootObject(Variables.arrayOfXmlSesiones)
            prefs.setObject(arrayOfObjectsData, forKey: Variables.arrayOfXmlSesionesName)*/
             
            
            //Variables.arrayOfXmlComisiones = ModelStructParser.arrayOfXmlComisiones
            arrayOfObjectsData = NSKeyedArchiver.archivedDataWithRootObject(ModelStructParser.arrayOfXmlComisiones)
            prefs.setObject(arrayOfObjectsData, forKey: Variables.arrayOfXmlComisionesName)
            
            //Variables.arrayOfXmlComisionesDistinct = ModelStructParser.arrayOfXmlComisionesDistinct
            arrayOfObjectsData = NSKeyedArchiver.archivedDataWithRootObject(ModelStructParser.arrayOfXmlComisionesDistinct)
            prefs.setObject(arrayOfObjectsData, forKey: Variables.arrayOfXmlComisionesDistinctName)
            
            //Variables.arrayOfXmlDebates = ModelStructParser.arrayOfXmlDebates
            arrayOfObjectsData = NSKeyedArchiver.archivedDataWithRootObject(ModelStructParser.arrayOfXmlDebates)
            prefs.setObject(arrayOfObjectsData, forKey: Variables.arrayOfXmlDebatesName)
              
            //Variables.arrayOfXmlIntervenciones = ModelStructParser.arrayOfXmlIntervenciones
            arrayOfObjectsData = NSKeyedArchiver.archivedDataWithRootObject(ModelStructParser.arrayOfXmlIntervenciones)
            prefs.setObject(arrayOfObjectsData, forKey: Variables.arrayOfXmlIntervencionesName)
            
            //Variables.arrayOfXmlIntervencionesPorUsuario = ModelStructParser.arrayOfXmlIntervencionesPorUsuario
            arrayOfObjectsData = NSKeyedArchiver.archivedDataWithRootObject(ModelStructParser.arrayOfXmlIntervencionesPorUsuario)
            prefs.setObject(arrayOfObjectsData, forKey: Variables.arrayOfXmlIntervencionesPorUsuarioName)
            
            //Variables.arrayOfXmlPartidos = ModelStructParser.arrayOfXmlPartidos
            arrayOfObjectsData = NSKeyedArchiver.archivedDataWithRootObject(ModelStructParser.arrayOfXmlPartidos)
            prefs.setObject(arrayOfObjectsData, forKey: Variables.arrayOfXmlPartidosName)
            
            //Variables.arrayOfXmlProponentes = ModelStructParser.arrayOfXmlProponentes
            arrayOfObjectsData = NSKeyedArchiver.archivedDataWithRootObject(ModelStructParser.arrayOfXmlProponentes)
            prefs.setObject(arrayOfObjectsData, forKey: Variables.arrayOfXmlProponentesName)
            
            //Variables.arrayOfXmlProponentesPorComision = ModelStructParser.arrayOfXmlProponentesPorComision
            arrayOfObjectsData = NSKeyedArchiver.archivedDataWithRootObject(ModelStructParser.arrayOfXmlProponentesPorComision)
            prefs.setObject(arrayOfObjectsData, forKey: Variables.arrayOfXmlProponentesPorComisionName)
            
            //Variables.arrayOfXmlProyectos = ModelStructParser.arrayOfXmlProyectos
            arrayOfObjectsData = NSKeyedArchiver.archivedDataWithRootObject(ModelStructParser.arrayOfXmlProyectos)
            prefs.setObject(arrayOfObjectsData, forKey: Variables.arrayOfXmlProyectosName)
            
            //Variables.arrayOfXmlStatus = ModelStructParser.arrayOfXmlStatus
            arrayOfObjectsData = NSKeyedArchiver.archivedDataWithRootObject(ModelStructParser.arrayOfXmlStatus)
            prefs.setObject(arrayOfObjectsData, forKey: Variables.arrayOfXmlStatusName)
            
            //Variables.arrayOfXmlTipoActos = ModelStructParser.arrayOfXmlTipoActos
            arrayOfObjectsData = NSKeyedArchiver.archivedDataWithRootObject(ModelStructParser.arrayOfXmlTipoActos)
            prefs.setObject(arrayOfObjectsData, forKey: Variables.arrayOfXmlTipoActosName)
            
             
            self.dismissViewControllerAnimated(true, completion: nil)
            //self.performSegueWithIdentifier("gotoLogin", sender: self)
        } else {
            var error_msg:NSString
            
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign in Failed!"
            alertView.message = "Error"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
            
        }
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
        
    }
    
    func parser(parser: NSXMLParser,didStartElement elementName: String,namespaceURI namespaceURI: String?,qualifiedName qName: String?, attributes attributeDict: [String : String])  {
            let name : NSString = elementName as NSString
            ModelParser().initializeElement(name)
    }
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        ModelParser().foundCharacters(string)
               
    }
    
    func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!)
    {
        ModelParser().endElement(elementName)
        
    }
    
    
}
