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
      
        ZStack{
            Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1))
                .ignoresSafeArea()
            Button("CONTINUE TO THE APP")
                {self.isPresented.toggle()
                
            }
            .fullScreenCover(isPresented: $isPresented, content : FullScreenModalView.init)
            .padding()
            .foregroundColor(.white)
            .frame(width: 250, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            
        }
        
    }
    }

struct WelcomePageSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageSwiftUIView()
    }
}
