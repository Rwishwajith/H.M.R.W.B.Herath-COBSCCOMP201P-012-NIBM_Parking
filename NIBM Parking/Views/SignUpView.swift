//
//  SignUpSwiftUIView.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-20.
//


import SwiftUI

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @State var nic = ""
    @State var name = ""
    @State var vehicleNo = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View{
        VStack {
            Image("vector-logo-car-bicycle-parking-area-zone-156033342")
                .resizable()
                .scaledToFit()
                .frame(width:150, height: 150)
            
            VStack {
                TextField("User Email",text:$email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                TextField("NIC",text:$nic)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                TextField("Name",text:$name)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
            
                TextField("Vehicle Number",text:$vehicleNo)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                Button(action: {
                    
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    viewModel.signUp(email: email, password: password , name: name, nicNumber: nic , vehicleNumber: vehicleNo)
                    
                }, label: {
                    Text("Create Account")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height:50)
                        .cornerRadius(8)
                        .background(Color.blue)
                
                })
        }
        .padding()
            NavigationLink("Terms & Conditions", destination:EmptyView()).foregroundColor(.blue)
            
                Spacer()

                }
            .navigationTitle("Create Account")
            .padding()
        
        
    }
}
