//
//  LoginScreen.swift
//  Google_Login_Test
//
//  Created by HaeSik Jang on 2023/03/14.
//

import Foundation
import SwiftUI
import FirebaseAuth
import GoogleSignIn
import Firebase

struct LoginScreen: View{
    var body: some View{
        VStack{
            Text("")
            
            Button(action: {
                guard let clientID = FirebaseApp.app()?.options.clientID else { return }

                // Create Google Sign In configuration object.
                let config = GIDConfiguration(clientID: clientID)
                GIDSignIn.sharedInstance.configuration = config

                // Start the sign in flow!
                GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) { result, error in
                  guard error == nil else {
                    // ...
                      return
                  }

                  guard let user = result?.user,
                    let idToken = user.idToken?.tokenString
                  else {
                    // ...
                      return
                  }

                  let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                                 accessToken: user.accessToken.tokenString)

                  // ...
                    
                    Auth.auth().signIn(with: credential) { result, error in
                        // TODO - Manager Error
                        
                        guard error == nil else{
                            return
                        }
                        
                        print("Sign In")
                    }
                }
            }, label: {
                Rectangle()
                    .frame(width: 50, height: 50)
                    .cornerRadius(20)
                    .foregroundColor(Color.black)
            })
        }
    }
}


struct LoginScreen_Previews: PreviewProvider{
    static var previews: some View{
        LoginScreen()
    }
}
