//
//  MainMapVC.swift
//  Storyboard_practice
//
//  Created by HaeSik Jang on 10/3/24.
//

import Foundation
import UIKit
import Then

class MainMapVC: UIViewController{
    
    
    private var sideMenuViewController = CustomeSideMenu()
        private var dimmingView: UIView?
        
        private lazy var sideMenuButton = UIImageView().then {
            $0.image = UIImage(systemName: "text.justify")
            $0.tintColor = .black
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(presentSideMenu))
            $0.addGestureRecognizer(tap)
            $0.isUserInteractionEnabled = true
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("hello")
        
        addDimmingView()
        
        var button = UIImageView(image: UIImage(systemName: "text.justify"))
        self.view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    private func addDimmingView() {
        dimmingView = UIView(frame: self.view.bounds)
        dimmingView?.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        dimmingView?.isHidden = true
        view.addSubview(dimmingView!)
        
        view.addSubview(sideMenuButton)
        
        sideMenuButton.translatesAutoresizingMaskIntoConstraints = false
        sideMenuButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        sideMenuButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDimmingViewTap))
        dimmingView?.addGestureRecognizer(tapGesture)
        }
    
    @objc private func handleDimmingViewTap() {
            let sideMenuVC = self.sideMenuViewController
            
            UIView.animate(withDuration: 0.3, animations: {
                // 사이드 메뉴를 원래 위치로 되돌림.
                sideMenuVC.view.frame = CGRect(x: -self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                // 어두운 배경 뷰를 숨김.
                self.dimmingView?.alpha = 0
            }) { (finished) in
                // 애니메이션이 완료된 후 사이드 메뉴를 뷰 계층 구조에서 제거.
                sideMenuVC.view.removeFromSuperview()
                sideMenuVC.removeFromParent()
                self.dimmingView?.isHidden = true
            }
        }
    
    @objc private func presentSideMenu() {
            let sideMenuVC = self.sideMenuViewController
            
            // 사이드 메뉴 뷰 컨트롤러를 자식으로 추가하고 뷰 계층 구조에 추가.
            self.addChild(sideMenuVC)
            self.view.addSubview(sideMenuVC.view)
            
            // 사이드 메뉴의 너비를 화면 너비의 80%로 설정.
            let menuWidth = self.view.frame.width * 0.8
            let menuHeight = self.view.frame.height
            let yPos = (self.view.frame.height / 2) - (menuHeight / 2) // 중앙에 위치하도록 yPos 계산

            
            // 사이드 메뉴의 시작 위치를 화면 왼쪽 바깥으로 설정.
            sideMenuVC.view.frame = CGRect(x: -menuWidth, y: yPos, width: menuWidth, height: menuHeight)
            
            // 어두운 배경 뷰를 보이게 합니다.
            self.dimmingView?.isHidden = false
            self.dimmingView?.alpha = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                // 사이드 메뉴를 화면에 표시.
                sideMenuVC.view.frame = CGRect(x: 0, y: yPos, width: menuWidth, height: menuHeight)
                // 어두운 배경 뷰의 투명도를 조절.
                self.dimmingView?.alpha = 0.5
            })
        }
}
