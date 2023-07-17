//
//  ViewController.swift
//  test_app
//
//  Created by HaeSik Jang on 2023/07/11.
//

import UIKit
import ImageSlideshow
import ImageSlideshowKingfisher

class ViewController: UIViewController {
    
    lazy var imageScrollView = UIScrollView()
    let imagePageControl = UIPageControl()
    let imageNumberLabel = UILabel()
    
    var img_url: [String] = []
    
    let url = "https://image.tmdb.org/t/p/w220_and_h330_face/fKQqZEDmvKMCXEQztvMJHGou9dO.jpg"
    
    let slide: ImageSlideshow = {
        let slide = ImageSlideshow()
        slide.isUserInteractionEnabled = true
        slide.slideshowInterval = 2.5
        slide.contentScaleMode = .scaleAspectFill
        
        return slide
    }()
    
    override func viewDidLoad() {
//        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let label: UIButton = .init(frame: .init())
        
        label.setTitle("등록하기", for: .normal)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(label)
        
    }
    
    override func loadView() {
        
//        let indicator = LabelPageIndicator()
//        slide.pageIndicator = indicator
//        slide.setImageInputs([KingfisherSource(urlString: url)!,
//                             KingfisherSource(urlString: url)!])
//
//        self.view.addSubview(slide)
//
//        slide.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            slide.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            slide.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            slide.topAnchor.constraint(equalTo: self.view.topAnchor),
//            slide.heightAnchor.constraint(equalToConstant: 300)
//        ])
    }
    
    
}

