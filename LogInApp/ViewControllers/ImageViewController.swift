//
//  ImageViewController.swift
//  LogInApp
//
//  Created by Nikolai Maksimov on 18.06.2022.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: user.person.image)
        
    }
}
