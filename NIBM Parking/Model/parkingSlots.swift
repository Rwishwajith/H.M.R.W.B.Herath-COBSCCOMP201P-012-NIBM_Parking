//
//  parkingSlots.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 11/25/21.
//

import Foundation

struct ParkingSlot: Identifiable {
    let id = UUID()
    let slotID: String
    let vip: Bool
    let slotStatus: ParkingSlotStatus
    let vehicleNo: String
}

struct SlotModel: Codable, Identifiable {
    let id: String
    let slotID: Int
    let status: String
    let type: String
    let userID: String
    let vehicleNumber: String
    
    func getKeys() -> [String] {
        return ["slotID", "status", "type", "userID", "vehicleNo"];
    }
}

enum ParkingSlotStatus {
    case available, booked, reserved
}

struct SlotStatusString {
    let reserved = "RESERVED";
    let booked = "BOOKED";
    let available = "AVAILABLE"
    
    func getSlotStatusFromString(status: String) -> ParkingSlotStatus {
        var slotStatus: ParkingSlotStatus;
        
        switch (status) {
        case available:
            slotStatus = ParkingSlotStatus.available;
            break;
        case reserved:
            slotStatus = ParkingSlotStatus.reserved;
            break;
        case booked:
            slotStatus = ParkingSlotStatus.booked;
            break;
        default:
            slotStatus = ParkingSlotStatus.booked;
        }
        
        return slotStatus
    }
}
