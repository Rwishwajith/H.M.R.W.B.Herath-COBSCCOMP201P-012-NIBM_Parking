//
//  ProfileViewController.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-17.
//

import UIKit
import Loaf

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSignOutPressed(_ sender: UIButton) {
        let sessionContrl = sessionControl()
        sessionContrl.userLoginClear()
        Loaf("Logging Out", state: .warning, sender: self).show()
        {
            type in
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }
}
