//
//  UserInfoViewController.swift
//  LogInApp
//
//  Created by Nikolai Maksimov on 17.06.2022.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = user.person.fullName
        
    }
    
}
