//
//  TableViewControllerDiputadosCell.swift
//  MiradorLegislativoApp
//
//  Created by mac on 24/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerDiputadosCell: UITableViewCell {

    @IBOutlet weak var ImageDiputado: UIView!
    
    
    @IBOutlet weak var labelNombre: UILabel!
    
    @IBOutlet weak var LabelPartido: UILabel!
    
    
    @IBOutlet weak var LabelDescripcion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
  }

}
