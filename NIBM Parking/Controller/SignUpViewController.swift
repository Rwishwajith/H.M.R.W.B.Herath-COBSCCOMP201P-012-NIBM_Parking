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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func regsiteruser(email: String, password: String)
    {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error{
                print(error.localizedDescription)
                Loaf("User Registration Failed!", state: .error, sender: self).show()
                return
            }
            if let result = authResult
            {
                print ("New User Registerd: \(result.user.email ?? "Cannot be found")")
                Loaf("Registration Successfull", state: .success, sender: self).show()

            }
            
        }
    }

    @IBAction func onSignUpPressed(_ sender: UIButton)
    {
     if inputValidation()
     {
        regsiteruser(email: txtemail.text!, password: txtpassword.text!)
     }
     else
     {
        print("Invalid data found in the given details")
     }
    }
    @IBAction func signUpPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
   
    
    func inputValidation() -> Bool
    {
        guard let username = txtusername.text else {
            print("Username cannot be empty")
            Loaf("Username cannot be empty", state: .error, sender: self).show()
            return false
        }
        
        guard let email = txtemail.text else {
            print("Email cannot be empty")
            Loaf("Email cannot be empty", state: .error, sender: self).show()
            return false
        }
        guard let usermobile = txtphonenumber.text else {
            print("Mobile number cannot be empty")
            Loaf("Mobile number cannot be empty", state: .error, sender: self).show()
            return false
        }
        guard let nibmid = txtnibmid.text else {
            print("NIBM ID cannot be empty")
            Loaf("NIBM ID cannot be empty", state: .error, sender: self).show()
            return false
        }
        guard let vehicalid = txtvehicalNumber.text else {
            print("Vehical Number cannot be empty")
            Loaf("Vehical Number cannot be empty", state: .error, sender: self).show()
            return false
        }
        guard let password = txtpassword.text else {
            print("Password cannot be empty")
            Loaf("Password cannot be empty", state: .error, sender: self).show()
            return false
        }
        
        if username.count<5
        {
            print("Enter a valid Username")
            Loaf("Enter a valid Username", state: .error, sender: self).show()
            return false
        }
        if email.count<10
        {
            print("Enter a valid Email Address")
            Loaf("Enter a valid Email Address", state: .error, sender: self).show()
            return false
        }
        if usermobile.count<10
        {
            print("Enter a valid Mobile Number")
            Loaf("Enter a valid Mobile Number", state: .error, sender: self).show()
            return false
        }
        if nibmid.count<12
        {
            print("Enter a valid NIBM ID")
            Loaf("Enter a valid NIBM ID", state: .error, sender: self).show()
            return false
        }
        if vehicalid.count<5
        {
            print("Enter a valid Vehical ID")
            Loaf("Enter a valid Vehical ID", state: .error, sender: self).show()
            return false
        }
        if password.count<8
        {
            print("Enter a valid Password")
            Loaf("Password lenght cannot be less than 8 characters", state: .error, sender: self).show()
            return false
        }
        
        return true
    }

}
