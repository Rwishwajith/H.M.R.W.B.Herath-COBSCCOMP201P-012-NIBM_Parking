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
    // AnimatedView()
        ZStack{
            Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1))
                .ignoresSafeArea()
            Button("CONTINUE TO THE APP")
                {self.isPresented.toggle()
                
            }
            .fullScreenCover(isPresented: $isPresented, content : FullScreenModalView.init)
            .foregroundColor(.white)
            .frame(width: 250, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            Image("logo").resizable().frame(width: 100, height: 40, alignment: .center )   .padding(.top, 600)

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
}*/
