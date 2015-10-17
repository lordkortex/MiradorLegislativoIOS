//
//  Partido.swift
//  MiradorLegislativoApp
//
//  Created by mac on 23/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import Foundation

class Partido  {
    
    var diputado = ""
    var partido = ""
    var sesion = ""
    var proyectoNombre = ""
    var intervencion = ""
    
    init(diputado : String,partido : String,sesion : String,proyectoNombre : String,intervencion : String){
        
        self.diputado = diputado
        self.partido = partido
        self.sesion = sesion
        self.proyectoNombre = proyectoNombre
        self.intervencion = intervencion
        
    }
    
}