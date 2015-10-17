//
//  ModelParser.swift
//  MiradorLegislativoApp
//
//  Created by mac on 15/9/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import Foundation



class ModelParser {
    
    
    
    init() {
        // perform some initialization here
    }
    

    
    func initializeElement(elementName: NSString){
        
        ModelStructParser.element = elementName
        
        if (elementName as NSString).isEqualToString("xmlSesiones")
        {
            
            ModelStructParser.elements = NSMutableDictionary()
            ModelStructParser.elements = [:]
            ModelStructParser.sesion_nombre=""
            ModelStructParser.id=""
            ModelStructParser.descripcion_corta=""
            ModelStructParser.descripcion_larga=""
            
        }
        
        if (elementName as NSString).isEqualToString("xmlProyectos")
        {
            ModelStructParser.elements = NSMutableDictionary()
            ModelStructParser.elements = [:]
            ModelStructParser.id_proyecto=""
            ModelStructParser.proyecto_nombre=""
            ModelStructParser.id_sesiones=""
            ModelStructParser.sesion_nombre=""
            ModelStructParser.id_sesion_proyecto=""
            ModelStructParser.legislacion_nombre=""
            ModelStructParser.diputado_nombre=""
            ModelStructParser.comision_dictaminadora_nombre=""
            ModelStructParser.status_nombre=""
            ModelStructParser.fecha_creacion=""
            ModelStructParser.tipo_debate_nombre=""
            ModelStructParser.partido_nombre=""
            ModelStructParser.proyecto_descripcion=""
            
        }
        
        if (elementName as NSString).isEqualToString("xmlIntervenciones")
        {
            ModelStructParser.elements = NSMutableDictionary()
            ModelStructParser.elements = [:]
            ModelStructParser.id_detalle_intervencion = ""
            ModelStructParser.id_sesion_proyecto = ""
            ModelStructParser.id_diputado = ""
            ModelStructParser.id_partido = ""
            ModelStructParser.partido_nombre = ""
            ModelStructParser.partido_imagen = ""
            ModelStructParser.intervencion_texto = ""
            ModelStructParser.intervencion_fecha_creacion = ""
            ModelStructParser.diputado_nombre = ""
            ModelStructParser.diputado_imagen = ""
            ModelStructParser.id_sesion = ""
            ModelStructParser.id_proyecto = ""
            ModelStructParser.sesion_nombre = ""
            ModelStructParser.proyecto_nombre = ""
            
        }
        
        if (elementName as NSString).isEqualToString("xmlTipoActos")
        {
            ModelStructParser.elements = NSMutableDictionary()
            ModelStructParser.elements = [:]
            
            ModelStructParser.id_legislacion = ""
            ModelStructParser.legislacion_nombre = ""
            
            
            
        }
        
        if (elementName as NSString).isEqualToString("xmlDebates")
        {
            ModelStructParser.elements = NSMutableDictionary()
            ModelStructParser.elements = [:]
            ModelStructParser.id_tipo_debate = ""
            ModelStructParser.tipo_debate_nombre = ""
            
            
        }
        
        if (elementName as NSString).isEqualToString("xmlStatus")
        {
            ModelStructParser.elements = NSMutableDictionary()
            ModelStructParser.elements = [:]
            ModelStructParser.id_status = ""
            ModelStructParser.status_nombre = ""
            
            
        }
        
        if (elementName as NSString).isEqualToString("xmlProponentes")
        {
            ModelStructParser.elements = NSMutableDictionary()
            ModelStructParser.elements = [:]
            ModelStructParser.id_diputado = ""
            ModelStructParser.diputado_nombre = ""
            ModelStructParser.partido_nombre = ""
            ModelStructParser.descripcion_corta = ""
            ModelStructParser.descripcion_larga = ""
            ModelStructParser.diputado_imagen = ""
            ModelStructParser.diputado_nombre_lower = ""
            
            
            
        }
        
        if (elementName as NSString).isEqualToString("xmlPartidos")
        {
            ModelStructParser.elements = NSMutableDictionary()
            ModelStructParser.elements = [:]
            ModelStructParser.id_partido = ""
            ModelStructParser.partido_nombre = ""
            ModelStructParser.Data = ""
            ModelStructParser.descripcion_corta = ""
            ModelStructParser.descripcion_larga = ""
            ModelStructParser.partido_imagen = ""
            
            
        }
        
        if (elementName as NSString).isEqualToString("xmlComisiones")
        {
            ModelStructParser.elements = NSMutableDictionary()
            ModelStructParser.elements = [:]
            
            ModelStructParser.id_comision_dictaminadora = ""
            ModelStructParser.comision_dictaminadora_nombre = ""
            ModelStructParser.diputado_nombre = ""
            ModelStructParser.partido_nombre = ""
            
            
            
        }
        
        if (elementName as NSString).isEqualToString("xmlComisionesDistinct")
        {
            ModelStructParser.elements = NSMutableDictionary()
            ModelStructParser.elements = [:]
            
            ModelStructParser.id_comision_dictaminadora = ""
            ModelStructParser.comision_dictaminadora_nombre = ""
            ModelStructParser.descripcion_corta = ""
            ModelStructParser.descripcion_larga = ""
            ModelStructParser.imagen = ""
            ModelStructParser.activo = ""
            ModelStructParser.comision_dictaminadora_nombre_lower = ""
            
            
        }
        
        if (elementName as NSString).isEqualToString("xmlProponentesProComision")
        {
            ModelStructParser.elements = NSMutableDictionary()
            ModelStructParser.elements = [:]
            
            ModelStructParser.id_diputado = ""
            ModelStructParser.diputado_nombre = ""
            ModelStructParser.comision_dictaminadora_nombre = ""
            ModelStructParser.descripcion_corta = ""
            ModelStructParser.descripcion_larga = ""
            ModelStructParser.diputado_imagen = ""
            
            
            
        }
        
        if (elementName as NSString).isEqualToString("xmlIntervencionesPorUsuario")
        {
            ModelStructParser.elements = NSMutableDictionary()
            ModelStructParser.elements = [:]
            
            ModelStructParser.id_detalle_intervencion = ""
            ModelStructParser.id_sesion_proyecto = ""
            ModelStructParser.id_diputado = ""
            ModelStructParser.id_partido = ""
            ModelStructParser.partido_nombre = ""
            ModelStructParser.partido_imagen = ""
            ModelStructParser.intervencion_texto = ""
            ModelStructParser.intervencion_fecha_creacion = ""
            ModelStructParser.diputado_nombre = ""
            ModelStructParser.diputado_imagen = ""
            ModelStructParser.id_sesion = ""
            ModelStructParser.id_proyecto = ""
            ModelStructParser.sesion_nombre = ""
            ModelStructParser.proyecto_nombre = ""
            
        }
        
        if (elementName as NSString).isEqualToString("xmlSesionesFiltro")
        {
            ModelStructParser.elements = NSMutableDictionary()
            ModelStructParser.elements = [:]
            
            ModelStructParser.id_sesiones = ""
            ModelStructParser.descripcion_larga = ""
            ModelStructParser.descripcion_corta = ""
            
            
        }

    
    }
    
    
    
