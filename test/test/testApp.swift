//
//  testApp.swift
//  test
//
//  Created by HaeSik Jang on 2023/02/27.
//

import SwiftUI

@main
struct testApp: App {
    
    @State var selectedTab = TabIdentifier.todos
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab, content:{
                ToDosView().tabItem{
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("TodoList")
                    }
                }.tag(TabIdentifier.todos)
                ProfileView().tabItem{
                    VStack{
                        Image(systemName: "person.circle.fill")
                        Text("Profile")
                    }
                }.tag(TabIdentifier.profile)
            })
            .onOpenURL(perform: { url in
                // 열려야 하는 url 처리
                
                guard let tabId = url.tabIdentifier else{return}
                selectedTab = tabId
            })
//            ContentView()
        }
    }
}

struct testApp_Previews: PreviewProvider{
    static var previews: some View{
//        testApp()
        Text("Hello, world")
    }
}

enum TabIdentifier: Hashable{
    case todos, profile
}

enum PageIdentifier: Hashable{
    case todoItem(id: UUID)
}

extension URL{
    
    var isDeepLink: Bool{
        return scheme == "deeplink-swiftui"
    }
    
    var tabIdentifier: TabIdentifier? {
        guard isDeepLink else{
            return nil
        }
        
        switch host{
        case "todos":
            return .todos
        case "profile":
            return .profile
                
        default:
            return nil
        }
    }
    
    var detailPage: PageIdentifier?{
        guard let tabId = tabIdentifier,
              pathComponents.count > 1,
              let uuid = UUID(uuidString: pathComponents[1])
        else{
            return nil
        }
        
        switch tabId{
        case .todos:
            return .todoItem(id: uuid)
        default:
            return .todoItem(id: uuid)
        }
        
        
    }
}
