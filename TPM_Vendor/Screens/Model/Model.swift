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



struct OrderDetailsModel: Codable {
    var orderid: String?
    var title: String?
    var image: String?
    var address: String?
    var date: String?
    var name: String?
    var mobile: String?
    var email: String?
    var ratio: String?
    var totalpass: Int?
    var amount: Int?
    var subtotal: Int?
    var taxes: Int?
    var qrcode: String?
    var actions : OrderAction?
    //    var packages : [OrderPackages]?


}

struct OrderAction: Codable {
    var mark: String?
    var confirm: String?
    var decline: String?

}


//struct OrderPackages: Codable {
//    var mark: String?
//    var confirm: String?
//    var decline: String?
//
//}






/*
 
 
 {
     "status": "success",
     "data": {
         "orderid": "20200208100841",
         "title": "Hotel Samrat(billpay)",
         "image": "http://partymantra.appoffice.xyz/uploads/partners/eventicon1.jpeg",
         "address": "n 65, sector 12",
         "packages": [],
         "date": "Sat,08 Feb 2020-10:08AM",
         "totalpass": 0,
         "name": null,
         "mobile": null,
         "email": null,
         "ratio": "Men: 0 Women: 0 Couple:0",
         "amount": 852,
         "subtotal": 852,
         "taxes": 0,
         "qrcode": "http://partymantra.appoffice.xyz/api/get-qr/37",
         "actions": {
             "mark": "no",
             "confirm": "no",
             "decline": "no"
         }
     }
 }
 
 
 **/
