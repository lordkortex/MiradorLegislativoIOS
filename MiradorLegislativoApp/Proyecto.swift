//
//  Proyecto.swift
//  MiradorLegislativoApp
//
//  Created by mac on 23/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import Foundation

class Proyecto  {
    
    var nombre = ""
    var descripcion = ""
    var acto = ""
    var sesion = ""
    var tipoActo = ""
    var debate = ""
    var status = ""
    var comision = ""
    var partido = ""
    var proponente = ""
    
    init(nombre : String,descripcion : String,acto : String,sesion : String,tipoActo : String,debate : String,status : String,comision : String,partido : String,proponente : String){
        
        self.nombre = nombre
        self.descripcion = descripcion
        self.acto = acto
        self.sesion = sesion
        self.tipoActo = tipoActo
        self.debate = debate
        self.status = status
        self.comision = comision
        self.partido = partido
        self.proponente = proponente
        
    }
    
}