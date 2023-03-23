//
//  Some_Protocol.swift
//  Protocol_Tutorial
//
//  Created by HaeSik Jang on 2023/03/21.
//

import Foundation
import SwiftUI



@dynamicMemberLookup
struct Some_Protocol{
    
    private let contacts: [String: String] = ["sik": "010-2222-2222", "aik": "010-1111-1111"]
    
    subscript(dynamicMember member: String) -> String{
        return contacts[member] ?? "114"
    }
}

let contacts: Some_Protocol = Some_Protocol()

let hahas: String = contacts.aik


