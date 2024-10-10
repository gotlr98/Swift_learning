//
//  CustomeSideMenu.swift
//  Storyboard_practice
//
//  Created by HaeSik Jang on 10/8/24.
//

import Foundation
import UIKit

class CustomeSideMenu: UIViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.view.layer.cornerRadius = 20
                self.view.clipsToBounds = true
                
                self.view.backgroundColor = .blue.withAlphaComponent(0.3)
    }
}
