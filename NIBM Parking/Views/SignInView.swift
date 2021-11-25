//
//  SignUpSwiftUIView.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-20.
//

import SwiftUI

struct SignInView: View{
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView{
            
        VStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:150, height: 150)
                
                VStack {
                    TextField("User Name",text:$email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        
                        viewModel.signIn(email: email, password: password)
                        
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height:50)
                            .cornerRadius(8)
                            .background(Color.blue)
                    
                    })
                    
                    NavigationLink("Create Account", destination: SignUpView())
                        .padding()
                    
               
            }
            .padding()

          Spacer()
}
            .navigationTitle("Sign In")
        }
        
    }
}
