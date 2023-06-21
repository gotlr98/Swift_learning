//
//  CustomPopUpViewController.swift
//  CustomePopUp_Tutorial
//
//  Created by HaeSik Jang on 2023/06/13.
//

import Foundation
import UIKit

class CustomPopUpViewController: UIViewController{
    
    @IBOutlet weak var goBtn: UIButton!
    @IBOutlet weak var bgBtn: UIButton!
    @IBOutlet weak var ContentView: UIView!
    
    @IBOutlet weak var openChatBtn: UIButton!
    
    var subscribeBtnCompletion: (() -> Void)?
    
    var myPopUpDelegate: PopUpDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ContentView.layer.cornerRadius = 30
        goBtn.layer.cornerRadius = 10
        openChatBtn.layer.cornerRadius = 10
        
    }
    
    @IBAction func youtubeBtnClicked(_ sender: UIButton) {
        
        print("youtubeBtnClicked")
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationName), object: nil)
        
        dismiss(animated: true)
    }
    
    @IBAction func bgBtnClicekd(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func onGoBtnClicked(_ sender: UIButton) {
        
        self.dismiss(animated: true)
        
        if let subscribeBtnCompletion = subscribeBtnCompletion{
            
            // 메인에 알리기
            subscribeBtnCompletion()
        }
    }
    
    @IBAction func onOpenChatBtnClicked(_ sender: UIButton) {
        
        myPopUpDelegate?.onOpenChatBtnClicekd()
        
        self.dismiss(animated: true)
    }
}
