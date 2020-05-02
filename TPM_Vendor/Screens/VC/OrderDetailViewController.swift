//
//  OrderDetailViewController.swift
//  PartyMantra
//
//  Created by SUBHASH KUMAR on 31/03/20.
//  Copyright © 2020 Shikha. All rights reserved.
//

import UIKit

class OrderDetailViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
           
    var refid: String?
    var orderDetailsModel : OrderDetailsModel?
    var noBtnNeeded = 0
    
    
    @IBOutlet weak var orderCheckoutTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        orderCheckoutTableview.separatorStyle = .none
        self.view.backgroundColor = .white
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setUpNavigationBarWithTitle(isbarHidden: false, navigationTitle: "Order Details")
        self.fetchOrderDetails()
    }
    
    func createUrl() -> String {
        
        var url = ""
        if let refid = refid {
            url = Server.shared.PartnerOrderDetails + "/\(refid)"
        }
        return url
    }
    
    func fetchOrderDetails() {
        Loader.showHud()
        let param: [String: Any] = [:]
        NetworkManager.getOrderDetails(url: createUrl(),parameters: param) {[weak self] result in
            Loader.dismissHud()
            switch result {
            case let .success(response):
                if let checkout = response.data {
                    self?.orderDetailsModel = checkout
                    self?.orderCheckoutTableview.reloadData()
                }
                
            case .failure: break
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 5
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: EventDetailInfoTableViewCell! = orderCheckoutTableview.dequeueReusableCell(withIdentifier: "EventDetailInfoTableViewCell") as? EventDetailInfoTableViewCell
        if cell == nil {
            orderCheckoutTableview.register(UINib(nibName: "EventDetailInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "EventDetailInfoTableViewCell")
            cell = orderCheckoutTableview.dequeueReusableCell(withIdentifier: "EventDetailInfoTableViewCell") as? EventDetailInfoTableViewCell
        }

        
        if indexPath.row == 0{
            var cell: EventDetailInfoTableViewCell! = orderCheckoutTableview.dequeueReusableCell(withIdentifier: "EventDetailInfoTableViewCell") as? EventDetailInfoTableViewCell
            if cell == nil {
                orderCheckoutTableview.register(UINib(nibName: "EventDetailInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "EventDetailInfoTableViewCell")
                cell = orderCheckoutTableview.dequeueReusableCell(withIdentifier: "EventDetailInfoTableViewCell") as? EventDetailInfoTableViewCell
            }

            cell.configureCheckoutCell(orderModal: self.orderDetailsModel)
            return cell
            
        }
        else if indexPath.row == 1{
            var cell: detailPackageTableViewCell! = orderCheckoutTableview.dequeueReusableCell(withIdentifier: "detailPackageTableViewCell") as? detailPackageTableViewCell
            if cell == nil {
                orderCheckoutTableview.register(UINib(nibName: "detailPackageTableViewCell", bundle: nil), forCellReuseIdentifier: "detailPackageTableViewCell")
                cell = orderCheckoutTableview.dequeueReusableCell(withIdentifier: "detailPackageTableViewCell") as? detailPackageTableViewCell
            }
//            cell.configureCheckoutListTableView(dataModal : self.OrderDetailsModel)
            return cell
            
        }else if indexPath.row == 2{
            var cell: AllTaxesTableViewCell! = orderCheckoutTableview.dequeueReusableCell(withIdentifier: "AllTaxesTableViewCell") as? AllTaxesTableViewCell
            if cell == nil {
                orderCheckoutTableview.register(UINib(nibName: "AllTaxesTableViewCell", bundle: nil), forCellReuseIdentifier: "AllTaxesTableViewCell")
                cell = orderCheckoutTableview.dequeueReusableCell(withIdentifier: "AllTaxesTableViewCell") as? AllTaxesTableViewCell
            }
            
            cell.configureTaxCell(modal: self.orderDetailsModel)
            return cell
            
        }else if indexPath.row == 3{
            var cell: SpecialEventDetailsTableViewCell! = orderCheckoutTableview.dequeueReusableCell(withIdentifier: "SpecialEventDetailsTableViewCell") as? SpecialEventDetailsTableViewCell
            if cell == nil {
                orderCheckoutTableview.register(UINib(nibName: "SpecialEventDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "SpecialEventDetailsTableViewCell")
                cell = orderCheckoutTableview.dequeueReusableCell(withIdentifier: "SpecialEventDetailsTableViewCell") as? SpecialEventDetailsTableViewCell
            }
            
            cell.configureSpecialDetail(modal: self.orderDetailsModel)
            return cell
            
        }
        else if indexPath.row == 4 {
            var count = 0
            var buttonAction = self.orderDetailsModel?.actions
//
//            buttonAction?.mark = "yes"
//            buttonAction?.confirm = "yes"
//            buttonAction?.decline = "yes"
//
//
            if buttonAction?.mark != "no" && buttonAction != nil {
                count = count + 1
            }
            if buttonAction?.confirm != "no" && buttonAction != nil{
                count = count + 1
            }
            if buttonAction?.decline != "no" && buttonAction != nil{
                count = count + 1

            }
            
            noBtnNeeded = count
            
            if noBtnNeeded == 1{
                var cell: OneBtnTableViewCell! = orderCheckoutTableview.dequeueReusableCell(withIdentifier: "OneBtnTableViewCell") as? OneBtnTableViewCell
                if cell == nil {
                    orderCheckoutTableview.register(UINib(nibName: "OneBtnTableViewCell", bundle: nil), forCellReuseIdentifier: "OneBtnTableViewCell")
                    cell = orderCheckoutTableview.dequeueReusableCell(withIdentifier: "OneBtnTableViewCell") as? OneBtnTableViewCell
                }
                
                let buttonAction = self.orderDetailsModel?.actions
                if buttonAction?.mark != "no" && buttonAction != nil {
                       
                    cell.btn1.setTitle("Mark", for: .normal)
                    cell.btn1.tag = 101
                    cell.btn1.addTarget(self, action: #selector(setButtonAction(sender:)), for: .touchUpInside)
                    
                }
                if buttonAction?.confirm != "no" && buttonAction != nil{
                          cell.btn1.setTitle("Confirm", for: .normal)
                    cell.btn1.tag = 102
                    cell.btn1.addTarget(self, action: #selector(setButtonAction(sender:)), for: .touchUpInside)

                }
                
                if buttonAction?.decline != "no" && buttonAction != nil{
                    cell.btn1.setTitle("Decline", for: .normal)
                    cell.btn1.tag = 103
                    cell.btn1.addTarget(self, action: #selector(setButtonAction(sender:)), for: .touchUpInside)

                }
             
                return cell
            }else if noBtnNeeded == 2{
                var cell: TwoBtnTableViewCell! = orderCheckoutTableview.dequeueReusableCell(withIdentifier: "TwoBtnTableViewCell") as? TwoBtnTableViewCell
                if cell == nil {
                    orderCheckoutTableview.register(UINib(nibName: "TwoBtnTableViewCell", bundle: nil), forCellReuseIdentifier: "TwoBtnTableViewCell")
                    cell = orderCheckoutTableview.dequeueReusableCell(withIdentifier: "TwoBtnTableViewCell") as? TwoBtnTableViewCell
                }
                
                let buttonAction = self.orderDetailsModel?.actions
                if buttonAction?.mark != "no" && buttonAction?.confirm != "no" {
                    cell.btn1.setTitle("Mark", for: .normal)
                    cell.btn1.tag = 101
                    cell.btn1.addTarget(self, action: #selector(setButtonAction(sender:)), for: .touchUpInside)
                    
                    cell.btn2.setTitle("Confirm", for: .normal)
                    cell.btn2.tag = 102
                    cell.btn2.addTarget(self, action: #selector(setButtonAction(sender:)), for: .touchUpInside)
                    
                }
                
                if buttonAction?.mark != "no" && buttonAction?.decline != "no" {
                    cell.btn1.setTitle("Mark", for: .normal)
                    cell.btn1.tag = 101
                    cell.btn1.addTarget(self, action: #selector(setButtonAction(sender:)), for: .touchUpInside)
                    
                    cell.btn2.setTitle("Decline", for: .normal)
                    cell.btn2.tag = 103
                    cell.btn2.addTarget(self, action: #selector(setButtonAction(sender:)), for: .touchUpInside)
                }
                if buttonAction?.confirm != "no" && buttonAction?.decline != "no" {
                   
                    cell.btn1.setTitle("Confirm", for: .normal)
                                       cell.btn1.tag = 102
                                       cell.btn1.addTarget(self, action: #selector(setButtonAction(sender:)), for: .touchUpInside)
                                       
                                       cell.btn2.setTitle("Decline", for: .normal)
                                       cell.btn2.tag = 103
                                       cell.btn2.addTarget(self, action: #selector(setButtonAction(sender:)), for: .touchUpInside)
                    
                }
                
                return cell
            }
            else if noBtnNeeded == 3{
                var cell: ThreeBtnTableViewCell! = orderCheckoutTableview.dequeueReusableCell(withIdentifier: "ThreeBtnTableViewCell") as? ThreeBtnTableViewCell
                if cell == nil {
                    orderCheckoutTableview.register(UINib(nibName: "ThreeBtnTableViewCell", bundle: nil), forCellReuseIdentifier: "ThreeBtnTableViewCell")
                    cell = orderCheckoutTableview.dequeueReusableCell(withIdentifier: "ThreeBtnTableViewCell") as? ThreeBtnTableViewCell
                }
                
                    
                    cell.btn1.setTitle("Mark", for: .normal)
                    cell.btn1.tag = 101
                    cell.btn1.addTarget(self, action: #selector(setButtonAction(sender:)), for: .touchUpInside)
                    
               
                    cell.btn2.setTitle("Confirm", for: .normal)
                    cell.btn2.tag = 102
                    cell.btn2.addTarget(self, action: #selector(setButtonAction(sender:)), for: .touchUpInside)

               
                    cell.btn3.setTitle("Decline", for: .normal)
                    cell.btn3.tag = 103

                    cell.btn3.addTarget(self, action: #selector(setButtonAction(sender:)), for: .touchUpInside)
                
                return cell
            }
            
            else{
                var cell: ThreeBtnTableViewCell! = orderCheckoutTableview.dequeueReusableCell(withIdentifier: "ThreeBtnTableViewCell") as? ThreeBtnTableViewCell
                               if cell == nil {
                                   orderCheckoutTableview.register(UINib(nibName: "ThreeBtnTableViewCell", bundle: nil), forCellReuseIdentifier: "ThreeBtnTableViewCell")
                                   cell = orderCheckoutTableview.dequeueReusableCell(withIdentifier: "ThreeBtnTableViewCell") as? ThreeBtnTableViewCell
                               }
                cell.btn3.isHidden = true
                cell.btn2.isHidden = true
                cell.btn1.isHidden = true
            }
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 1{
//
//            let numberOfCell = self.checkoutModel?.packages?.count ?? 0
//           return  (CGFloat(37*numberOfCell+20))
//        }else{
//        }
        
        
//        if indexPath.row == 4 {
//            var count = 0
//            let buttonAction = self.orderDetailsModel?.actions
//
//            if buttonAction?.mark != "no" {
//                count = count + 1
//            }
//            if buttonAction?.confirm != "no" {
//                count = count + 1
//            }
//            if buttonAction?.decline != "no" {
//                count = count + 1
//
//            }
//
//
//            if count == 0{
//                return 0
//            }else{
//                return UITableView.automaticDimension
//            }
//
//        }
//        else{
            return UITableView.automaticDimension
//        }
    }
   
    
    
    
    @objc func setButtonAction(sender : UIButton){
        if sender.tag == 101 {
            print("Mark button Pressed")

        }
        else if sender.tag == 102 {
            print("Comfirm button Pressed")
        }
        else if sender.tag == 103 {
            print("Denied button Pressed")

        }
    }
    
    
    
    
    
}



