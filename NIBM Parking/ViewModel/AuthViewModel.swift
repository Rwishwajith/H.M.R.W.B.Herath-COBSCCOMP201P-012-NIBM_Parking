//
//  AuthViewModel.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class AuthViewModel: ObservableObject{
    
    let auth = Auth.auth()
    
    var db = Firestore.firestore()
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email,
                    password: password) { [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            
            DispatchQueue.main.async{
                //success
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email:String, password: String, name : String ,nicNumber: String, vehicleNumber: String){
        Auth.auth().createUser(withEmail: email, password: password){ (authResult, error) in
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                default:
                    print(error.localizedDescription)
                }
            } else {
                let user = Auth.auth().currentUser
                if let user = user {
                    let object :[String: Any] = [
                        "UserID":user.uid,
                        "Email" : email,
                        "Name":name,
                        "NIC" : nicNumber,
                        "VehicleNo" :vehicleNumber ]
                    var ref: DocumentReference? = nil
                    ref = self.db.collection("ParkingUsers").addDocument(data: object){ err in
                        if let err = err {
                            print("Error writing document: \(err)")
                        } else {
                            print("Document successfully written!")
                            DispatchQueue.main.async {
                                print("User signs up successfully")
                                self.signedIn = true
                            }
                        }
                    }
                    
                }
            }
        }
    }
    func signOut(){
        try? auth.signOut()
        
        self.signedIn = false
    }
}

