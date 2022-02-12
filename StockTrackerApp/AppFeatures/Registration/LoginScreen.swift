//
//  LoginScreen.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 2/10/22.
//

import SwiftUI

struct LoginScreen: View {
    
    @State var email_Input = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                
                VStack {
                    //email input as a secure field
                    SecureField ("Secure Email", text: $email_Input)
                    //Text("You entered: \(email_Input)")
                        .padding()
                        //.background(Color(.secondarySystemBackground))
                        .background(ZStack(alignment: .leading) {
                            RoundedRectangle (cornerRadius: 15).fill(Color.gray.opacity(20))
                        })
                    //password input as a secure field
                    SecureField ("Secure Password", text: $email_Input)
                        .padding()
                        //.background(Color(.secondarySystemBackground))
                        .background(ZStack(alignment: .leading) {
                            RoundedRectangle (cornerRadius: 15).fill(Color.gray.opacity(20))
                        })
                    //Spacer()
                    Text("")
                    Button (action:  {
                        //code
                    }, label: {
                        Text ("Sign in")
                            //RoundedRectangle (cornerRadius: 5).fill(Color.gray.opacity(100))
                            .frame(width: 70, height: 30)
                            .foregroundColor(Color.black)
                            //.background(Color.green)
                            //.background(in: RoundedRectangle(cornerRadius: 5))
                            .background(ZStack(alignment: .leading) {
                                RoundedRectangle (cornerRadius: 5).fill(Color.green.opacity(50))
                                Image(systemName: "lock")
                                    .foregroundColor(Color.gray)
                                    .padding(.leading, -30)
                            })
                    })
        
                }
                .padding()
                Spacer()
                
            }
            .navigationTitle("Sign in")
            
            
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
            .preferredColorScheme(.dark)
    }
}
