//
//  VendorDashboardViewController.swift
//  TPM_Vendor
//
//  Created by SUBHASH KUMAR on 18/04/20.
//  Copyright © 2020 SHIKHA. All rights reserved.
//

import UIKit

class VendorDashboardViewController: BaseViewController,QRCodeScannerDelegate {
    
    @IBOutlet weak var tblView: UITableView!
    
    var userModel :  ProfileModel?
    var qrScannedCodeStr = ""
    
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


        self.fetchUserProfile()

    }
    
    
    @objc func didTapLogoutBtn() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        UserDefaults.standard.set("0", forKey: "ISLOGIN") //setObject
        UserDefaults.standard.synchronize()
        appDelegate.showLoginScreen()
    }
    
    
    
    
    
    
    //MARK:- QRCode Scanner
    
    
    @objc func didTapScanBtn() {
      
       let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QRScannerViewController")as! QRScannerViewController
        
        vc.scannerDelegate = self
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
    //MARK:- Scanner Delegate
    
    func qrScanningSucceededWithCode(_ str: String?) {
        self.qrScannedCodeStr = str ?? ""
        self.fetchMarkPassDetails(qrcodeString:  self.qrScannedCodeStr)
    }

    
    
    func createQRCodeMarkPassUrl(qrcodeString:String) -> String {
           
           var url = ""
           url = Server.shared.QrCodeAccessUrl + "/\(self.qrScannedCodeStr)"
           
           return url
       }
       
       func fetchMarkPassDetails(qrcodeString:String) {
           Loader.showHud()
           let param: [String: Any] = [:]
           NetworkManager.getMarkPassOrderDetails(url: createQRCodeMarkPassUrl(qrcodeString:qrcodeString),parameters: param) {[weak self] result in
               Loader.dismissHud()
               switch result {
               case let .success(response):
                   if let checkout = response.data {
//                       self?.orderDetailsModel = checkout
//                       self?.orderCheckoutTableview.reloadData()
                   }
                   
               case .failure: break
               }
           }
       }
       
    
    
    
    
    
    @objc func didTapOrderHistoryBtn() {
        let vc = OrdersViewController.instantiate(appStoryboard: .main) as OrdersViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
    //MARK:- Profile API Call
    
    func fetchUserProfile() {
        
        // http://partymantra.local/api/mark-entry/{QRCODE}
        
        let accessUserToken =  UserDefaults.standard.string(forKey: "AccessToken")
        let param: [String: Any] = [
            "token":accessUserToken ?? ""
        ]
        Loader.showHud()
        NetworkManager.getProfile(parameters: param) {[weak self] result in
            Loader.dismissHud()
            switch result {
            case let .success(response):
                if let userProfile = response.data {
                    self?.userModel = userProfile
                    self?.tblView.reloadData()
                }
                
            case .failure: break
            }
        }
    }
    
}


extension VendorDashboardViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tblView.dequeueReusableCell(withIdentifier: "placeholder_cell") as? CustomTableViewCell
        
        if indexPath.row == 0 {
            let url = URL(string: userModel?.partner?.header_image ?? "")
            cell?.placeholderImgView.kf.setImage(with: url, placeholder: UIImage(named: "applogo_1024"))
        }
        else if indexPath.row == 1 {
            let cell = self.tblView.dequeueReusableCell(withIdentifier: "btnCell") as? CustomTableViewCell
            cell?.titleLbl.text = self.userModel?.partner?.name ?? ""
            cell?.contactLbl.text = self.userModel?.partner?.contact_no
            cell?.addressLbl.text = self.userModel?.partner?.address
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
