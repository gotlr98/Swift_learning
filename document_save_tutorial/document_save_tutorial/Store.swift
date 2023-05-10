import SwiftUI

struct Store: View {
    
    @Binding var isToolBarItemHidden: Bool
    
//    let webview = Store_WebView(web: nil, req: URLRequest(url: URL(string: url)!))
    
    let webview: Store_WebView
    
    var body: some View {
        
        VStack{
            webview
            HStack() {
                Button(action: {
                    self.webview.goBack()
                }){
//                    Image(systemName: "chevron.left")
                    Image(systemName: "chevron.left")
                }.padding(32)

                Button(action: {
                    self.webview.reload()
                }){
                    Image(systemName: "arrow.clockwise")
                }.padding(32)

                Button(action: {
                    self.webview.goForward()
                }){
                    Image(systemName: "chevron.right")
                }.padding(32)
            }.frame(height: 32)
        }

    }
        
}

//struct Shop_Previews: PreviewProvider {
//    static var previews: some View {
//        Shop(url: "",isToolBarItemHidden: .constant(false))
//    }
//}
