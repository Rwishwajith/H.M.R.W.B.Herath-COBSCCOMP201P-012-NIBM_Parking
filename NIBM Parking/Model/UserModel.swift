//
//  UserModel.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-25.
//

import Foundation
class UserModel: ObservableObject{
    @Published  var email = ""
    @Published  var password = ""
    @Published  var nicNumber = ""
    @Published  var vehicalNumber = ""
    
}
