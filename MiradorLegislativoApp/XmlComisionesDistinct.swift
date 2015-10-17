//
//  XmlComisionesDistinct.swift
//  MiradorLegislativoApp
//
//  Created by mac on 24/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import Foundation

class XmlComisionesDistinct : NSObject, NSCoding {
    
    var id_comision_dictaminadora = ""
    var comision_dictaminadora_nombre = ""
    var descripcion_corta = ""
    var descripcion_larga = ""
    var imagen = ""
    var activo = ""
    var comision_dictaminadora_nombre_lower = ""
    
    
    
    init(id_comision_dictaminadora : String,comision_dictaminadora_nombre : String,descripcion_corta : String,descripcion_larga : String,imagen : String,activo : String,comision_dictaminadora_nombre_lower : String){
        
        self.id_comision_dictaminadora = id_comision_dictaminadora
        self.comision_dictaminadora_nombre = comision_dictaminadora_nombre
        self.descripcion_corta = descripcion_corta
        self.descripcion_larga = descripcion_larga
        self.imagen = imagen
        self.activo = activo
        self.comision_dictaminadora_nombre_lower = comision_dictaminadora_nombre_lower
        
    }
    
    required init?(coder decoder: NSCoder) {
        self.id_comision_dictaminadora = decoder.decodeObjectForKey("id_comision_dictaminadora") as! String
        self.comision_dictaminadora_nombre = decoder.decodeObjectForKey("comision_dictaminadora_nombre") as! String
        self.descripcion_corta = decoder.decodeObjectForKey("descripcion_corta") as! String
        self.descripcion_larga = decoder.decodeObjectForKey("descripcion_larga") as! String
        self.imagen = decoder.decodeObjectForKey("imagen") as! String
        self.activo = decoder.decodeObjectForKey("activo") as! String
        self.comision_dictaminadora_nombre_lower = decoder.decodeObjectForKey("comision_dictaminadora_nombre_lower") as! String
        
        super.init()
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.id_comision_dictaminadora, forKey: "id_comision_dictaminadora")
        coder.encodeObject(self.comision_dictaminadora_nombre, forKey: "comision_dictaminadora_nombre")
        coder.encodeObject(self.descripcion_corta, forKey: "descripcion_corta")
        coder.encodeObject(self.descripcion_larga, forKey: "descripcion_larga")
        coder.encodeObject(self.imagen, forKey: "imagen")
        coder.encodeObject(self.activo, forKey: "activo")
        coder.encodeObject(self.comision_dictaminadora_nombre_lower, forKey: "comision_dictaminadora_nombre_lower")
        
    }
    

    
    
}