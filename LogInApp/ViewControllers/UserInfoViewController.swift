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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else { return }
        imageVC.user = user
    }
    
}
