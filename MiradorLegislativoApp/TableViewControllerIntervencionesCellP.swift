//
//  TableViewControllerIntervencionesCellP.swift
//  MiradorLegislativoApp
//
//  Created by mac on 24/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerIntervencionesCellP: UITableViewCell {

    @IBOutlet weak var labelDiputado: UILabel!
    
    @IBOutlet weak var labelPartido: UILabel!
    @IBOutlet weak var labelFecha: UILabel!
    @IBOutlet weak var LabelDescripcion: UILabel!
    @IBOutlet weak var LabelDetalle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
