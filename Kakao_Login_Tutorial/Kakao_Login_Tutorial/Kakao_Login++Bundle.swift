//
//  Kakao_Login++Bundle.swift
//  Kakao_Login_Tutorial
//
//  Created by HaeSik Jang on 2023/03/15.
//

import Foundation

extension Bundle{
    var apiKey: String{
        guard let file = self.path(forResource: "MyApi", ofType: "plist") else {return ""}
        
        guard let resource = NSDictionary(contentsOfFile: file) else {return ""}
        guard let key = resource["API_KEY"] as? String else{ fatalError("MyApi - API_KEY Set Please")}
        return key
                
    }
}
