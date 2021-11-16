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
        if inputeValidation(){
            userAuthentication(password: txtPassword.text!, email: txtEmail.text!)
        }
        else{
            print("Invalid data found in the given details")
            
        }
    }
    //Validate input using optional bibding
    func inputeValidation() -> Bool
    {
        guard let useremail = txtEmail.text else {
            print("Email cannot be Empty")
            Loaf("Email cannot be Empty", state: .error, sender: self).show()
            return false
        }
        
        guard let userpassword = txtPassword.text else {
            print("Password Cannot Be Empty")
            Loaf("Password Cannot Be Empty", state: .error, sender: self).show()
            return false
        }
        
        if useremail.count < 10
        {
            print("Please Enter a valid email")
            Loaf("Please Enter a valid email", state: .error, sender: self).show()
            return false
        }
        if userpassword.count < 8
        {
            print("Password lenght cannot be less than 8 characters")
            Loaf("Password lenght cannot be less than 8 characters", state: .error, sender: self).show()
            return false
        }
        return true
    }
    
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
