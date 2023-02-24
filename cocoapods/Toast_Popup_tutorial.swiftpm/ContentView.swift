import SwiftUI
import PopupView

struct ContentView: View {
    
    @State var shouldShowBottomSolidMessage: Bool = false
    @State var shouldShowBottomToastMessage: Bool = false
    @State var shouldShowTopSolidMessage: Bool = false
    
    func createBottomSolidMessage() -> some View{
        
        HStack(alignment: .center, spacing: 10){
            Image(systemName: "book.fill")
                .foregroundColor(Color.white)

            
            VStack(alignment: .leading){
                Text("Announce Message")
                    .fontWeight(.black)
                    .foregroundColor(Color.white)

                Text("Toast Message")
                    .foregroundColor(Color.white)
                    .lineLimit(2)
                
                Divider().opacity(0)
            }
//                    .background(Color.red)
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .frame(width: UIScreen.main.bounds.width)
        .padding(.bottom, UIApplication.shared.windows.first? .safeAreaInsets.bottom == 0 ? 0 : 15)
        .background(Color.green)
    }
    
    func createBottomToastMessage() -> some View{
        HStack(alignment: .top, spacing: 10){
            Image("poppy")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .cornerRadius(10)
                .frame(width:60, height: 60)
                .offset(y: 10)

            
            VStack(alignment: .leading){
                Text("Announce Message")
                    .fontWeight(.black)
                    .foregroundColor(Color.white)

                Text("Toast Message")
                    .foregroundColor(Color.white)
                    .lineLimit(2)
                
                Divider().opacity(0)
            }
        }
        .padding(15)
        .frame(width: 300)
        .background(Color.green)
        .cornerRadius(20)
    }
    
    func createTopSolidMessage() -> some View{
        HStack(alignment: .top, spacing: 10){
            Image("poppy")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .cornerRadius(10)
                .frame(width:60, height: 60)
                .offset(y: 10)

            
            VStack(alignment: .leading){
                Text("Announce Message")
                    .fontWeight(.black)
                    .foregroundColor(Color.white)

                Text("Toast Message")
                    .foregroundColor(Color.white)
                    .lineLimit(2)
                
                Divider().opacity(0)
            }
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .frame(width: UIScreen.main.bounds.width)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top == 0 ? 0 : 35)
        .background(Color.blue)
        .cornerRadius(20)
    }
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Button(action:{
                    self.shouldShowBottomSolidMessage = true
                }, label: {
                    Text("Bottom Solid Message")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                })
                
                Button(action:{
                    self.shouldShowBottomToastMessage = true
                }, label: {
                    Text("Bottom Toast Message")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                })
                
                Button(action:{
                    self.shouldShowTopSolidMessage = true
                }, label: {
                    Text("Top Solid Message")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                
                Spacer()
                
                

            }
            
        }
        .popup(isPresented: $shouldShowBottomSolidMessage, view:{
            self.createBottomSolidMessage()
        }, customize: {
            $0
                .autohideIn(2)
                .animation(.easeInOut)
                .type(.toast)
            
        })
        
        .popup(isPresented: $shouldShowBottomToastMessage, view:{
            self.createBottomToastMessage()
        }, customize: {
            $0
                .autohideIn(2)
                .animation(.spring())
                .type(.floater(verticalPadding: 20))
            
        })
        
        .popup(isPresented: $shouldShowTopSolidMessage, view:{
            self.createTopSolidMessage()
        }, customize: {
            $0
                .autohideIn(2)
                .position(.top)
                .animation(.spring())
                .type(.toast)
            
        })
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        
        ContentView()
    }
}
