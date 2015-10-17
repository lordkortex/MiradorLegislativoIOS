//
//  TableViewControllerIntervencionesCell.swift
//  MiradorLegislativoApp
//
//  Created by mac on 23/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerIntervencionesCell: UITableViewCell {

    @IBOutlet weak var ImageViewIcon: UIImageView!
    @IBOutlet weak var LabelDiputadoPartido: UILabel!
    @IBOutlet weak var LabelFecha: UILabel!
    @IBOutlet weak var LabelProyecto: UILabel!
    @IBOutlet weak var LabelIntervencion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
