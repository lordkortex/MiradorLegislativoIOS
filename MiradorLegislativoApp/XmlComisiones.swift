//
//  XmlComisiones.swift
//  MiradorLegislativoApp
//
//  Created by mac on 24/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import Foundation


class XmlComisiones : NSObject, NSCoding {
    
    
    var id_comision_dictaminadora = ""
    var comision_dictaminadora_nombre = ""
    var diputado_nombre = ""
    var partido_nombre = ""
    
    
    
    init(id_comision_dictaminadora : String,comision_dictaminadora_nombre : String,diputado_nombre : String,partido_nombre : String){
        
        self.id_comision_dictaminadora = id_comision_dictaminadora
        self.comision_dictaminadora_nombre = comision_dictaminadora_nombre
        self.diputado_nombre = diputado_nombre
        self.partido_nombre = partido_nombre
        
    }
    
    required init?(coder decoder: NSCoder) {
        self.id_comision_dictaminadora = decoder.decodeObjectForKey("id_comision_dictaminadora") as! String
        self.comision_dictaminadora_nombre = decoder.decodeObjectForKey("comision_dictaminadora_nombre") as! String
        self.diputado_nombre = decoder.decodeObjectForKey("diputado_nombre") as! String
        self.partido_nombre = decoder.decodeObjectForKey("partido_nombre") as! String
        
        super.init()
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.id_comision_dictaminadora, forKey: "id_comision_dictaminadora")
        coder.encodeObject(self.comision_dictaminadora_nombre, forKey: "comision_dictaminadora_nombre")
        coder.encodeObject(self.diputado_nombre, forKey: "diputado_nombre")
        coder.encodeObject(self.partido_nombre, forKey: "partido_nombre")
        
    }
    

    
    
}