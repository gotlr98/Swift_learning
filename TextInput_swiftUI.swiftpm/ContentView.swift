import SwiftUI

struct ContentView: View {
    
    @State private var id: String = ""
    @State private var pass: String = ""
    
    
    var body: some View {
        
        VStack(spacing: 10){
            HStack{
                TextField(" ID", text: $id)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(width: 300)
                    .cornerRadius(2)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    
                Button(action:{
                    if id.count != 0{
                        id = ""
                    }
                        
                }, label:{
                    Image(systemName:"x.circle.fill")
                        .foregroundColor(Color.black)
                })
                
            }
        
            HStack{
                SecureField(" Password", text: $pass)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(width: 300)
                    .cornerRadius(2)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                
                Button(action:{
                    if pass.count != 0{
                        pass = ""
                    }
                    
                }, label:{
                    Image(systemName:"x.circle.fill")
                        .foregroundColor(Color.black)
                })
            }
            HStack{
                Text("Password : ")
                Text(pass)
            }
            
        }.padding(.horizontal, 50)
        
    }
}


struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        
        ContentView()
    }
}
