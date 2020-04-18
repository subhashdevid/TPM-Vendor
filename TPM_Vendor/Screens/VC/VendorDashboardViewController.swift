//
//  VendorDashboardViewController.swift
//  TPM_Vendor
//
//  Created by SUBHASH KUMAR on 18/04/20.
//  Copyright © 2020 SHIKHA. All rights reserved.
//

import UIKit

class VendorDashboardViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set("1", forKey: "ISLOGIN") //setObject
               UserDefaults.standard.synchronize()
        
        /*
         logout
         
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    UserDefaults.standard.set("0", forKey: "ISLOGIN") //setObject
                    UserDefaults.standard.synchronize()
                    appDelegate.showLoginScreen()
         
         **/
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpNavigationBarWithTitle(isbarHidden: true, navigationTitle: "")
    }

}
