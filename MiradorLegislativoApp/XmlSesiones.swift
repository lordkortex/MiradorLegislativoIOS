//
//  XmlSesiones.swift
//  MiradorLegislativoApp
//
//  Created by mac on 24/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import Foundation


class XmlSesiones : NSObject, NSCoding {
    
    var sesion_nombre : String
    var id : String
    var descripcion_corta : String
    var descripcion_larga : String
    
    
    init(sesion_nombre : String,id : String,descripcion_corta : String,descripcion_larga : String){
        
        self.sesion_nombre = sesion_nombre
        self.id = id
        self.descripcion_corta = descripcion_corta
        self.descripcion_larga = descripcion_larga
        
    }
    
    required init?(coder decoder: NSCoder) {
        self.sesion_nombre = decoder.decodeObjectForKey("sesion_nombre") as! String
        self.id = decoder.decodeObjectForKey("id") as! String
        self.descripcion_corta = decoder.decodeObjectForKey("descripcion_corta") as! String
        self.descripcion_larga = decoder.decodeObjectForKey("descripcion_larga") as! String
        
        super.init()
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.sesion_nombre, forKey: "sesion_nombre")
        coder.encodeObject(self.id, forKey: "id")
        coder.encodeObject(self.descripcion_corta, forKey: "descripcion_corta")
        coder.encodeObject(self.descripcion_larga, forKey: "descripcion_larga")
        
    }
    
    
}
