//
//  ViewController.swift
//  LoginApp
//
//  Created by Vsevolod Lashin on 01.04.2023.
//

import UIKit

final class MainViewController: UIViewController {

    @IBOutlet private var logInButton: UIButton!
    @IBOutlet private var userNameTF: UITextField!
    @IBOutlet private var passwordTF: UITextField!
    
    private let userName = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 5
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }

        welcomeVC.userName = userNameTF.text
        checkLogInWith(userName: userName, password: password)
    }
    
    
    
    @IBAction func forgotNameButtonTapped() {
        showAlert(withTitle: "Your Username", andMessage: userName)
    }

    @IBAction func forgotPasswordButtonTapped() {
        showAlert(withTitle: "Your Password", andMessage: password)
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTF.text = ""
            self.passwordTF.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func checkLogInWith(userName: String, password: String) {
        if userNameTF.text != userName || passwordTF.text != password {
            showAlert(withTitle: "Error", andMessage: "Wrong Username or Password")
        }
     }
}

