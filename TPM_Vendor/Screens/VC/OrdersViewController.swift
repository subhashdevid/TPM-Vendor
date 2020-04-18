//
//  OrdersViewController.swift
//  TPM_Vendor
//
//  Created by SUBHASH KUMAR on 18/04/20.
//  Copyright © 2020 SHIKHA. All rights reserved.
//

import UIKit

class OrdersViewController: BaseViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    var orderModel : [OrderListModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.tableFooterView = UIView()
        self.tblView.estimatedRowHeight = UITableView.automaticDimension
        self.tblView.rowHeight = 64.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpNavigationBarWithTitle(isbarHidden: false, navigationTitle: "My Orders")
        self.view.backgroundColor =  UIColor.init(red: 226/255, green: 188/255, blue: 123/255, alpha: 1.0)
        
        
        self.fetchOrderList()
        
    }
    
    
    
    //MARK:- Orderlist API Call
    
    func fetchOrderList() {
        let accessUserToken =  UserDefaults.standard.string(forKey: "AccessToken")
        let param: [String: Any] = [
            "token":accessUserToken ?? ""
        ]
        Loader.showHud()
        NetworkManager.getMyOrderList(parameters: param) {[weak self] result in
            Loader.dismissHud()
            switch result {
            case let .success(response):
                self?.orderModel?.removeAll()
                if let userProfile = response.data {
                    self?.orderModel = userProfile
                    self?.tblView.reloadData()
                }
                
            case .failure: break
            }
        }
    }
    
    
    @objc func didTapOnViewOrderBtn( sender : UIButton ) {
        let model = self.orderModel?[sender.tag]

        
        
        
    }
    
    
}


extension OrdersViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblView.dequeueReusableCell(withIdentifier: "ContentCell") as? CustomTableViewCell
        
        let model = orderModel?[indexPath.row]
        cell?.refLbl.text = model?.refid ?? ""
        cell?.totalLbl.text = "\(model?.total ?? 0)"
        cell?.statusLbl.text = model?.status ?? ""
        cell?.viewOrderBtn.layer.cornerRadius = 5
        cell?.viewOrderBtn.layer.masksToBounds = true
        cell?.viewOrderBtn.tag = indexPath.row
        cell?.viewOrderBtn.addTarget(self, action: #selector(didTapOnViewOrderBtn(sender:)), for: .touchUpInside)
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = self.tblView.dequeueReusableCell(withIdentifier: "headerCell") as! CustomTableViewCell
        headerCell.refLbl.text = "Reference Id"
        headerCell.totalLbl.text = "Total"
        headerCell.statusLbl.text = "Status"
        headerCell.actionLbl.text = "Action"
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
