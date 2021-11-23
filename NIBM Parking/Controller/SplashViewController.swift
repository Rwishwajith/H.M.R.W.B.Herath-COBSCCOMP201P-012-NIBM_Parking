//
//  SplashViewController.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-17.
//

import UIKit
import SwiftUI

class SplashViewController: UIViewController {
    
    let sessionCntrl = sessionControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if sessionCntrl.userLogingStateGet()
        {
                let vc = UIHostingController(rootView: TabViewSwiftUIView())
                present(vc, animated: true)
        }
        else
        {
            self.performSegue(withIdentifier: "splashtoLogIn", sender: nil)
            //let vc = UIHostingController(rootView: LoginSwiftUIView())
            //present(vc, animated: true)
        }
    }
 
   

}
