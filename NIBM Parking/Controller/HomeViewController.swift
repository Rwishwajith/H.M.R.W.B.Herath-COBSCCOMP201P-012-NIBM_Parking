//
//  HomeViewController.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-17.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func OnProfilePressed(_ sender: UIButton) {
    self.performSegue(withIdentifier: "HometoProfile", sender: nil)
    }
    
   
}
