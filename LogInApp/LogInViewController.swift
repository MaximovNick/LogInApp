//
//  ViewController.swift
//  LogInApp
//
//  Created by Nikolai Maksimov on 15.06.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private properties
    private var userName = "User"
    private var password = "Password"
    
    // MARK: - Navigations
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.user = userName
    }
    
    // MARK: - IB Actions
    @IBAction func logInButtonPressed() {
        guard userTextField.text == userName, passwordTextField.text == password
        else {
            showAlert(
                title: "Invalid username or password",
                message: "Please enter correct login and password"
            )
            return
        }
        performSegue(withIdentifier: "welcomeVC", sender: nil)
    }
    
    @IBAction func rememberUsernameOrPassword(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Hello!", message: "Your name is User")
        : showAlert(title: "Hello!", message: "Your password is Password")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let _ = segue.source as? WelcomeViewController else { return }
        userTextField.text = ""
        passwordTextField.text = ""
    }
}

// MARK: - Alert Controller
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


