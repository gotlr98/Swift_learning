import SwiftUI

struct ContentView: View {
    
    // @State 값의 변화를 감지 -> 뷰에 적용
    @State
    private var isActivated: Bool = false
    
    var body: some View {
        
        NavigationView{
            VStack{
                HStack{
                    MyVstackView()
                    MyVstackView()
                    MyVstackView()
                } // Hstack
                .padding(isActivated ? 20.0 : 10.0)
                .background(isActivated ? Color.yellow : Color.blue)
                .onTapGesture{
                    print("Tap")
                    
                    // Animation
                    withAnimation{
                        // toggle() -> true 이면 false, false 이면 true
                        self.isActivated.toggle()
                    }
                }
                
                // Navigation Button(Link)
                NavigationLink(destination: MyTextView()){
                    Text("Navigation")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .background(Color.orange)
                        .cornerRadius(30)
                }.padding(.top, 50)
            
            } // Hstack

        }

    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
