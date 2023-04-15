//
//  ViewController.swift
//  NiceApp
//
//  Created by HaeSik Jang on 2023/04/15.
//

import UIKit

class MainController: UIViewController {
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 70)
        
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

