//
//  HomeViewController.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-17.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton (frame: CGRect(x: 0, y: 0, width:220, height:50))
        view.addSubview(button)
        button.center = view.center
        button.setTitle("Settings", for: .normal)
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func OnProfilePressed(_ sender: UIButton) {
    self.performSegue(withIdentifier: "HometoProfile", sender: nil)
    }
    //Connecting Swift UI
    @objc func didTapButton()
    {
        let vc = UIHostingController(rootView: SettingsSwiftUIView())
        present(vc, animated: true)
        
    }
   
}
