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
    
    func userLoginClear(PakingUser: PakingUser)
    {
        UserDefaults.standard.setValue(true, forKey: "IS_LOGGED")
    }
    
    func userLoginSave()
    {
        UserDefaults.standard.setValue(true, forKey: "IS_LOGGED")
    }
}
