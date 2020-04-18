//
//  VendorDashboardViewController.swift
//  TPM_Vendor
//
//  Created by SUBHASH KUMAR on 18/04/20.
//  Copyright © 2020 SHIKHA. All rights reserved.
//

import UIKit

class VendorDashboardViewController: BaseViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set("1", forKey: "ISLOGIN") //setObject
        UserDefaults.standard.synchronize()
        
        self.tblView.estimatedRowHeight =  UITableView.automaticDimension
        self.tblView.rowHeight = 44
        self.tblView.tableFooterView = UIView()
        self.tblView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpNavigationBarWithTitle(isbarHidden: true, navigationTitle: "")
        self.view.backgroundColor =  UIColor.init(red: 226/255, green: 188/255, blue: 123/255, alpha: 1.0)
        //E2BC7B
    }
    
    
    @objc func didTapLogoutBtn() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        UserDefaults.standard.set("0", forKey: "ISLOGIN") //setObject
        UserDefaults.standard.synchronize()
        appDelegate.showLoginScreen()
    }
    
    @objc func didTapScanBtn() {
        
    }
    
    
    @objc func didTapOrderHistoryBtn() {
        
    }
}


extension VendorDashboardViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tblView.dequeueReusableCell(withIdentifier: "placeholder_cell") as? CustomTableViewCell
        
        if indexPath.row == 0 {
            cell?.placeholderImgView.image = UIImage(named: "applogo_1024")
        }
        else if indexPath.row == 1 {
            let cell = self.tblView.dequeueReusableCell(withIdentifier: "btnCell") as? CustomTableViewCell
            cell?.titleLbl.text = "GAUR"
            
            cell?.contactLbl.text = "9898989898"
            cell?.addressLbl.text = "AIG GC 1"
            
            cell?.scanBtn.addTarget(self, action: #selector(didTapScanBtn), for: .touchUpInside)
            cell?.logoutBtn.addTarget(self, action: #selector(didTapLogoutBtn), for: .touchUpInside)
            cell?.orderhistoryBtn.addTarget(self, action: #selector(didTapOrderHistoryBtn), for: .touchUpInside)
            
            
            return cell!
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 200
        }
        
        return UITableView.automaticDimension
    }
    
}
