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
        
        regsiteruser(email: txtemail.text!, password: txtpassword.text!)
        
    }
    @IBAction func signUpPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
   
}
