//
//  XmlDebates.swift
//  MiradorLegislativoApp
//
//  Created by mac on 24/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import Foundation

class XmlDebates : NSObject, NSCoding {
    
    var id_tipo_debate = ""
    var tipo_debate_nombre = ""
    
    init(id_tipo_debate : String,tipo_debate_nombre : String){
        
        self.id_tipo_debate = id_tipo_debate
        self.tipo_debate_nombre = tipo_debate_nombre
        
    }
    
    
    required init?(coder decoder: NSCoder) {
        self.id_tipo_debate = decoder.decodeObjectForKey("id_tipo_debate") as! String
        self.tipo_debate_nombre = decoder.decodeObjectForKey("tipo_debate_nombre") as! String
        
        super.init()
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.id_tipo_debate, forKey: "id_tipo_debate")
        coder.encodeObject(self.tipo_debate_nombre, forKey: "tipo_debate_nombre")
        
    }

    
    
}


