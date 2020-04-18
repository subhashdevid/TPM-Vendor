//
//  EventDetailInfoTableViewCell.swift
//  PartyMantra
//
//  Created by Vibhash Kumar on 29/03/20.
//  Copyright © 2020 Shikha. All rights reserved.
//

import UIKit

class EventDetailInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var dateAndTimeLabel: UILabel!
    @IBOutlet weak var dateDurationLabel: UILabel!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var venueLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var dateAndTimeTitleLbl: UILabel!
    @IBOutlet weak var addressTitleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configureCheckoutCell(orderModal:OrderDetailsModel?){

        eventTitleLabel.text = orderModal?.title
        dateDurationLabel.text = orderModal?.date
        dateAndTimeLabel.text = orderModal?.date
        addressTitleLbl.text = "Address"
        venueLabel.text = orderModal?.address
        dateAndTimeTitleLbl.text = "Date and Time."
        let url = URL(string: orderModal?.image ?? "")
        eventImageView.kf.setImage(with: url, placeholder: UIImage(named: "applogo_1024"))
    }
    
}
