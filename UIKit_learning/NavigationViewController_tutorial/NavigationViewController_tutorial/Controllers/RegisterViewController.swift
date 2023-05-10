//
//  RegisterViewController.swift
//  NavigationViewController_tutorial
//
//  Created by HaeSik Jang on 2023/05/10.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController{
    
    @IBOutlet weak var btnForLoginViewController: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func onLoginViewControllerBtnClicekd(_ sender: UIButton) {
        print("Button clicked")
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
