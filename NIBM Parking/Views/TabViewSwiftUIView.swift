//
//  TabViewSwiftUIView.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-23.
//

import SwiftUI

struct TabViewSwiftUIView: View {
    
    @State var selectedTab: Int = 0
    var body: some View {
        TabView(selection: $selectedTab)
        {
            HomeSwiftUIView()
                .tabItem {
                    Image(systemName:"house.fill")
                    Text("Home")
                    
                }
                .tag(0)
            BookingSwiftUIView()
                .tabItem {
                    Image(systemName:"p.square.fill")
                    Text("Booking")
                    
                }
                .tag(1)
            SettingsSwiftUIView()
                .tabItem {
                    Image(systemName:"gear")
                    Text("Settings")
                    
                }
                .tag(2)
        }
    }
    }

struct TabViewSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewSwiftUIView()
    }
}
