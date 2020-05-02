//
//  TwoBtnTableViewCell.swift
//  TPM_Vendor
//
//  Created by Vibhash Kumar on 25/04/20.
//  Copyright © 2020 SHIKHA. All rights reserved.
//

import UIKit

class TwoBtnTableViewCell: UITableViewCell {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
