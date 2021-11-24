//
//  QRCodeSwiftUIView.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-19.
//

import SwiftUI
import CodeScanner
import Loaf

struct QRCodeSwiftUIView: View {
  @State var isPresentingScanner = false
  @State var scannedCode: String = "Scan QR Code to reserve the parking spot"
    
    var scannerSheet : some View{
        CodeScannerView(
            codeTypes: [.qr],
            completion: {
                result in
                if case let .success(code) = result
                {
                    self.scannedCode = code
                    self.isPresentingScanner = false
                    
                }
            }
       )
    }
    var body: some View {
        VStack(spacing: 10)
            {
            Text(Image(systemName: "car.fill")) + Text(" Selected Slot   :")
                .font(.subheadline)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Text(Image(systemName: "number.circle")) + Text(" Vehical Number :")
                .font(.subheadline)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Text(Image(systemName: "timer")) + Text(" Reserved At       :")
                .font(.subheadline)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Image("QR").resizable().frame(width: 200.0, height: 200.0, alignment: .top)
            Text(scannedCode)
            Button(action: {
                self.isPresentingScanner = true
                }) {
                Text("Scan Code")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: 100, height: 50, alignment: .center)
                }
            .background(Color(.systemBlue))
            .cornerRadius(6)
            .padding(.top, 15)
            .sheet(isPresented: $isPresentingScanner){
                self.scannerSheet
            }
            Button(action: {
                
                }) {
                Text("Confirm")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: 200, height: 50, alignment: .center)
                }
            .background(Color(.systemGreen))
            .cornerRadius(6)
            .padding(.top, 60)
        }
       
    }
}



struct QRCodeSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeSwiftUIView()
    }
}
