//
//  TableViewControllerPartidosCell.swift
//  MiradorLegislativoApp
//
//  Created by mac on 24/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerPartidosCell: UITableViewCell {

    @IBOutlet weak var LabelImagen: UIImageView!
       
    @IBOutlet weak var LabelPartido: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
  }

}
