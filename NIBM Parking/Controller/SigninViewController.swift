//
//  SigninViewController.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-12.
//

import UIKit
import Firebase

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
            return false
        }
        
        guard let userpassword = txtPassword.text else {
            print("Password Cannot Be Empty")
            return false
        }
        
        if useremail.count < 10
        {
            print("Please Enter a valid email")
            return false
        }
        if userpassword.count < 8
        {
            print("Password lenght cannot be less than 8 characters")
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
                return
            }
            //To save the login Staet
            let sessionControl = sessionControl()
            sessionControl.userLoginSave()
            
        }
    }
}
