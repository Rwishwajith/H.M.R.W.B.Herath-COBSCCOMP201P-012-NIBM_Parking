//
//  UserViewModel.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-23.
//

import Foundation
import Firebase

class UserViewModel : ObservableObject
{
    @Published var list = [UserdetailsFirestore]()
    
    func getdatafromFireStore()
    {
        //Get ref to the db
        let db = Firestore.firestore()
    
        //read the documents
        db.collection("Users").getDocuments { snapshot, error in
            //check for errors
            
            if error == nil{
                if let snapshot = snapshot
                {
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map { doc in
                            
                            //create a userdetail item for each doc returns
                          return UserdetailsFirestore(id: doc.documentID,
                                                            username:doc["username"] as? String ?? "" ,
                                                            pass: doc["pass"] as? String ?? "",
                                                            repass: doc["repass"] as? String ?? "",
                                                            mobilenumber: doc["mobilenumber"] as? String ?? "",
                                                            nibmID: doc["nibmID"] as? String ?? "",
                                                            VehicalNumber: doc["VehicalNumber"] as? String ?? "")
                            }
                        }
                    }
                    //get all the documents
                    
                }
        else {
                //Handle Screen
            }
        }
    }

}
