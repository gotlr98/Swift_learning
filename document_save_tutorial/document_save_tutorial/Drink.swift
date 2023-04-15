//
//  Drink.swift
//  document_save_tutorial
//
//  Created by HaeSik Jang on 2023/04/10.
//

import SwiftUI
import RealmSwift

struct Drink: View {
    
    @State var drink: [Drink_Store] = []
    
    
    var body: some View {
        
        VStack{
            Button(action: {
                
                set_primary_drink()
//                remove_Drink()
                
                for i in get_All_Drink(){
                    print(i)
                }
                
                
            }, label: {
                Text("Button")
            })
        }
        
    }
}

struct Drink_Previews: PreviewProvider {
    static var previews: some View {
        Drink()
    }
}
