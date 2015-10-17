//
//  ModelStructParser.swift
//  MiradorLegislativoApp
//
//  Created by mac on 15/9/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import Foundation


struct ModelStructParser {
    
    static var elements = NSMutableDictionary()
    static var element = NSString()
    
    
    static var arrayOfXmlSesiones :[XmlSesiones] = [XmlSesiones]()
    static var sesion_nombre = NSMutableString()
    static var id = NSMutableString()
    static var descripcion_corta = NSMutableString()
    static var descripcion_larga = NSMutableString()
    
    
    static var arrayOfXmlProyectos :[XmlProyectos] = [XmlProyectos]()
    
    static var id_proyecto = NSMutableString()
    static var proyecto_nombre = NSMutableString()
    static var id_sesiones = NSMutableString()
    static var id_sesion_proyecto = NSMutableString()
    static var legislacion_nombre = NSMutableString()
    static var diputado_nombre = NSMutableString()
    static var comision_dictaminadora_nombre = NSMutableString()
    static var status_nombre = NSMutableString()
    static var fecha_creacion = NSMutableString()
    static var tipo_debate_nombre = NSMutableString()
    static var partido_nombre = NSMutableString()
    static var proyecto_descripcion = NSMutableString()
    
    static var arrayOfXmlIntervenciones :[XmlIntervenciones] = [XmlIntervenciones]()
    
    static var id_detalle_intervencion = NSMutableString()
    static var id_diputado = NSMutableString()
    static var id_partido = NSMutableString()
    static var partido_imagen = NSMutableString()
    static var intervencion_texto = NSMutableString()
    static var intervencion_fecha_creacion = NSMutableString()
    static var diputado_imagen = NSMutableString()
    static var id_sesion = NSMutableString()
    
    
    static var arrayOfXmlTipoActos :[XmlTipoActos] = [XmlTipoActos]()
    static var id_legislacion = NSMutableString()
    
    static var arrayOfXmlDebates :[XmlDebates] = [XmlDebates]()
    static var id_tipo_debate = NSMutableString()
    
    static var arrayOfXmlStatus :[XmlEstatus] = [XmlEstatus]()
    static var id_status = NSMutableString()
    
    static var arrayOfXmlProponentes :[XmlProponentes] = [XmlProponentes]()
    static var diputado_nombre_lower = NSMutableString()
    
    static var arrayOfXmlPartidos :[XmlPartidos] = [XmlPartidos]()
    static var Data = NSMutableString()
    
    static var arrayOfXmlComisiones :[XmlComisiones] = [XmlComisiones]()
    static var id_comision_dictaminadora = NSMutableString()
    
    static var arrayOfXmlComisionesDistinct :[XmlComisionesDistinct] = [XmlComisionesDistinct]()
    static var imagen = NSMutableString()
    static var activo = NSMutableString()
    static var comision_dictaminadora_nombre_lower = NSMutableString()
    
    
    static var arrayOfXmlProponentesPorComision :[XmlProponentesPorComision] = [XmlProponentesPorComision]()
    
    static var arrayOfXmlIntervencionesPorUsuario :[XmlIntervencionesPorUsuario] = [XmlIntervencionesPorUsuario]()
    
    
    
}
