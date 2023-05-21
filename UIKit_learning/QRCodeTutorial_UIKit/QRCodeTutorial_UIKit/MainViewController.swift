//
//  ViewController.swift
//  QRCodeTutorial_UIKit
//
//  Created by HaeSik Jang on 2023/05/19.
//

import UIKit
import WebKit
import AVFoundation
import QRCodeReader

class MainViewController: UIViewController, QRCodeReaderViewControllerDelegate {

    @IBOutlet weak var qrcodeButton: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            
            // Configure the view controller (optional)
            $0.showTorchButton        = false
            $0.showSwitchCameraButton = false
            $0.showCancelButton       = false
            $0.showOverlayView        = true
            $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://www.naver.com")
        let requestObj = URLRequest(url: url!)
        webView.load(requestObj)
        
        qrcodeButton.layer.borderWidth = 2
        qrcodeButton.layer.borderColor = UIColor.black.cgColor
        qrcodeButton.layer.cornerRadius = 10
        
        qrcodeButton.addTarget(self, action: #selector(qrcodeReader), for: .touchUpInside)
    }
    
    //MARK: - qrcodeReader function
    @objc fileprivate func qrcodeReader(){
        
        readerVC.delegate = self
        
        readerVC.completionBlock = {
            (result: QRCodeReaderResult?) in
            
            
            guard let scannedString = result?.value else{
                return
            }
            
            print(scannedString)
            
            self.webView.load(URLRequest(url: URL(string: scannedString)!))
        }
        
        readerVC.modalPresentationStyle = .formSheet
        
        present(readerVC, animated:true, completion: nil)
    }
    
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
      reader.stopScanning()

      dismiss(animated: true, completion: nil)
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
      reader.stopScanning()

      dismiss(animated: true, completion: nil)
    }


}

