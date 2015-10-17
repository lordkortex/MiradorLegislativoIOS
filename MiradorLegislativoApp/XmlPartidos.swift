//
//  XmlPartidos.swift
//  MiradorLegislativoApp
//
//  Created by mac on 24/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import Foundation

class XmlPartidos : NSObject, NSCoding {
    
    
    var id_partido = ""
    var partido_nombre = ""
    var Data = ""
    var descripcion_corta = ""
    var descripcion_larga = ""
    var partido_imagen = ""
    
    
    init(id_partido : String,partido_nombre : String,Data : String,descripcion_corta : String,descripcion_larga : String,partido_imagen : String){
        
        self.id_partido = id_partido
        self.partido_nombre = partido_nombre
        self.Data = Data
        self.descripcion_corta = descripcion_corta
        self.descripcion_larga = descripcion_larga
        self.partido_imagen = partido_imagen
        
    }
    
    required init?(coder decoder: NSCoder) {
        self.id_partido = decoder.decodeObjectForKey("id_partido") as! String
        self.partido_nombre = decoder.decodeObjectForKey("partido_nombre") as! String
        self.Data = decoder.decodeObjectForKey("Data") as! String
        self.descripcion_corta = decoder.decodeObjectForKey("descripcion_corta") as! String
        self.descripcion_larga = decoder.decodeObjectForKey("descripcion_larga") as! String
        self.partido_imagen = decoder.decodeObjectForKey("partido_imagen") as! String
        
        super.init()
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.id_partido, forKey: "id_partido")
        coder.encodeObject(self.partido_nombre, forKey: "partido_nombre")
        coder.encodeObject(self.Data, forKey: "Data")
        coder.encodeObject(self.descripcion_corta, forKey: "descripcion_corta")
        coder.encodeObject(self.descripcion_larga, forKey: "descripcion_larga")
        coder.encodeObject(self.partido_imagen, forKey: "partido_imagen")
        
    }
    

    
    
}