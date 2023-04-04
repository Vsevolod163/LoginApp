//
//  ViewController.swift
//  LoginApp
//
//  Created by Vsevolod Lashin on 01.04.2023.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet private var logInButton: UIButton!
    @IBOutlet private var userNameTF: UITextField!
    @IBOutlet private var passwordTF: UITextField!
    
    private let userName = "User"
    private let password = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInButton.layer.cornerRadius = 5
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = sender as? String
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction private func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func logInButtonTapped() {
        checkLogIn()
    }
    
    @IBAction private func forgotNameButtonTapped() {
        showAlert(withTitle: "No problem!", andMessage: "Your Username is \(userName) 😊")
    }

    @IBAction private func forgotPasswordButtonTapped() {
        showAlert(withTitle: "No problem!", andMessage: "Your Password is \(password) 😊")
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func checkLogIn() {
        if userNameTF.text != userName || passwordTF.text != password {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password"
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: "Seva")
     }
}

