//
//  MyCustomTabView.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/20.
//

import SwiftUI


enum TabIndex{
    case home, profile, cart
}

struct MyCustomTabView: View{
    
    @State var tabIndex: TabIndex
    @State var largerScale: CGFloat = 1.3
    
    func changeMyView(tabIndex: TabIndex) -> MyView{
        switch tabIndex{
        case .home:
            return MyView(title: "Home", bgColor: Color.green)
        case .profile:
            return MyView(title: "Profile", bgColor: Color.blue)
        case .cart:
            return MyView(title: "Cart", bgColor: Color.purple)
        default:
            return MyView(title: "Home", bgColor: Color.green)
        }
    }
    
    func changeIconColor(tabIndex: TabIndex) -> Color{
        switch tabIndex{
        case .home:
            return Color.green
        case .profile:
            return Color.blue
        case .cart:
            return Color.purple
        default:
            return Color.gray
        }
    }
    
    func calcPosition(tabIndex: TabIndex, geometry: GeometryProxy) -> CGFloat{
        switch tabIndex{
        case .home:
            return -(geometry.size.width) / 3
        case .profile:
            return (geometry.size.width) / 3
        case .cart:
            return 0
        default:
            return -(geometry.size.width) / 3
        }
    }
    
    var body: some View{
        
        GeometryReader{ geometry in
            ZStack(alignment: .bottom){
                self.changeMyView(tabIndex: self.tabIndex)
                
                Circle()
                    .frame(width: 90, height: 90)
                    .foregroundColor(Color.white)
                    .offset(x: self.calcPosition(tabIndex: self.tabIndex, geometry: geometry), y: UIApplication.shared.windows.first?
                        .safeAreaInsets.bottom == 0 ? 20 : 0)
                
                VStack(spacing: 0){
                    HStack(spacing: 0){
                        Button(action:{
                            print("Home Clicked")
                            
                            withAnimation{
                                self.tabIndex = .home
                            }
                            
                        }){
                            Image(systemName: "house.fill")
                                .font(.system(size: 25))
                                .scaleEffect(self.tabIndex == .home ? self.largerScale : 1.0)
                                .frame(width: geometry.size.width / 3, height: 50)
                                .foregroundColor(self.tabIndex == .home ? self.changeIconColor(tabIndex: self.tabIndex) : Color.gray)
                                .offset(y: self.tabIndex == .home ? -10 : 0)
                        }
                        .background(Color.white)
                        
                        Button(action:{
                            print("Cart Clicked")
                            
                            withAnimation{
                                self.tabIndex = .cart
                            }
                            
                        }){
                            Image(systemName: "cart.fill")
                                .font(.system(size: 25))
                                .scaleEffect(self.tabIndex == .cart ? self.largerScale : 1.0)
                                .frame(width: geometry.size.width / 3, height: 50)
                                .foregroundColor(self.tabIndex == .cart ? self.changeIconColor(tabIndex: self.tabIndex) : Color.gray)
                                .offset(y: self.tabIndex == .cart ? -10 : 0)
                        }
                        .background(Color.white)
                        
                        Button(action:{
                            print("Profile Clicked")
                            
                            withAnimation{
                                self.tabIndex = .profile
                            }
                            
                        }){
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 25))
                                .scaleEffect(self.tabIndex == .profile ? self.largerScale : 1.0)
                                .frame(width: geometry.size.width / 3, height: 50)
                                .foregroundColor(self.tabIndex == .profile ? self.changeIconColor(tabIndex: self.tabIndex) : Color.gray)
                                .offset(y: self.tabIndex == .profile ? -10 : 0)
                        }
                        .background(Color.white)
                    }
                    
                    Rectangle()
                        .frame(height: UIApplication.shared.windows.first? .safeAreaInsets.bottom == 0 ? 0 : 20)
                        .foregroundColor(Color.white)
                }
                
                
            }
        }
        .edgesIgnoringSafeArea(.all)

    }
}


struct MyCustomTabView_Previews: PreviewProvider{
    static var previews: some View{
        MyCustomTabView(tabIndex: .home, largerScale: 1.3)
    }
}
