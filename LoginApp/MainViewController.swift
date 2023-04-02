//
//  ViewController.swift
//  LoginApp
//
//  Created by Vsevolod Lashin on 01.04.2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 5
    }
    
    @IBAction func forgotNameButtonTapped() {
        showAlert(withTitle: "Your Username", andMessage: "User")
    }

    @IBAction func forgotPasswordButtonTapped() {
        showAlert(withTitle: "Your Password", andMessage: "Password")
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let userNameAlert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        userNameAlert.addAction(okAction)
        present(userNameAlert, animated: true)
    }
}

