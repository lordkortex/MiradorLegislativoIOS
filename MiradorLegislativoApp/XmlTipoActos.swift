//
//  XmlTipoActos.swift
//  MiradorLegislativoApp
//
//  Created by mac on 24/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import Foundation

class XmlTipoActos  : NSObject, NSCoding {
    
    var id_legislacion = ""
    var legislacion_nombre = ""
    
    init(id_legislacion : String,legislacion_nombre : String){
        
        self.id_legislacion = id_legislacion
        self.legislacion_nombre = legislacion_nombre
        
    }
    
    required init?(coder decoder: NSCoder) {
        self.id_legislacion = decoder.decodeObjectForKey("id_legislacion") as! String
        self.legislacion_nombre = decoder.decodeObjectForKey("legislacion_nombre") as! String
        
        super.init()
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.id_legislacion, forKey: "id_legislacion")
        coder.encodeObject(self.legislacion_nombre, forKey: "legislacion_nombre")
        
    }

    
}