//
//  ImageCellDiputado.swift
//  MiradorLegislativoApp
//
//  Created by mac on 25/10/15.
//  Copyright © 2015 SoftwareFactoryHN. All rights reserved.
//


import UIKit

class ImageCellDiputado: UITableViewCell {
    
    @IBOutlet weak var imageDiputado: UIImageView!
    @IBOutlet weak var titleDiputado: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var subtitleDiputado: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}