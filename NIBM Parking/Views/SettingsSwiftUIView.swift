//
//  SettingsSwiftUIView.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-18.
//

import SwiftUI



struct SettingsSwiftUIView: View {
    @State  var firstName = ""
    @State  var emailAddress = ""
    @State  var mobileNumber = ""
    @State  var nibmEmail = ""
    @State  var vehicalNumber = ""
    @State  var vehicalType = ""
    @State  var showDetails = false
    
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
                }
                Section(header: Text("Other Information"))
                    {
                    Button("SignOut")
                        {
                        showDetails.toggle()
                    }
                    if showDetails {
                                    Text("Signing out..")
                                }
                }
                
            }
            .navigationTitle("Settings")
        }
       
       
    }
}

struct SettingsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSwiftUIView()
    }
}
