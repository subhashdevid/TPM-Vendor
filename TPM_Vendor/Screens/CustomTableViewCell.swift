//
//  CustomTableViewCell.swift
//  TPM_Vendor
//
//  Created by SUBHASH KUMAR on 18/04/20.
//  Copyright © 2020 SHIKHA. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

   @IBOutlet weak var contactLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bgBView: UIView!
    @IBOutlet weak var placeholderImgView: UIImageView!

    @IBOutlet weak var scanBtn: UIButton!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var orderhistoryBtn: UIButton!

    
    
    @IBOutlet weak var refLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var actionLbl: UILabel!
    @IBOutlet weak var viewOrderBtn: UIButton!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
