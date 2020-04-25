//
//  Server.swift
//  PartyMantra
//
//  Created by Subhash Kumar on 19/03/20.
//  Copyright © 2020 Shikha. All rights reserved.
//

import Foundation
import UIKit
//
enum ServerEnvironment {
    
    case live, staging, QA
    // Main Server
    var baseURL: String {
        switch self {
        case .QA:
            return "http://partymantra.appoffice.xyz"
        case .staging:
            return "http://partymantra.appoffice.xyz"
        case .live:
            return "http://partymantra.appoffice.xyz"
        }
    }
    
}

// API 2 // get date and get setting//
let currentEnvironment: ServerEnvironment = .staging  //Checkpoint
/// Server base URL string.
public let kBaseURL = currentEnvironment.baseURL
let mainUrl = "\(kBaseURL)/api/"
class Server: NSObject, Codable { // checkpoint

    static let shared = Server()
    fileprivate var timeInterval = Date().timeIntervalSince1970
    
//MARK:- URLS
    var LoginUrl = "\(mainUrl)login"
    var VerifyUrl = "\(mainUrl)verify-otp"
    var PartnerProfileUrl = "\(mainUrl)partner-profile"
    var QrCodeAccessUrl = "\(mainUrl)mark-entry"
    var MyOrderList = "\(mainUrl)my-orders"

    var PartnerOrderDetails = "\(mainUrl)partner-order-details"


    
    
    
    //MARK:- serverTimeInterval
    var serverTimeInterval: TimeInterval = Date().timeIntervalSince1970
    override init() {}
    required init(from _: Decoder) throws {}
}
