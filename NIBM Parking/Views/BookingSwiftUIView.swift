//
//  BookingSwiftUIView.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-18.
//

import SwiftUI

struct BookingSwiftUIView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content:
                    {
                        HStack{
                            
                            Button(action: {}, label:
                                    {
                                        Image(systemName: "chevron.left").font(.title2)
                                            . foregroundColor(.black)
                                    })
                            Spacer()
                        }
                        .overlay(
                            
                        Text("Select a Parking Spot")
                            .font(.title2)
                            .foregroundColor(.blue)
                        .fontWeight(.semibold)
                        )
                        .padding()
                    })
            .background(Color(.white).ignoresSafeArea())
    }
}

struct BookingSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        BookingSwiftUIView()
    }
}
