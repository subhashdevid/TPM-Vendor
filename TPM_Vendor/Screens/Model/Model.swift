//  Model.swift
//  PartyMantra
//
//  Created by Subhash Kumar on 19/03/20.
//  Copyright © 2020 Shikha. All rights reserved.
//

import Foundation

//OTP
struct VerifyModel: Codable {
    let message: String?
    let token: String?
    let type: String?
}

//PROFILE

struct ProfileModel: Codable {
    var status: String?
    let partner : ProfileDetails?
}

struct ProfileDetails: Codable {
    var id: Int?
    var name: String?
    var description: String?
    var address: String?
    var short_address: String?
    var lat: String?
    var lang: String?
    var contact_no: String?
    var header_image: String?
    var small_image: String?
    var type: String?
    var per_person_text: String?
    var isactive: Int?
    var open: String?
    var close: String?
    var allow_party: Int?
    var timings: String?
    var party_timings: String?
    var tnc: String?
    var discounts: String?
    var away: Int?


}


struct OrderListModel: Codable {
    var refid: String?
    var status: String?
    var total: Int?
    var id: Int?

}
