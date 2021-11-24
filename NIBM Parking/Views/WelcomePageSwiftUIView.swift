//
//  WelcomePageSwiftUIView.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-25.
//

import SwiftUI

struct FullScreenModalView : View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        TabViewSwiftUIView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomePageSwiftUIView: View {
    @State private var isPresented = false
    var body: some View {
        Button("Continue")
            {self.isPresented.toggle()
            
        }
        .fullScreenCover(isPresented: $isPresented, content : FullScreenModalView.init)
    }
    }

struct WelcomePageSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageSwiftUIView()
    }
}
