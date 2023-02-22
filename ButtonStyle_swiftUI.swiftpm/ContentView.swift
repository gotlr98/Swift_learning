import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            Button(
                action: {
                    print("Button Clicked!")
                }, label: {
                    Text("Tab")

                }
            ).buttonStyle(MyButtonStyle(color: Color.blue, type: .tab))
            
            Button(
                action: {
                    print("Button Clicked!")
                }, label: {
                    Text("Long Click")

                }
            ).buttonStyle(MyButtonStyle(color: Color.green, type: .long))
            
            Button(
                action: {
                    print("Button Clicked!")
                }, label: {
                    Text("Rotate Button")

                }
            ).buttonStyle(MyRotateButtonStyle(color: Color.pink))
        }
    }
}


struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
