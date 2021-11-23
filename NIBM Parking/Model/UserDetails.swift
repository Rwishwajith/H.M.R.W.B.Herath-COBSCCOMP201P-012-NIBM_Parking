//
//  UserDetails.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-23.
//

import Foundation

struct UserdetailsFirestore : Identifiable
{
    var id: String
    var username: String
    var email : String
    var pass: String
    var repass : String
    var mobilenumber : String
    var nibmID : String
    var VehicleNumber : String
}
