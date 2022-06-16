//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by Nikolai Maksimov on 15.06.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var userLabel: UILabel!
    
    var user: String!   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userLabel.text = "Welcome, \(user ?? "")!"
        
    }
    
    @IBAction func logOutButtonPressed() {
        dismiss(animated: true)
    }
    
}
