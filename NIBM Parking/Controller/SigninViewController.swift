//
//  Sc.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-12.
//

import UIKit
import Firebase
import Loaf
import SwiftUI

class SigninViewController: UIViewController
{

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

    
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
        let vc = UIHostingController(rootView: TabViewSwiftUIView())
        present(vc, animated: true)
    
    }
    
    @IBAction func IsForgetPassowrdPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "signInToForgetPassword", sender: nil)
        
    }
    
   //Get user login data up SignUp
    func retriveuserData (email: String)
    {
        ref.child("users").child(email.replacingOccurrences(of: "@", with: "_").replacingOccurrences(of: ".", with: "_")).observe(.value, with: { (snapshot) in
          
            if snapshot.hasChildren()
            {
                if let data = snapshot.value
                {
                    if let userData = data as? [String: String]
                    {
                        let user = PakingUser(Username: userData["userName"]!,
                                              UserEmail: userData["userEmail"]!,
                                              Usermobilenumber: userData["userMobile"]!,
                                              UserPassword: userData["userPassword"]!,
                                              NIBMRegNumber: userData["nibmID"]!,
                                              VehicalNumber: userData["userVehical"]! )
                        let sessionControl = sessionControl()
                        sessionControl.userLoginSave(user: user)
                        self.performSegue(withIdentifier: "SignIntoHome", sender: nil)
                    }
                }
            }
            else
            {
                Loaf("User not found!", state: .error, sender: self).show()
            }
            
        })
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
            
            if let email = authResult?.user.email
            {
                self.retriveuserData(email:email)
            }
            else
            {
                Loaf("User Email Cannot be found", state: .error, sender: self).show()
            }
        
            //To save the login Staet
            //let sessionControl = sessionControl()
           // sessionControl.userLoginSave()
            
            
            
        }
    }
    
    
}
