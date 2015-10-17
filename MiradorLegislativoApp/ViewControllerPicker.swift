//
//  ViewControllerPicker.swift
//  MiradorLegislativoApp
//
//  Created by mac on 23/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class ViewControllerPicker: UIViewController , UIPickerViewDelegate {
    
    
    @IBOutlet weak var LabelTest: UILabel!
    
    
    var position = ["Lifeguard", "Instructor", "Supervisor"]
    
    var pickerPoryectoFiltro = ProyecFiltro()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //PickerTest1.delegate = self
        //PickerTest1.dataSource = self
        
        // Do any additional setup after loading the view.
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
        LabelTest.text = texto
        pickerPoryectoFiltro.acto = texto
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueTest") {
            var svc = segue.destinationViewController as ViewControllerFilterProject;
            svc.contextProyectoFiltro = pickerPoryectoFiltro
            
        }
    }
    
    
}
