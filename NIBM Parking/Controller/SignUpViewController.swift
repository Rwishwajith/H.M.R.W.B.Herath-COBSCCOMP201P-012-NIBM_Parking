//
//  SignUpViewController.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-16.
//

import UIKit
import Firebase
import Loaf

class SignUpViewController: UIViewController {
    
  
    
    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtphonenumber: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtnibmid: UITextField!
    @IBOutlet weak var txtvehicalNumber: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

        // Do any additional setup after loading the view.
    }
    
    func regsiteruser(user : PakingUser)
    {
        Auth.auth().createUser(withEmail: user.UserEmail, password: user.UserPassword) { authResult, error in
            if let error = error{
                print(error.localizedDescription)
                Loaf("User Registration Failed!", state: .error, sender: self).show()
                return
            }
            
            self.saveuserdataDatabase(user: user)
        }
    }
    
    //Save data into the Database
    func saveuserdataDatabase(user : PakingUser)
    {
        
        let userData =
        [
            "userName" : user.Username,
            "userEmail" : user.UserEmail,
            "userMobile" : user.Usermobilenumber,
            "userPassword" : user.UserPassword,
            "nibmID" : user.NIBMRegNumber,
            "userVehical" : user.VehicalNumber
        ]
        
        self.ref.child("users").child(user.UserEmail.replacingOccurrences(of: "@", with: "_").replacingOccurrences(of: ".", with: "_")).setValue(userData)
        {
            (error, ref) in
            
            if let error = error
            {
                print(error.localizedDescription)
                Loaf("Failed to save User data to the Database", state: .error, sender: self).show()
                return
            }
            Loaf("User data saved to the Database", state: .success, sender: self).show()
            {
                type in
                self.dismiss(animated: true, completion: nil)
            }
            
        }
        
    }
    
    
    
    @IBAction func onSignUpPressed(_ sender: UIButton)
    {
        
        if !inputValidator.nameValidity(name: txtusername.text ?? "")
        {
            Loaf("Username is Invalid", state: .error, sender: self).show()
            return
        }
        
        if !inputValidator.emailValidity(email: txtemail.text ?? "")
        {
            Loaf("Email address is invalid", state: .error, sender: self).show()
            return
        }
        if !inputValidator.mobileValidity(mobileNumber: txtphonenumber.text ?? "")
        {
            Loaf("Mobile Number is in invalid format", state: .error, sender: self).show()
            return
        }
        
        if !inputValidator.passwordValidity(password: txtpassword.text ?? "", minLenght: 8, maxLenght: 60)
        {
            Loaf("Password is in invalid format", state: .error, sender: self).show()
            return
        }
        if !inputValidator.nibmIDValidity(nibmID: txtnibmid.text ?? "")
        {
            Loaf("NIBM ID is invalid", state: .error, sender: self).show()
            return
        }
        if !inputValidator.vehicalnumberValidity(vehicalNumber: txtvehicalNumber.text ?? "")
        {
            Loaf("Vehical Number is invalid", state: .error, sender: self).show()
            return
        }
        
        let user = PakingUser(Username: txtusername.text ?? "", UserEmail: txtemail.text ?? "", Usermobilenumber: txtphonenumber.text ?? "", UserPassword: txtpassword.text ?? "", NIBMRegNumber: txtnibmid.text ?? "", VehicalNumber: txtvehicalNumber.text ?? "")
        
        regsiteruser(user: user)
        
    }
    @IBAction func signUpPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
   
}
