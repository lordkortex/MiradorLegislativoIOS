//
//  XmlIntervencionesPorUsuario.swift
//  MiradorLegislativoApp
//
//  Created by mac on 24/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import Foundation

class XmlIntervencionesPorUsuario: NSObject, NSCoding {
    
    var id_detalle_intervencion = ""
    var id_sesion_proyecto = ""
    var id_diputado = ""
    var id_partido = ""
    var partido_nombre = ""
    var partido_imagen = ""
    var intervencion_texto = ""
    var intervencion_fecha_creacion = ""
    var diputado_nombre = ""
    var diputado_imagen = ""
    var id_sesion = ""
    var id_proyecto = ""
    var sesion_nombre = ""
    var proyecto_nombre = ""
    
    
    init( id_detalle_intervencion : String ,id_sesion_proyecto : String ,id_diputado : String ,id_partido : String ,partido_nombre : String ,partido_imagen : String ,intervencion_texto : String ,intervencion_fecha_creacion : String ,diputado_nombre : String ,diputado_imagen : String ,id_sesion : String,id_proyecto : String,sesion_nombre : String ,proyecto_nombre : String){
        
        
        self.id_detalle_intervencion = id_detalle_intervencion
        self.id_sesion_proyecto = id_sesion_proyecto
        self.id_diputado = id_diputado
        self.id_partido = id_partido
        self.partido_nombre = partido_nombre
        self.partido_imagen = partido_imagen
        self.intervencion_texto = intervencion_texto
        self.intervencion_fecha_creacion = intervencion_fecha_creacion
        self.diputado_nombre = diputado_nombre
        self.diputado_imagen = diputado_imagen
        self.id_sesion = id_sesion
        self.id_proyecto = id_proyecto
        self.sesion_nombre = sesion_nombre
        self.proyecto_nombre = proyecto_nombre
        
    }
    
    required init?(coder decoder: NSCoder) {
        self.id_detalle_intervencion = decoder.decodeObjectForKey("id_detalle_intervencion") as! String
        self.id_sesion_proyecto = decoder.decodeObjectForKey("id_sesion_proyecto") as! String
        self.id_diputado = decoder.decodeObjectForKey("id_diputado") as! String
        self.id_partido = decoder.decodeObjectForKey("id_partido") as! String
        self.partido_nombre = decoder.decodeObjectForKey("partido_nombre") as! String
        self.partido_imagen = decoder.decodeObjectForKey("partido_imagen") as! String
        self.intervencion_texto = decoder.decodeObjectForKey("intervencion_texto") as! String
        self.intervencion_fecha_creacion = decoder.decodeObjectForKey("intervencion_fecha_creacion") as! String
        self.diputado_nombre = decoder.decodeObjectForKey("diputado_nombre") as! String
        self.diputado_imagen = decoder.decodeObjectForKey("diputado_imagen") as! String
        self.id_sesion = decoder.decodeObjectForKey("id_sesion") as! String
        self.id_proyecto = decoder.decodeObjectForKey("id_proyecto") as! String
        self.sesion_nombre = decoder.decodeObjectForKey("sesion_nombre") as! String
        self.proyecto_nombre = decoder.decodeObjectForKey("proyecto_nombre") as! String
        
        super.init()
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.id_detalle_intervencion, forKey: "id_detalle_intervencion")
        coder.encodeObject(self.id_sesion_proyecto, forKey: "id_sesion_proyecto")
        coder.encodeObject(self.id_diputado, forKey: "id_diputado")
        coder.encodeObject(self.id_partido, forKey: "id_partido")
        
        coder.encodeObject(self.partido_nombre, forKey: "partido_nombre")
        coder.encodeObject(self.partido_imagen, forKey: "partido_imagen")
        coder.encodeObject(self.intervencion_texto, forKey: "intervencion_texto")
        coder.encodeObject(self.intervencion_fecha_creacion, forKey: "intervencion_fecha_creacion")
        coder.encodeObject(self.diputado_nombre, forKey: "diputado_nombre")
        coder.encodeObject(self.diputado_imagen, forKey: "diputado_imagen")
        coder.encodeObject(self.id_sesion, forKey: "id_sesion")
        coder.encodeObject(self.id_proyecto, forKey: "id_proyecto")
        coder.encodeObject(self.sesion_nombre, forKey: "sesion_nombre")
        coder.encodeObject(self.proyecto_nombre, forKey: "proyecto_nombre")
    }

}