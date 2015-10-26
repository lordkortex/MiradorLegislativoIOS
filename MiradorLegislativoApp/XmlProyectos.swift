//
//  XmlProyectos.swift
//  MiradorLegislativoApp
//
//  Created by mac on 24/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import Foundation


class XmlProyectos : NSObject, NSCoding {
    
    var id_proyecto = ""
    var proyecto_nombre = ""
    var id_sesiones = ""
    var sesion_nombre = ""
    var id_sesion_proyecto = ""
    var legislacion_nombre = ""
    var diputado_nombre = ""
    var comision_dictaminadora_nombre = ""
    var status_nombre = ""
    var fecha_creacion = "" 
    var tipo_debate_nombre = ""
    var partido_nombre = ""
    var proyecto_descripcion = ""
    
    
    init(id_proyecto : String,
        proyecto_nombre : String,
        id_sesiones : String,
        sesion_nombre : String,
        id_sesion_proyecto : String,
        legislacion_nombre : String,
        diputado_nombre : String,
        comision_dictaminadora_nombre : String,
        status_nombre : String,
        fecha_creacion : String,
        tipo_debate_nombre : String,
        partido_nombre : String,
        proyecto_descripcion : String
        )
    {
        
        self.id_proyecto = id_proyecto
        self.proyecto_nombre = proyecto_nombre
        self.id_sesiones = id_sesiones
        self.sesion_nombre = sesion_nombre
        self.id_sesion_proyecto = id_sesion_proyecto
        self.legislacion_nombre = legislacion_nombre
        self.diputado_nombre = diputado_nombre
        self.comision_dictaminadora_nombre = comision_dictaminadora_nombre
        self.status_nombre = status_nombre
        self.fecha_creacion = fecha_creacion
        self.tipo_debate_nombre = tipo_debate_nombre
        self.partido_nombre = partido_nombre
        self.proyecto_descripcion = proyecto_descripcion
        
        
    }
    
    required init?(coder decoder: NSCoder) {
        self.id_proyecto = decoder.decodeObjectForKey("id_proyecto") as! String
        self.proyecto_nombre = decoder.decodeObjectForKey("proyecto_nombre") as! String
        self.id_sesiones = decoder.decodeObjectForKey("id_sesiones") as! String
        self.sesion_nombre = decoder.decodeObjectForKey("sesion_nombre") as! String
        self.id_sesion_proyecto = decoder.decodeObjectForKey("id_sesion_proyecto") as! String
        self.legislacion_nombre = decoder.decodeObjectForKey("legislacion_nombre") as! String
        self.diputado_nombre = decoder.decodeObjectForKey("diputado_nombre") as! String
        self.comision_dictaminadora_nombre = decoder.decodeObjectForKey("comision_dictaminadora_nombre") as! String
        self.status_nombre = decoder.decodeObjectForKey("status_nombre") as! String
        self.fecha_creacion = decoder.decodeObjectForKey("fecha_creacion") as! String
        self.tipo_debate_nombre = decoder.decodeObjectForKey("tipo_debate_nombre") as! String
        self.partido_nombre = decoder.decodeObjectForKey("partido_nombre") as! String
        self.proyecto_descripcion = decoder.decodeObjectForKey("proyecto_descripcion") as! String
        super.init()
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.id_proyecto, forKey: "id_proyecto")
        coder.encodeObject(self.proyecto_nombre, forKey: "proyecto_nombre")
        coder.encodeObject(self.id_sesiones, forKey: "id_sesiones")
        coder.encodeObject(self.sesion_nombre, forKey: "sesion_nombre")
        coder.encodeObject(self.id_sesion_proyecto, forKey: "id_sesion_proyecto")
        coder.encodeObject(self.legislacion_nombre, forKey: "legislacion_nombre")
        coder.encodeObject(self.diputado_nombre, forKey: "diputado_nombre")
        coder.encodeObject(self.comision_dictaminadora_nombre, forKey: "comision_dictaminadora_nombre")
        coder.encodeObject(self.status_nombre, forKey: "status_nombre")
        coder.encodeObject(self.fecha_creacion, forKey: "fecha_creacion")
        coder.encodeObject(self.tipo_debate_nombre, forKey: "tipo_debate_nombre")
        coder.encodeObject(self.partido_nombre, forKey: "partido_nombre")
        coder.encodeObject(self.proyecto_descripcion, forKey: "proyecto_descripcion")
        
    }

    
}