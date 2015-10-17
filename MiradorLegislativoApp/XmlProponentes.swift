//
//  XmlProponentes.swift
//  MiradorLegislativoApp
//
//  Created by mac on 24/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import Foundation

class XmlProponentes : NSObject, NSCoding {
    
    
    var id_diputado = ""
    var diputado_nombre = ""
    var partido_nombre = ""
    var descripcion_corta = ""
    var descripcion_larga = ""
    var diputado_imagen = ""
    var diputado_nombre_lower = ""
    
    
    
    init(id_diputado : String,diputado_nombre : String,partido_nombre : String,descripcion_corta : String,descripcion_larga : String,diputado_imagen : String,diputado_nombre_lower : String){
        
        self.id_diputado = id_diputado
        self.diputado_nombre = diputado_nombre
        self.partido_nombre = partido_nombre
        self.descripcion_corta = descripcion_corta
        self.descripcion_larga = descripcion_larga
        self.diputado_imagen = diputado_imagen
        self.diputado_nombre_lower = diputado_nombre_lower
        
    }
    
    required init?(coder decoder: NSCoder) {
        self.id_diputado = decoder.decodeObjectForKey("id_diputado") as! String
        self.diputado_nombre = decoder.decodeObjectForKey("diputado_nombre") as! String
        self.partido_nombre = decoder.decodeObjectForKey("partido_nombre") as! String
        self.descripcion_corta = decoder.decodeObjectForKey("descripcion_corta") as! String
        self.descripcion_larga = decoder.decodeObjectForKey("descripcion_larga") as! String
        self.diputado_imagen = decoder.decodeObjectForKey("diputado_imagen") as! String
        self.diputado_nombre_lower = decoder.decodeObjectForKey("diputado_nombre_lower") as! String
        
        super.init()
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.id_diputado, forKey: "id_diputado")
        coder.encodeObject(self.diputado_nombre, forKey: "diputado_nombre")
        coder.encodeObject(self.partido_nombre, forKey: "partido_nombre")
        coder.encodeObject(self.descripcion_corta, forKey: "descripcion_corta")
        coder.encodeObject(self.descripcion_larga, forKey: "descripcion_larga")
        coder.encodeObject(self.diputado_imagen, forKey: "diputado_imagen")
        coder.encodeObject(self.diputado_nombre_lower, forKey: "diputado_nombre_lower")
    }

    
    
}