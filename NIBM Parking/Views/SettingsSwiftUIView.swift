//
//  SettingsSwiftUIView.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-18.
//

import SwiftUI
import FirebaseAuth

struct SettingsSwiftUIView: View {
    @State  var firstName = ""
    @State  var emailAddress = ""
    @State  var mobileNumber = ""
    @State  var nibmEmail = ""
    @State  var vehicalNumber = ""
    @State  var vehicalType = ""
    @State  var showDetails = false
    @State private var willMoveToNextScreen = false
    @State private var action: Int? = 0
    @State var status = UserDefaults.standard.value(forKey: "IS_LOGGED") as? Bool ?? false
    let sessionContrl = sessionControl()
    @ObservedObject var model = UserViewModel()
    //let user = PakingUser(Username: String, UserEmail: <#T##String#>, Usermobilenumber: <#T##String#>, UserPassword: <#T##String#>, NIBMRegNumber: <#T##String#>, VehicalNumber: <#T##String#>)
    //@EnvironmentObject var user: User
    var body: some View {
        NavigationView
        {
            Form {
                Section(header: Text("Personal Information"))
                    {
                    Label("Username          :", systemImage: "person.circle.fill")
                    Label("Email                   :", systemImage: "envelope.fill")
                    Label("Mobile Number :", systemImage: "phone.fill")
                    Label("NIBM Email        :", systemImage: "envelope.circle.fill")
                    Label("Vehical Number :", systemImage: "car.fill")
                    
                }.onAppear(perform: fetch)
               
                Section(header: Text("Other"))
                    {
                        NavigationLink(destination:LoginSwiftUIView()) {
                                Text("Sign Out")
                                    .foregroundColor(.blue)
                                    .fontWeight(.bold)
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width - 100)
                            }.simultaneousGesture(TapGesture().onEnded{
                                try! Auth.auth().signOut()
                                sessionContrl.userLoginClear()
                                UserDefaults.standard.set(false, forKey: "IS_LOGGED")
                                NotificationCenter.default.post(name: NSNotification.Name("IS_LOGGED"), object: nil)
                                
                                        })
                }
                    }
            .navigationBarTitle("Settings", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
        }
        
      
       
        }
    init()
    {
        model.getdatafromFireStore()
    }
}
private func fetch() {
    let user = sessionControl.userDataRetrive
    }
struct SettingsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSwiftUIView()
            
    }
}
