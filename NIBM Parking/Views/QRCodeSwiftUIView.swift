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
            Text(scannedCode)
            
            Button("Sacn QR Code")
            {
                self.isPresentingScanner = true
            }
            .sheet(isPresented: $isPresentingScanner){
                self.scannerSheet
            }
        }
    }
}



struct QRCodeSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeSwiftUIView()
    }
}
