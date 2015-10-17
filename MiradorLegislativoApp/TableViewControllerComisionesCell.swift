//
//  TableViewControllerComisionesCell.swift
//  MiradorLegislativoApp
//
//  Created by mac on 24/07/15.
//  Copyright (c) 2015 SoftwareFactoryHN. All rights reserved.
//

import UIKit

class TableViewControllerComisionesCell: UITableViewCell {

    @IBOutlet weak var ImageComision: UIView! 
    
    @IBOutlet weak var labelComision: UILabel!
    
    @IBOutlet weak var im: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
   }

}
