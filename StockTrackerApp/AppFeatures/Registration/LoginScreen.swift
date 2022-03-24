//
//  LoginScreen.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 2/10/22.
//

import SwiftUI
import FirebaseAuth

class AppLayoutModel: ObservableObject {

    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    //checks of sign in was a success
    var signInSuccess: Bool {
        return auth.currentUser != nil //we are signed in if it is not nil
    }
    
    //sign in fucntion
    func signIn (email: String, password: String ) {
        auth.signIn (withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            } //sign in was good
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    //sign up function
    func signUp (email: String, password: String ) {
        auth.createUser (withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            } //sign up was good
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
    }
    
}

struct LoginScreen: View {

    @EnvironmentObject var viewModel: AppLayoutModel
    
    var body: some View {
        
    
            if viewModel.signInSuccess {
                VStack {
                        ContentView()
                    //sign out button
                    //Button (action: {
                        //viewModel.signOut()
                    //},label: {
                        //Text("Sign Out")
                            //.frame(width: 90, height: 30)
                            //.background(Color.green)
                            //.foregroundColor(Color.black)
                            //.padding()
                    //})
                }
            }

            if  viewModel.signInSuccess == false {
                NavigationView {
                    SignInLayout()
                }
            }
       //}
            
        //}
        //.onAppear {
           //viewModel.signedIn = viewModel.signInSuccess //public binding to allow updates in real time
        //}
        
    }
}


struct SignInLayout: View {
    
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppLayoutModel
    
    var body: some View {
        VStack {
            Image("Image-1")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)
            
            VStack {
                //email input as a secure field
                TextField ("Secure Email", text: $email)
                //Text("You entered: \(email_Input)")
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                //.background(Color(.secondarySystemBackground))
                    .background(ZStack(alignment: .leading) {
                        RoundedRectangle (cornerRadius: 15).fill(Color.gray.opacity(20))
                    })
                //password input as a secure field
                SecureField ("Secure Password", text: $password)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                //.background(Color(.secondarySystemBackground))
                    .background(ZStack(alignment: .leading) {
                        RoundedRectangle (cornerRadius: 15).fill(Color.gray.opacity(20))
                    })
                //Spacer()
                Text("")
                Button (action:  {
                    
                    //make sure email and password is not empty
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    viewModel.signIn(email: email, password: password)
                    
                }, label: {
                    Text ("Sign in")
                    //RoundedRectangle (cornerRadius: 5).fill(Color.gray.opacity(100))
                        .frame(width: 70, height: 30)
                        .foregroundColor(Color.black)
                    //.background(Color.green)
                    //.background(in: RoundedRectangle(cornerRadius: 5))
                        .background(ZStack(alignment: .leading) {
                            RoundedRectangle (cornerRadius: 5).fill(Color.green.opacity(50))
                            Image(systemName: "key")
                                .foregroundColor(Color.gray)
                                .padding(.leading, -30)
                        })
                })
                
            NavigationLink ("Create Account", destination: SignUpLayout())
                    .padding()
            }
            .padding()
            Spacer()
            
        }
        .navigationTitle("Sign in")
        //.foregroundColor(Color.black)
        
    }
}

struct SignUpLayout: View {
    
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppLayoutModel
    
    var body: some View {
        VStack {
            Image("Image-1")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)
            
            
            VStack {
                //email input as a secure field
                TextField ("Secure Email", text: $email)
                //Text("You entered: \(email_Input)")
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                //.background(Color(.secondarySystemBackground))
                    .background(ZStack(alignment: .leading) {
                        RoundedRectangle (cornerRadius: 15).fill(Color.gray.opacity(20))
                    })
                //password input as a secure field
                SecureField ("Secure Password", text: $password)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                //.background(Color(.secondarySystemBackground))
                    .background(ZStack(alignment: .leading) {
                        RoundedRectangle (cornerRadius: 15).fill(Color.gray.opacity(20))
                    })
                //Spacer()
                Text("")
                Button (action:  {
                    
                    //make sure email and password is not empty
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    viewModel.signUp(email: email, password: password)
                    
                }, label: {
                    Text ("Create")
                    //RoundedRectangle (cornerRadius: 5).fill(Color.gray.opacity(100))
                        .frame(width: 70, height: 30)
                        .foregroundColor(Color.black)
                    //.background(Color.green)
                    //.background(in: RoundedRectangle(cornerRadius: 5))
                        .background(ZStack(alignment: .leading) {
                            RoundedRectangle (cornerRadius: 5).fill(Color.green.opacity(50))
                            Image(systemName: "key")
                                .foregroundColor(Color.gray)
                                .padding(.leading, -30)
                        })
                })
                
            }
            .padding()
            Spacer()
            
        }
        .navigationTitle("Create Account")
        
    }
    
}


struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
            .preferredColorScheme(.dark)
            
    }
}
