//
//  HomeSwiftUIView.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-17.
//

import SwiftUI

struct HomeSwiftUIView: View {
    var body: some View {
        NavigationLink(destination: BookingSwiftUIView()){
            Text("Don't have an account?")
            .fontWeight(.bold)
                .foregroundColor(Color(.black))
        }
        
    }
}

struct HomeSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSwiftUIView()
    }
}

