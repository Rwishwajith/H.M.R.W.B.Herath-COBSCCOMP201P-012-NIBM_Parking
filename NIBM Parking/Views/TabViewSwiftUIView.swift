//
//  TabViewSwiftUIView.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-23.
//

import SwiftUI

struct TabViewSwiftUIView: View {
    @State var selectedTab: Int = 0
    let sessionContrl = sessionControl()
    var body: some View {
        TabView(selection: $selectedTab)
        {
            HomeSwiftUIView()
                .tabItem {
                    Image(systemName:"house.fill")
                    Text("Home")
                }
                .tag(0)
           
            if sessionContrl.userLogingStateGet()
            {
                    BookingSwiftUIView()
                        .onAppear{
                            sessionContrl.userDataRetrive()
                        }
                        .tabItem {
                            Image(systemName:"p.square.fill")
                            Text("Booking")
                            
                        }
                }
            else{
             LoginSwiftUIView()
                .onAppear()
                    .tabItem {
                        Image(systemName:"p.square.fill")
                        Text("Booking")
                        
                    }
                    .tag(1)
            }
            if sessionContrl.userLogingStateGet()
            {
                SettingsSwiftUIView()
                    .tabItem {
                        Image(systemName:"gear")
                        Text("Settings")
                        
                    }
                    .tag(2)
            }
            else
            {
                SettingsSwiftUIView()
                    .tabItem {
                        Image(systemName:"gear")
                        Text("Settings")
                        
                    }
                    .tag(2)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    }

struct TabViewSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewSwiftUIView()
    }
}
