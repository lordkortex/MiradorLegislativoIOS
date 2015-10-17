//
//  TableViewControllerNotificacionesCell.swift
//  MiradorLegislativoApp
//
//  Created by mac on 24/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerNotificacionesCell: UITableViewCell {

    
    @IBOutlet weak var imageNotificacion: UIImageView!
    @IBOutlet weak var labelDiputado: UILabel!
    @IBOutlet weak var labelPartido: UILabel!
    @IBOutlet weak var labelFecha: UILabel!
    @IBOutlet weak var labelEncabezado: UILabel!
    @IBOutlet weak var labelDescripcion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
  }

}
