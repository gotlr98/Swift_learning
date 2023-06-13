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
    
    var subscribeBtnCompletion: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ContentView.layer.cornerRadius = 30
        goBtn.layer.cornerRadius = 10
        
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
}
