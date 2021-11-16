//
//  SigninViewController.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-12.
//

import UIKit
import Firebase
import Loaf

class SigninViewController: UIViewController
{

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    @IBAction func onSignInPressed(_ sender: UIButton) {
        
        if !inputValidator.emailValidity(email: txtEmail.text ?? "")
        {
            Loaf("Invalid Email Address", state: .error, sender: self).show()
            return
        }
        
        if !inputValidator.passwordValidity(password: txtPassword.text ?? "", minLenght: 8, maxLenght: 60)
        {
            Loaf("Invalid Password", state: .error, sender: self).show()
            return
        }
        
        userAuthentication(password: txtPassword.text!, email: txtEmail.text!)
        
    
    }
    //Validate input using optional bibding
    
    
    func userAuthentication (password: String, email: String)
    {
        Auth.auth().signIn(withEmail: email, password: password)
        {
            authResult, error in
            if let error = error
            {
                print(error.localizedDescription)
                Loaf("Invalid Username and Password", state: .error, sender: self).show()

                return
            }
            //To save the login Staet
            let sessionControl = sessionControl()
            sessionControl.userLoginSave()
            
            self.performSegue(withIdentifier: "SignIntoHome", sender: nil)
            
        }
    }
}
