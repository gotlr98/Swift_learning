//
//  Image_Test.swift
//  document_save_tutorial
//
//  Created by HaeSik Jang on 2023/04/12.
//

import SwiftUI
import Kingfisher

func check_url_valid(url: String) -> Bool{
    var isVaild: Bool = false
    
    KFImage(URL(string: url))
        .placeholder{
            Color.gray
        }
        .onSuccess{ s in
            isVaild = true
        }
        .onFailure{ e in
            print("it's in")
            isVaild = false
        }
    
    return isVaild
}


func imageDownload(url: URL) -> Bool{
    
    var isValid: Bool = false
    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    URLSession.shared.dataTask(with: request) { data, response, error in
        guard
            let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
            let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
            let data = data, error == nil
            else {
                print("Download image fail : \(url)")
                isValid = false
            return
        }
        print("it' in")
        

    }.resume()
    isValid = true
    
    return isValid
}

struct Image_Test: View {
    var body: some View {
        Button(action: {
            if imageDownload(url: URL(string: "https://shop-phinf.pstatic.net/20220526_54/1653542643176gHTRN_JPEG/101029_1.jpg?type=f140")!){
                print("success")
            }
            else{
                print("fail")
            }
        }, label: {
            if imageDownload(url: URL(string: "https://shop-phinf.pstatic.net/20220526_54/1653542643176gHTRN_JPEG/101029_1.jpg?type=f140")!){
                Text("success")
            }
            else{
                Text("fail")
            }
        })
    }
}

struct Image_Test_Previews: PreviewProvider {
    static var previews: some View {
        Image_Test()
    }
}
