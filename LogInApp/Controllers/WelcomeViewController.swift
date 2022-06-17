//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by Nikolai Maksimov on 15.06.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var userLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userLabel.text = "Welcome, \(user.person.fullName)!"
        
    }
    
    @IBAction func logOutButtonPressed() {
        dismiss(animated: true)
    }
    
}
