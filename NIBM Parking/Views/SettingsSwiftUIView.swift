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
    @ScaledMetric var size: CGFloat = 1
    @EnvironmentObject var viewModel: AuthViewModel
    @State var status = UserDefaults.standard.value(forKey: "IS_LOGGED") as? Bool ?? false
    let sessionContrl = sessionControl()
    @ObservedObject var model = UserViewModel()
    var body: some View {
        NavigationView
        {
            Form {
                Section(header: Text("Personal Information").foregroundColor(.black))
                    {
                    List(model.list){
                        item in
                        VStack(alignment: .leading,spacing: 10){
                            Label(item.username, systemImage: "person.circle.fill")
                            Divider()
                            Label(item.email, systemImage: "envelope.fill")
                            Divider()
                            Label(item.mobilenumber, systemImage: "phone.fill")
                            Divider()
                            Label(item.nibmID, systemImage: "envelope.circle.fill")
                            Divider()
                            Label(item.VehicleNumber, systemImage: "car.fill")
                            Divider()
                        }
                            
                    }.foregroundColor(.blue)
                    .onAppear()
                {
                    self.model.getdatafromFireStore()
                }
                }
                Section(header: Text("Other").foregroundColor(.black))
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
            .navigationBarBackButtonHidden(false)
            .listStyle(GroupedListStyle())
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
