//
//  ViewControllerPickerTipoActo.swift
//  MiradorLegislativoApp
//
//  Created by mac on 23/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class ViewControllerPickerTipoActo: UIViewController {

    var position = [String]()
    var pickerPoryectoFiltro = ProyecFiltro()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(PickerView: UIPickerView!) -> Int
    {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int
    {
        return position.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!
    {
        return position[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var texto = position[row]
        pickerPoryectoFiltro.tipoActo = texto
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
            var svc = segue.destinationViewController as ViewControllerFilterProject;
            svc.contextProyectoFiltro = pickerPoryectoFiltro
            self.navigationController?.popViewControllerAnimated(false)
    }


}