    func foundCharacters(string: String){
    
        //sesiones
        
        if ModelStructParser.element.isEqualToString("sesion_nombre") {
            ModelStructParser.sesion_nombre.appendString(string)
        }
        if ModelStructParser.element.isEqualToString("id") {
            ModelStructParser.id.appendString(string)
        }
        if ModelStructParser.element.isEqualToString("descripcion_corta") {
            ModelStructParser.descripcion_corta.appendString(string)
        }
        if ModelStructParser.element.isEqualToString("descripcion_larga") {
            ModelStructParser.descripcion_larga.appendString(string)
        }
        
        //proyectos
        
        if ModelStructParser.element.isEqualToString("id_proyecto") {
            ModelStructParser.id_proyecto.appendString(string)
        }
        if ModelStructParser.element.isEqualToString("proyecto_nombre") {
            ModelStructParser.proyecto_nombre.appendString(string)
        }
        if ModelStructParser.element.isEqualToString("id_sesiones") {
            ModelStructParser.id_sesiones.appendString(string)
        }
        if ModelStructParser.element.isEqualToString("id_sesion_proyecto") {
            ModelStructParser.id_sesion_proyecto.appendString(string)
        }
        if ModelStructParser.element.isEqualToString("legislacion_nombre") {
            ModelStructParser.legislacion_nombre.appendString(string)
        }
        if ModelStructParser.element.isEqualToString("diputado_nombre") {
            ModelStructParser.diputado_nombre.appendString(string)
        }
        if ModelStructParser.element.isEqualToString("comision_dictaminadora_nombre") {
            ModelStructParser.comision_dictaminadora_nombre.appendString(string)
        }
        if ModelStructParser.element.isEqualToString("status_nombre") {
            ModelStructParser.status_nombre.appendString(string)
        }
        if ModelStructParser.element.isEqualToString("fecha_creacion") {
            ModelStructParser.fecha_creacion.appendString(string)
        }
        if ModelStructParser.element.isEqualToString("tipo_debate_nombre") {
            ModelStructParser.tipo_debate_nombre.appendString(string)
        }
        if ModelStructParser.element.isEqualToString("partido_nombre") {
            ModelStructParser.partido_nombre.appendString(string)
        }
        if ModelStructParser.element.isEqualToString("proyecto_descripcion") {
            ModelStructParser.proyecto_descripcion.appendString(string)
        }
        
        
        //intervenciones
        
        if ModelStructParser.element.isEqualToString("id_detalle_intervencion") {
            ModelStructParser.id_detalle_intervencion.appendString(string)
        }
        
        if ModelStructParser.element.isEqualToString("id_diputado") {
            ModelStructParser.id_diputado.appendString(string)
        }
        
        if ModelStructParser.element.isEqualToString("id_partido") {
            ModelStructParser.id_partido.appendString(string)
        }
        
        if ModelStructParser.element.isEqualToString("partido_imagen") {
            ModelStructParser.partido_imagen.appendString(string)
        }
        
        if ModelStructParser.element.isEqualToString("intervencion_texto") {
            ModelStructParser.intervencion_texto.appendString(string)
        }
        
        if ModelStructParser.element.isEqualToString("intervencion_fecha_creacion") {
            ModelStructParser.intervencion_fecha_creacion.appendString(string)
        }
        
        if ModelStructParser.element.isEqualToString("diputado_imagen") {
            ModelStructParser.diputado_imagen.appendString(string)
        }
        
        if ModelStructParser.element.isEqualToString("id_sesion") {
            ModelStructParser.id_sesion.appendString(string)
        }
        
        if ModelStructParser.element.isEqualToString("id_legislacion") {
            ModelStructParser.id_legislacion.appendString(string)
        }
        
        if ModelStructParser.element.isEqualToString("id_tipo_debate") {
            ModelStructParser.id_tipo_debate.appendString(string)
        }
        
        if ModelStructParser.element.isEqualToString("id_status") {
            ModelStructParser.id_status.appendString(string)
        }
        
        if ModelStructParser.element.isEqualToString("diputado_nombre_lower") {
            ModelStructParser.diputado_nombre_lower.appendString(string)
        }
        
        if ModelStructParser.element.isEqualToString("Data") {
            ModelStructParser.Data.appendString(string)
        }
        
        if ModelStructParser.element.isEqualToString("imagen") {
            ModelStructParser.imagen.appendString(string)
        }
        
        if ModelStructParser.element.isEqualToString("activo") {
            ModelStructParser.activo.appendString(string)
        }
        
        if ModelStructParser.element.isEqualToString("comision_dictaminadora_nombre_lower") {
            ModelStructParser.comision_dictaminadora_nombre_lower.appendString(string)
        }

        
    }
    
    
    func endElement(elementName: NSString){
    
        if (elementName as NSString).isEqualToString("xmlSesiones"){
            var sesion = XmlSesiones(sesion_nombre : ModelStructParser.sesion_nombre as String,id : ModelStructParser.id as String,descripcion_corta : ModelStructParser.descripcion_corta as String ,descripcion_larga : ModelStructParser.descripcion_larga as String)
            ModelStructParser.arrayOfXmlSesiones.append(sesion)
        }
        
        if (elementName as NSString).isEqualToString("xmlProyectos"){
            var proyectos = XmlProyectos(id_proyecto: ModelStructParser.id_proyecto as String, proyecto_nombre: ModelStructParser.proyecto_nombre as String, id_sesiones: ModelStructParser.id_sesiones  as String, sesion_nombre: ModelStructParser.sesion_nombre as String, id_sesion_proyecto: ModelStructParser.id_sesion_proyecto as String, legislacion_nombre: ModelStructParser.legislacion_nombre as String, diputado_nombre: ModelStructParser.diputado_nombre as String, comision_dictaminadora_nombre: ModelStructParser.comision_dictaminadora_nombre as String, status_nombre: ModelStructParser.status_nombre as String, fecha_creacion: ModelStructParser.fecha_creacion as String, tipo_debate_nombre: ModelStructParser.tipo_debate_nombre as String, partido_nombre: ModelStructParser.partido_nombre as String, proyecto_descripcion: ModelStructParser.proyecto_descripcion as String)
           ModelStructParser.arrayOfXmlProyectos.append(proyectos)
        }
        
        if (elementName as NSString).isEqualToString("xmlIntervenciones"){
            var intervenciones = XmlIntervenciones(id_detalle_intervencion: ModelStructParser.id_detalle_intervencion as String, id_sesion_proyecto: ModelStructParser.id_sesion_proyecto as String, id_diputado: ModelStructParser.id_diputado as String, id_partido: ModelStructParser.id_partido as String, partido_nombre: ModelStructParser.partido_nombre as String, partido_imagen: ModelStructParser.partido_imagen as String, intervencion_texto: ModelStructParser.intervencion_texto as String, intervencion_fecha_creacion: ModelStructParser.intervencion_fecha_creacion as String, diputado_nombre: ModelStructParser.diputado_nombre as String, diputado_imagen: ModelStructParser.diputado_imagen as String, id_sesion: ModelStructParser.id_sesion as String, id_proyecto: ModelStructParser.id_proyecto as String, sesion_nombre: ModelStructParser.sesion_nombre as String, proyecto_nombre: ModelStructParser.proyecto_nombre as String)
            ModelStructParser.arrayOfXmlIntervenciones.append(intervenciones)
        }
        
        
        if (elementName as NSString).isEqualToString("xmlTipoActos")
        {
            var tipoActo = XmlTipoActos(id_legislacion: ModelStructParser.id_legislacion as String, legislacion_nombre: ModelStructParser.legislacion_nombre as String)
            ModelStructParser.arrayOfXmlTipoActos.append(tipoActo)
            
        }
        
        if (elementName as NSString).isEqualToString("xmlDebates")
        {
            var tipoActo = XmlDebates(id_tipo_debate: ModelStructParser.id_tipo_debate as String, tipo_debate_nombre: ModelStructParser.tipo_debate_nombre as String)
            ModelStructParser.arrayOfXmlDebates.append(tipoActo)
        }
        
        if (elementName as NSString).isEqualToString("xmlStatus")
        {
            var tipoActo = XmlEstatus(id_status: ModelStructParser.id_status as String, status_nombre: ModelStructParser.status_nombre as String)
            ModelStructParser.arrayOfXmlStatus.append(tipoActo)
        }
        
        if (elementName as NSString).isEqualToString("xmlProponentes")
        {
            var tipoActo = XmlProponentes(id_diputado: ModelStructParser.id_diputado as String, diputado_nombre: ModelStructParser.diputado_nombre as String, partido_nombre: ModelStructParser.partido_nombre as String, descripcion_corta: ModelStructParser.descripcion_corta as String, descripcion_larga: ModelStructParser.descripcion_larga as String, diputado_imagen: ModelStructParser.diputado_imagen as String, diputado_nombre_lower: ModelStructParser.diputado_nombre_lower as String)
            ModelStructParser.arrayOfXmlProponentes.append(tipoActo)
        }
        
        if (elementName as NSString).isEqualToString("xmlPartidos")
        {
            var tipoActo = XmlPartidos(id_partido: ModelStructParser.id_partido as String, partido_nombre: ModelStructParser.partido_nombre as String, Data: ModelStructParser.Data as String, descripcion_corta: ModelStructParser.descripcion_corta as String, descripcion_larga: ModelStructParser.descripcion_larga as String, partido_imagen: ModelStructParser.partido_imagen as String)
            ModelStructParser.arrayOfXmlPartidos.append(tipoActo)
        }
        
        if (elementName as NSString).isEqualToString("xmlComisiones")
        {
            var tipoActo = XmlComisiones(id_comision_dictaminadora: ModelStructParser.id_comision_dictaminadora as String, comision_dictaminadora_nombre: ModelStructParser.comision_dictaminadora_nombre as String, diputado_nombre: ModelStructParser.diputado_nombre as String, partido_nombre: ModelStructParser.partido_nombre as String)
            ModelStructParser.arrayOfXmlComisiones.append(tipoActo)
        }
        
        if (elementName as NSString).isEqualToString("xmlComisionesDistinct")
        {
            var tipoActo = XmlComisionesDistinct(id_comision_dictaminadora: ModelStructParser.id_comision_dictaminadora as String, comision_dictaminadora_nombre: ModelStructParser.comision_dictaminadora_nombre as String, descripcion_corta: ModelStructParser.descripcion_corta as String, descripcion_larga: ModelStructParser.descripcion_larga as String, imagen: ModelStructParser.imagen as String, activo: ModelStructParser.activo as String, comision_dictaminadora_nombre_lower: ModelStructParser.comision_dictaminadora_nombre_lower as String)
            ModelStructParser.arrayOfXmlComisionesDistinct.append(tipoActo)
        }
        
        if (elementName as NSString).isEqualToString("xmlProponentesProComision")
        {
            var tipoActo = XmlProponentesPorComision(id_diputado: ModelStructParser.id_diputado as String, diputado_nombre: ModelStructParser.diputado_nombre as String, comision_dictaminadora_nombre: ModelStructParser.comision_dictaminadora_nombre as String, descripcion_corta: ModelStructParser.descripcion_corta as String, descripcion_larga: ModelStructParser.descripcion_larga as String, diputado_imagen: ModelStructParser.diputado_imagen as String)
            ModelStructParser.arrayOfXmlProponentesPorComision.append(tipoActo)
        }
        
        if (elementName as NSString).isEqualToString("xmlIntervencionesPorUsuario")
        {
            var tipoActo = XmlIntervencionesPorUsuario(id_detalle_intervencion: ModelStructParser.id_detalle_intervencion as String, id_sesion_proyecto: ModelStructParser.id_sesion_proyecto as String, id_diputado: ModelStructParser.id_diputado as String, id_partido: ModelStructParser.id_partido as String, partido_nombre: ModelStructParser.partido_nombre as String, partido_imagen: ModelStructParser.partido_imagen as String, intervencion_texto: ModelStructParser.intervencion_texto as String, intervencion_fecha_creacion: ModelStructParser.intervencion_fecha_creacion as String, diputado_nombre: ModelStructParser.diputado_nombre as String, diputado_imagen: ModelStructParser.diputado_imagen as String, id_sesion: ModelStructParser.id_sesion as String, id_proyecto: ModelStructParser.id_proyecto as String, sesion_nombre: ModelStructParser.sesion_nombre as String, proyecto_nombre: ModelStructParser.proyecto_nombre as String)
            ModelStructParser.arrayOfXmlIntervencionesPorUsuario.append(tipoActo)
            
        }

    }


    
   
}

