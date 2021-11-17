//
//  SplashViewController.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-17.
//

import UIKit

class SplashViewController: UIViewController {
    
    let sessionCntrl = sessionControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if sessionCntrl.userLogingStateGet()
        {
            self.performSegue(withIdentifier: "splashToHome", sender: nil)
        }
        else
        {
            self.performSegue(withIdentifier: "splashtoLogIn", sender: nil)
        }
    }
   

}
