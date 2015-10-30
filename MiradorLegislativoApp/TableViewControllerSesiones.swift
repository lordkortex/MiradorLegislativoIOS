//
//  TableViewControllerSesiones.swift
//  MiradorLegislativoApp
//
//  Created by mac on 23/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerSesiones: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate, NSURLConnectionDelegate, NSXMLParserDelegate{
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    var arrayOfXmlSesiones :[XmlSesiones] = [XmlSesiones]()
    var arrayOfXmlSesionesResult :[XmlSesiones] = [XmlSesiones]()
    
    var arrayOfXmlProyectos :[XmlProyectos] = [XmlProyectos]()
    var arrayOfXmlIntervenciones :[XmlIntervenciones] = [XmlIntervenciones]()
    
    var mutableData:NSMutableData  = NSMutableData()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("reloadData"), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl
        
        
    }
    
    
    func reloadData() {
        
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        let username = (NSUserDefaults.standardUserDefaults().objectForKey(Variables.username)) as! NSDictionary
        let password = (NSUserDefaults.standardUserDefaults().objectForKey(Variables.password)) as! NSDictionary
        
        let usernameText:NSString = username.valueForKey(Variables.username) as! NSString
        let passwordText:NSString = password.valueForKey(Variables.password) as! NSString
        
        
        let post:NSString = "<tem:usuario_nombre>\(usernameText)</tem:usuario_nombre><tem:password>\(passwordText)</tem:password>"
        
         
        
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
        
        
        ModelStructParser.arrayOfXmlSesiones = [XmlSesiones]()
        ModelStructParser.arrayOfXmlProyectos = [XmlProyectos]()
        ModelStructParser.arrayOfXmlIntervenciones = [XmlIntervenciones]()
        ModelStructParser.arrayOfXmlTipoActos = [XmlTipoActos]()
        ModelStructParser.arrayOfXmlDebates = [XmlDebates]()
        ModelStructParser.arrayOfXmlStatus = [XmlEstatus]()
        ModelStructParser.arrayOfXmlProponentes = [XmlProponentes]()
        ModelStructParser.arrayOfXmlPartidos = [XmlPartidos]()
        ModelStructParser.arrayOfXmlComisiones = [XmlComisiones]()
        ModelStructParser.arrayOfXmlComisionesDistinct = [XmlComisionesDistinct]()
        ModelStructParser.arrayOfXmlProponentesPorComision = [XmlProponentesPorComision]()
        ModelStructParser.arrayOfXmlIntervencionesPorUsuario  = [XmlIntervencionesPorUsuario]()
        

        if (connection == true) {
            var mutableData : Void = NSMutableData.initialize()
        }

        
     }
    
    
    
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Sesiones"
        
        
        var color: UIColor = UIColor(red: 62/255, green: 93/255, blue: 132/255, alpha: 1.0)
        
        self.navigationController?.navigationBar.barTintColor = color
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        //self.navigationController?.navigationBar.titleTextAttributes = titleDict as [NSObject : AnyObject]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String?) -> Bool {
        self.filterContentForSearchText(searchString!)
        return true
    }
    
    
    func searchDisplayController(controller: UISearchDisplayController!,
        shouldReloadTableForSearchScope searchOption: Int) -> Bool {
            //let scope = self.searchDisplayController!.searchBar.scopeButtonTitles as String
            //self.filterContentForSearchText(self.searchDisplayController!.searchBar.text, scope: scope[searchOption])
            return true
    }
    
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        self.arrayOfXmlSesionesResult = self.arrayOfXmlSesiones.filter({( sesion : XmlSesiones) -> Bool in
            //var categoryMatch = (scope == "All") || (diputado.partido_nombre == scope)
            let stringMatch = sesion.descripcion_larga.lowercaseString.rangeOfString(searchText.lowercaseString)
            return (stringMatch != nil)
        })
    }
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.arrayOfXmlSesionesResult.count ?? 0
        } else {
            return self.arrayOfXmlSesiones.count ?? 0
        }
        
        return self.arrayOfXmlSesiones.count;
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*let cell = tableView.dequeueReusableCellWithIdentifier("SessionCell") as UITableViewCell*/
        
         let cell = self.tableView.dequeueReusableCellWithIdentifier("SessionCell") as UITableViewCell!
        
        var sesion : XmlSesiones
        if tableView == self.searchDisplayController!.searchResultsTableView {
            sesion = arrayOfXmlSesionesResult[indexPath.row]
        } else {
            sesion = arrayOfXmlSesiones[indexPath.row]
        }
        
        cell.textLabel?.text = sesion.descripcion_larga
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //let selectedItem = items.objectAtIndex(indexPath.row) as String
        //let itemId = selectedItem.componentsSeparatedByString("$%^")
        // add to self.selectedItems
        //selectedItems[itemId[1]] = true
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let svc = segue.destinationViewController as! TableViewControllerProyectosP;
        
        //if (segue.identifier == "viewProyectos") {
        
        var indexPath : NSIndexPath
        var sesion : XmlSesiones
        
        if(self.tableView.indexPathForSelectedRow == nil){
            indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow!
            
            sesion  = arrayOfXmlSesionesResult[indexPath.row]
        } else {
            
            indexPath = self.tableView.indexPathForSelectedRow!
            sesion  = arrayOfXmlSesiones[indexPath.row]
        }
        
        
        var arrayOfXmlProyectosFilter :[XmlProyectos] = [XmlProyectos]()
        
        svc.sesionFechaP = sesion.descripcion_larga
        svc.sesionNombre = sesion.sesion_nombre
        
        for item in arrayOfXmlProyectos {
            if(item.sesion_nombre == sesion.sesion_nombre){
                arrayOfXmlProyectosFilter.append(item)
            }
        }
        
        svc.arrayOfXmlProyectosP = arrayOfXmlProyectosFilter
        svc.arrayOfXmlIntervencionesP = arrayOfXmlIntervenciones
        
        //}
        
        //var svc = segue.destinationViewController as TableViewControllerProyectos;
        //svc.arrayOfXmlProyectos = arrayOfXmlProyectos
        
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
            
            
            let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
            prefs.synchronize()
            
            
            arrayOfXmlSesiones = [XmlSesiones]()
            arrayOfXmlSesionesResult = [XmlSesiones]()
            
            arrayOfXmlProyectos = [XmlProyectos]()
            arrayOfXmlIntervenciones = [XmlIntervenciones]()
            
            
            arrayOfXmlSesiones = ModelStructParser.arrayOfXmlSesiones
            arrayOfXmlProyectos = ModelStructParser.arrayOfXmlProyectos
            arrayOfXmlIntervenciones = ModelStructParser.arrayOfXmlIntervenciones
            
            
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
        
        //UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
        tableView.reloadData()
        refreshControl?.endRefreshing()

        
        
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
