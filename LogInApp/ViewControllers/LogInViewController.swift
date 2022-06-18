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
    let user = User.getUser()
    
    // MARK: - Navigations
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                guard let userInfoVC = navigationVC.topViewController as? UserInfoViewController else { return }
                userInfoVC.user = user
            }
        }
    }
    
    // MARK: - IB Actions
    @IBAction func logInButtonPressed() {
        guard userTextField.text == user.user, passwordTextField.text == user.password
        else {
            showAlert(
                title: "Invalid username or password",
                message: "Please enter correct login and password"
            )
            return
        }
        performSegue(withIdentifier: "tabBarVC", sender: nil)
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
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Keyboard
extension LogInViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
    }
}
