//
//  inputValidator.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-17.
//

import Foundation

class inputValidator
{
    
    //Regular Expressions
    static let emailRegEx = "[A-Z0-9a-z.%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}"
    static let nameRegEx = "[A-Za-z ]{2,100}"
    static let mobileRegEx = "^(?:0|94|\\+94)?(?:(11|21|23|24|25|26|27|31|32|33|34|35|36|37|38|41|45|47|51|52|54|55|57|63|65|66|67|81|912)(0|2|3|4|5|7|9)|7(0|1|2|5|6|7|8)\\d)\\d{6}$"
    static let nibmidRegEx = "[A-Z0-9a-z.%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}"
    static let vehicleRegEx = "[A-Za-z ]{2,7}"
    
    //Check Email Validty
    static func emailValidity (email: String) -> Bool{
        let emailpat = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailpat.evaluate(with: email)
    }
    
    //Check Name Validity
    static func nameValidity (name: String) -> Bool{
        let namepat = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
        return namepat.evaluate(with: name)
    }
    
    //Check Mobile Number
    static func mobileValidity (mobileNumber: String) -> Bool{
        let mobilepat = NSPredicate(format: "SELF MATCHES %@", mobileRegEx)
        return mobilepat.evaluate(with: mobileNumber)
    }
    
    //Check Name Mobile Number
    static func nibmIDValidity (nibmID: String) -> Bool{
        let nibmIDpat = NSPredicate(format: "SELF MATCHES %@", nibmidRegEx)
        return nibmIDpat.evaluate(with: nibmID)
    }
    //Check Vehical Number
    static func vehicalnumberValidity (vehicalNumber: String) -> Bool{
        let vehiclepat = NSPredicate(format: "SELF MATCHES %@", vehicleRegEx)
        return vehiclepat.evaluate(with: vehicalNumber)
    }
    //Check Password
    static func passwordValidity (password: String, minLenght: Int, maxLenght: Int) -> Bool{
        return password.count >= minLenght && password.count <= maxLenght
    }
}
