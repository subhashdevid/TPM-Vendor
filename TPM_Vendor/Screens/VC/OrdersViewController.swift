//
//  OrdersViewController.swift
//  TPM_Vendor
//
//  Created by SUBHASH KUMAR on 18/04/20.
//  Copyright © 2020 SHIKHA. All rights reserved.
//

import UIKit

class OrdersViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          setUpNavigationBarWithTitle(isbarHidden: false, navigationTitle: "My Orders")
          self.view.backgroundColor =  UIColor.init(red: 226/255, green: 188/255, blue: 123/255, alpha: 1.0)


//          self.fetchUserProfile()

      }
      
    


}
