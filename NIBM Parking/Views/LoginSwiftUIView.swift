//
//  LoginSwiftUIView.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-19.
//

import SwiftUI
import FirebaseAuth

struct LoginSwiftUIView: View {
    var body: some View {
        Home()
    }
}

struct LoginSwiftUIView_Previews: PreviewProvider {
  
    static var previews: some View {
        
        LoginSwiftUIView()
    }
}


struct Home: View {
    
    @State var status = UserDefaults.standard.value(forKey: "IS_LOGGED") as? Bool ?? false
    
    var body: some View{
        VStack{
            if self.status{
                TabViewSwiftUIView()
                
            } else {
                VStack{
                    Login()
                }
                 .onAppear{
                    NotificationCenter.default.addObserver(forName: NSNotification.Name("IS_LOGGED"), object: nil, queue: .main) { (_) in
                        
                        self.status = UserDefaults.standard.value(forKey: "IS_LOGGED") as? Bool ?? false
                    }
                }
            }
        }
    }
}



struct Login: View{
    
    @State var email = ""
    @State var pass = ""
    @State var color = Color.black.opacity(0.7)
    @State var visible = false
    @State var alert = false
    @State var error = ""
    @State var title = ""
    
    let borderColor = Color(red: 107.0/255.0, green: 164.0/255.0, blue: 252.0/255.0)
    
    var body: some View{
        VStack(){
            Image("vector-logo-car-bicycle-parking-area-zone-156033342").resizable().frame(width: 200.0, height: 200.0, alignment: .top)
            
            Text("Welcome Back")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 15)
            
            TextField("Email Address",text:self.$email)
                .autocapitalization(.none)
                .padding()
                .background(RoundedRectangle(cornerRadius:6).stroke(borderColor,lineWidth:2))
                .padding(.top, 0)
            
            HStack(spacing: 15){
                VStack{
                    if self.visible {
                        TextField("Password", text: self.$pass)
                            .autocapitalization(.none)
                    } else {
                        SecureField("Password", text: self.$pass)
                            .autocapitalization(.none)
                    }
                }
                
                Button(action: {
                    self.visible.toggle()
                }) {
                    //Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(self.color)
                        .opacity(0.8)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 6)
            .stroke(borderColor,lineWidth: 2))
            .padding(.top, 10)
            
            HStack{
                Spacer()
                Button(action: {
                    self.ResetPassword()
                    self.visible.toggle()
                }) {
                    Text("Forget Password")
                        .fontWeight(.medium)
                        .foregroundColor(Color(.blue))
                }.padding(.top, 10.0)
            }
            
            // Sign in button
            Button(action: {
                self.Verify()
            }) {
                Text("Sign in")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                 .frame(width: UIScreen.main.bounds.width - 100)
            }
            .background(Color(.systemBlue))
            .cornerRadius(6)
            .padding(.top, 15)
            .alert(isPresented: $alert){()->Alert in
                return Alert(title: Text("\(self.title)"), message: Text("\(self.error)"), dismissButton:
                    .default(Text("OK").fontWeight(.semibold)))
            }
            
            HStack(spacing: 5){
               
                NavigationLink("Don't have an account?", destination: SignUpSwiftUIView())
                Text("Register now").multilineTextAlignment(.leading)
                
            }.padding(.top, 25)
        }
        .padding(.horizontal, 25)
        
    }
    
    func Verify(){
        if self.email != "" && self.pass != ""{
            Auth.auth().signIn(withEmail: self.email, password: self.pass) { (res, err) in
                
                if err != nil{
                    
                    self.error = err!.localizedDescription
                    self.title = "Login Error"
                    self.alert.toggle()
                    return
                }
                
                print("Login success!")
                UserDefaults.standard.set(true, forKey: "IS_LOGGED")
                NotificationCenter.default.post(name: NSNotification.Name("IS_LOGGED"), object: nil)
            }
        }else{
            self.title = "Login Error"
            self.error = "Please fill all the details"
            self.alert = true
        }
    }
    
    func ResetPassword(){
        if self.email != ""{
            
            Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
                
                if err != nil{
                    self.alert.toggle()
                    return
                }
                self.title = "Password Reset Sucessfully!"
                self.error = "The Password rest link is sent to your email!"
                self.alert.toggle()
            }
        }
        else{
            
            self.error = "Email filed is empty"
            self.alert.toggle()
        }
    }
}


