//
//  TableViewControllerDiputadoCellP.swift
//  MiradorLegislativoApp
//
//  Created by mac on 28/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerDiputadoCellP: UITableViewCell {

    @IBOutlet weak var ImageViewDiputado: UIImageView!
    @IBOutlet weak var labelNombre: UILabel!
    @IBOutlet weak var LabelPartido: UILabel!
    
    @IBOutlet weak var labelDescripcion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
