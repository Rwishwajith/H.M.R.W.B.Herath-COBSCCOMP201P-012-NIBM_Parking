//
//  sessionControl.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-16.
//

import Foundation

class sessionControl
{
    func userLogingStateGet() -> Bool
    {
        return UserDefaults.standard.bool(forKey: "IS_LOGGED")
       
    }
    
    func userLoginClear()
    {
        UserDefaults.standard.setValue(true, forKey: "IS_LOGGED")
    }
    
    func userLoginSave(user : PakingUser)
    {
        UserDefaults.standard.setValue(true, forKey: "IS_LOGGED")
        UserDefaults.standard.setValue(user.Username, forKey: "IS_NAME")
        UserDefaults.standard.setValue(user.UserEmail, forKey: "IS_EMAIL")
        UserDefaults.standard.setValue(user.Usermobilenumber, forKey: "IS_MOBILENO")
        UserDefaults.standard.setValue(user.NIBMRegNumber, forKey: "IS_NIBMID")
        UserDefaults.standard.setValue(user.VehicalNumber, forKey: "IS_VEHICALNO")
    }
    
    func userDataRetrive() -> PakingUser
    {
        let user = PakingUser(Username: UserDefaults.standard.string(forKey: "IS_NAME") ?? "",
                              UserEmail: UserDefaults.standard.string(forKey: "IS_EMAIL") ?? "",
                              Usermobilenumber: UserDefaults.standard.string(forKey: "IS_MOBILENO") ?? "",
                              UserPassword: "",
                              NIBMRegNumber: UserDefaults.standard.string(forKey: "IS_NIBMID") ?? "",
                              VehicalNumber: UserDefaults.standard.string(forKey: "IS_VEHICALNO") ?? "")
        return user
    }
}
