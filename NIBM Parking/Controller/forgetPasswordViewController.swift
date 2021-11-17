//
//  forgetPasswordViewController.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-17.
//

import UIKit
import FirebaseAuth
import Loaf



class forgetPasswordViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func OnSendPressed(_ sender: UIButton) {
        Auth.auth().sendPasswordReset(withEmail: txtEmail.text!) { error in
            if error == nil
            {
             Loaf("Reset Password link is sent", state: .success, sender: self).show()
             {
                 type in
                 self.dismiss(animated: true, completion: nil)
             }
            }
            else{
             print("Failed..\(String(describing: error?.localizedDescription))")
             Loaf("Failed to sent the Reset Password Link", state: .error, sender: self).show()
            }
        }
       
    }
    
}
