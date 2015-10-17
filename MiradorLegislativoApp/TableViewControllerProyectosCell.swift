//
//  TableViewControllerProyectosCell.swift
//  MiradorLegislativoApp
//
//  Created by mac on 23/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerProyectosCell: UITableViewCell {

    @IBOutlet weak var ImageViewIcon: UIImageView!
   
    @IBOutlet weak var LabelNombre: UILabel!
    @IBOutlet weak var LabelTipoActo: UILabel!
    @IBOutlet weak var LabelProponente: UILabel!
    @IBOutlet weak var LabelSesion: UILabel!
    @IBOutlet weak var LabelStatus: UILabel!
    @IBOutlet weak var LabelPrimerDebate: UILabel!
    @IBOutlet weak var LabelDebate: UILabel!
    @IBOutlet weak var LabelFecha: UILabel!
    @IBOutlet weak var LabelDescripcion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
