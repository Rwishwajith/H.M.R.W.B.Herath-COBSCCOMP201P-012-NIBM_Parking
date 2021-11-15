//
//  SigninViewController.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-12.
//

import UIKit

class SigninViewController: UIViewController
{

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    

    @IBAction func onSignInPressed(_ sender: UIButton) {
        
        if txtEmail.text?.count < 5
        {
            print ("Please Enter a Valid Password!!")
        }
        
        
        
    }
    
  
}
