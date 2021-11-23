//
//  SignUpSwiftUIView.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-20.
//

import SwiftUI
import FirebaseAuth
import Firebase


struct SignUpSwiftUIView: View {
    var body: some View {
        SignUp()
    }
}

struct SignUpSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpSwiftUIView()

    }
}

struct SignUp: View{
    
    @State var status = UserDefaults.standard.value(forKey: "IS_LOGGED") as? Bool ?? false
    @State var username = ""
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @State var mobilenumber = ""
    @State var nibmID = ""
    @State var vehicalid = ""
    
    @State var color = Color.black.opacity(0.7)
    
    @State var visible = false
    @State var revisible = false
    
    @State var alert = false
    @State var error = ""
    
    let borderColor = Color(red: 107.0/255.0, green: 164.0/255.0, blue: 252.0/255.0)
    
    var body: some View{
   
        
        VStack(alignment: .leading){
            
            GeometryReader{_ in
                
                VStack{
                    Image("vector-logo-car-bicycle-parking-area-zone-156033342").resizable().frame(width: 120.0, height: 120.0, alignment: .center)
                    
                    Text("Create a new account")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                        .padding(.top, 0)
                    
                    TextField("Username",text:self.$username)
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius:6).stroke(self.borderColor,lineWidth:2))
                        .padding(.top, 0)
                    
                    TextField("Email Address",text:self.$email)
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius:6).stroke(self.borderColor,lineWidth:2))
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
                                .opacity(10)
                        }
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 6)
                    .stroke(self.borderColor,lineWidth: 2))
                    .padding(.top, 0)
            
                    
                    // Confirm password
                    HStack(spacing: 15){
                        VStack{
                            if self.revisible {
                                TextField("Confirm Password", text: self.$repass)
                                    .autocapitalization(.none)
                            } else {
                                SecureField("Confirm Password", text: self.$repass)
                                    .autocapitalization(.none)
                            }
                        }
                        
                        Button(action: {
                            self.revisible.toggle()
                        }) {
                            //Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
                            Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                .opacity(0.8)
                        }
                    }
                    
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 6)
                    .stroke(self.borderColor,lineWidth: 2))
                    .padding(.top, 0)
                    
                    TextField("Mobile Number",text:self.$mobilenumber)
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius:6).stroke(self.borderColor,lineWidth:2))
                        .padding(.top, 0)
                    
                    TextField("NIBM Email",text:self.$nibmID)
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius:6).stroke(self.borderColor,lineWidth:2))
                        .padding(.top, 0)
                    
                    TextField("Vehical Number",text:self.$vehicalid)
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius:6).stroke(self.borderColor,lineWidth:2))
                        .padding(.top, 0)
                    
                    
                    // Sign up button
                    Button(action: {
                        self.Register()
                    }) {
                        Text("Sign up")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
                    .background(Color(.systemBlue))
                    .cornerRadius(6)
                    .padding(.top, 15)
                    .alert(isPresented: self.$alert){()->Alert in
                        return Alert(title: Text("Sign up error"), message: Text("\(self.error)"), dismissButton:
                            .default(Text("OK").fontWeight(.semibold)))
                    }
                    
                }
                .padding(.horizontal, 25)
            }
        }
    }
    func Register(){
        if self.email != ""{
            
            if self.pass == self.repass{
                
                Auth.auth().createUser(withEmail: self.email, password: self.pass) { (res, err) in
                    AddinfotoFireStore(username: self.username, email: self.email, pass: self.pass, repass: self.repass, mobilenumber: self.mobilenumber, nibmID: self.nibmID, VehicleNumber: self.vehicalid)
                    if err != nil{
                        
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    
                    print("success")
                    UserDefaults.standard.set(true, forKey: "IS_LOGGED")
                    NotificationCenter.default.post(name: NSNotification.Name("IS_LOGGED"), object: nil)
                }
            }
            else{
                
                self.error = "Password mismatch"
                self.alert.toggle()
            }
        }
        else{
            
            self.error = "Please fill all required fields"
            self.alert.toggle()
        }
        
    }
    
    func AddinfotoFireStore(username : String, email: String, pass: String,  repass: String, mobilenumber: String, nibmID: String, VehicleNumber: String)
    {
        let db = Firestore.firestore()
        db.collection("Users").document().setData(["username": username, "email": email, "pass": pass, "repass": repass, "mobilenumber": mobilenumber,"nibmID": nibmID, "VehicleNumber": VehicleNumber])
    }
}
