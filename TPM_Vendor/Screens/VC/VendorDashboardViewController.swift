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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
