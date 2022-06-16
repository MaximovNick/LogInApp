//
//  ViewController.swift
//  LogInApp
//
//  Created by Nikolai Maksimov on 15.06.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // Login details
    var userName = "User"
    var password = "Password"
    
    // Transferring data to another screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.user = userName
    }
    
    @IBAction func logInButtonPressed() {
        guard userTextField.text == userName, passwordTextField.text == password
        else {
            showAlert(
                title: "Ops",
                message: "Invalid username or password"
            )
            return
        }
        performSegue(withIdentifier: "welcomeVC", sender: nil)
    }
    
    // Name and password reminder
    @IBAction func rememberUsernameOrPassword(_ sender: UIButton) {
        sender.tag == 0 ? showAlert(title: "Hello!", message: "Your name is User") :
        showAlert(title: "Hello!", message: "Your password is Password")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let _ = segue.source as? WelcomeViewController else { return }
        userTextField.text = ""
        passwordTextField.text = ""
    }
}


// MARK: Extension - Alert Controller
extension LogInViewController {
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
