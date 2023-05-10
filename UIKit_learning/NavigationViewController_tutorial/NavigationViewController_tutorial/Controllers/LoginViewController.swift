//
//  ViewController.swift
//  NavigationViewController_tutorial
//
//  Created by HaeSik Jang on 2023/05/10.
//

import UIKit

class LoginViewController: UIViewController {

    // 뷰가 생성되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 상단 네비게이션 바 숨김처리
        
        self.navigationController?.isNavigationBarHidden = true
    }


}

