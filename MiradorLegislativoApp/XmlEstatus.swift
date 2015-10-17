//
//  XmlEstatus.swift
//  MiradorLegislativoApp
//
//  Created by mac on 24/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import Foundation

class XmlEstatus : NSObject, NSCoding {
    
    var id_status = ""
    var status_nombre = ""
    
    init(id_status : String,status_nombre : String){
        
        self.id_status = id_status
        self.status_nombre = status_nombre
        
    }
    
    required init?(coder decoder: NSCoder) {
        self.id_status = decoder.decodeObjectForKey("id_status") as! String
        self.status_nombre = decoder.decodeObjectForKey("status_nombre") as! String
        
        super.init()
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.id_status, forKey: "id_status")
        coder.encodeObject(self.status_nombre, forKey: "status_nombre")
        
    }

    
}