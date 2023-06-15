//
//  ViewController.swift
//  CustomePopUp_Tutorial
//
//  Created by HaeSik Jang on 2023/06/13.
//

import UIKit
import WebKit

class ViewController: UIViewController, PopUpDelegate {

    @IBOutlet weak var PopUpBtn: UIButton!
    @IBOutlet weak var myWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onCreatePopUpBtnClicked(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard.init(name: "PopUp", bundle: nil)
        let alertPopUpVC = storyBoard.instantiateViewController(identifier: "AlertPopUpVC") as CustomPopUpViewController
        
        // PopUp Setting
        alertPopUpVC.modalPresentationStyle = .overCurrentContext
        
        // Dismissing Style Setting
        alertPopUpVC.modalTransitionStyle = .crossDissolve
        
        alertPopUpVC.subscribeBtnCompletion = {
            
            let URL = URL(string: "https://www.youtube.com")
            self.myWebView.load(URLRequest(url: URL!))
        }
        
        alertPopUpVC.myPopUpDelegate = self
        
        self.present(alertPopUpVC, animated: true)
    }
    
    func onOpenChatBtnClicekd() {
        <#code#>
    }
    
}

