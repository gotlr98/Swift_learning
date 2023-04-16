//
//  ViewController.swift
//  NiceApp
//
//  Created by HaeSik Jang on 2023/04/15.
//

import UIKit
import Lottie

class MainViewController: UIViewController {
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Main Scene"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 70)
        
        return label
    }()
    
    let animationView: LottieAnimationView = {
        
        let aniView = LottieAnimationView(name: "141812-security-unlock-animation")
        aniView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        
        aniView.contentMode = .scaleAspectFill
        
        return aniView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .black
        view.addSubview(animationView)
        animationView.center = view.center
        
        
        
        animationView.play{ (finish) in
             
            print("Animiation")
            
            self.view.backgroundColor = .white
            self.animationView.removeFromSuperview()
            
            self.view.addSubview(self.titleLabel)
            
//            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        }
        
        
    }


}

