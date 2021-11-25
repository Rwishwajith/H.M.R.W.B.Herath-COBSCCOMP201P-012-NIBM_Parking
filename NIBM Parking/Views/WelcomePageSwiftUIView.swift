//
//  WelcomePageSwiftUIView.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-25.
//

import SwiftUI
import Lottie

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
    //AnimatedView()
        VStack{
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                .ignoresSafeArea()
            Image("Car")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 2)
            Text("Welcome to NIBM Parking")
            Text("We can take care of your Parking Problem")
            
            
            Button("CONTINUE TO THE APP")
                {self.isPresented.toggle()
                
            }
            .padding(.top)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .fullScreenCover(isPresented: $isPresented, content : FullScreenModalView.init)
            .foregroundColor(.white)
            .frame(width: 250, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            Image("logo").resizable().frame(width: 100, height: 40, alignment: .center )   .padding(.top, 200)

    }
    
}
}
struct WelcomePageSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageSwiftUIView()
    }
}

/*struct AnimatedView: UIViewRepresentable
{
    func makeUIView(context: Context) -> some AnimationView
    {
        let view = AnimationView(name: "NIBM-Parking", bundle: Bundle.main)
        view.play()
        return view
    }
    
    func updateUIView(_ uiView: AnimationView, context: Context) {
        //
    }
}
*/

