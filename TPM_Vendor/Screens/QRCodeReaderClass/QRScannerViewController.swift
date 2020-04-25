//
//  QRScannerViewController.swift
//  QRCodeReader
//
//  Created by KM, Abhilash a on 08/03/19.
//  Copyright © 2019 KM, Abhilash. All rights reserved.
//

import UIKit
import AVFoundation
/// Delegate callback for the QRScannerView.
protocol QRCodeScannerDelegate: class {
    func qrScanningSucceededWithCode(_ str: String?)
}

class QRScannerViewController: UIViewController {
    
    var scannerDelegate: QRCodeScannerDelegate?
    
    @IBOutlet weak var scannerView: QRScannerView! {
        didSet {
            scannerView.delegate = self
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if !scannerView.isRunning {
            scannerView.startScanning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if !scannerView.isRunning {
            scannerView.stopScanning()
        }
    }

    @IBAction func scanButtonAction(_ sender: UIButton) {
        scannerView.isRunning ? scannerView.stopScanning() : scannerView.startScanning()
        let buttonTitle = scannerView.isRunning ? "STOP" : "SCAN"
        sender.setTitle(buttonTitle, for: .normal)
    }
    
    
    var isTorchSelected :Bool = false
    @IBAction func toggleTorch(_ sender: Any) {
        if isTorchSelected{
            isTorchSelected =  !isTorchSelected
            toggleTorch(on: isTorchSelected)
        }else{
            
            isTorchSelected =  !isTorchSelected
            toggleTorch(on: isTorchSelected)
        }
        
    }
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
    
    
}


extension QRScannerViewController: QRScannerViewDelegate {
    func qrScanningDidStop() {
        
    }
    
    func qrScanningDidFail() {
        self.showAlert("Scanning Failed. Please try again")
        
    }
    func qrScanningSucceededWithCode(_ str: String?) {
        scannerDelegate?.qrScanningSucceededWithCode(str)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}



