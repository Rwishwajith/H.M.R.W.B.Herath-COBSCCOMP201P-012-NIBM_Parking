//
//  BookingSlotsViewModel.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 11/25/21.
//

import Foundation
import SwiftUI

class BookingSlotsViewModel: ObservableObject {
    
  
    func getAvailableSlots(completion: @escaping ([SlotModel]) -> ()) {
        
        //var parkingSlotAvailability
        
      /*  parkingSlotAvailability = self.slotRef
            .order(
                by: "slotID",
                descending: true)
            .whereField(
                "status",
                in: ["AVAILABLE"])
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Unable to fetch data: \(error!)")
                    return
                }
                
                let slots = documents.map { d in
                    return SlotModel(id: d.documentID,
                                     slotID: d["slotID"] as? Int ?? 0,
                                     status: d["status"] as? String ?? "",
                                     type: d["type"] as? String ?? "",
                                     userID: d["userID"] as? String ?? "",
                                     vehicleNo: d["vehicleNo"] as? String ?? "")
                }
                
                DispatchQueue.main.async {
                    completion(slots)
                }
            } */
    }
}
