//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Vsevolod Lashin on 02.04.2023.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, " + userName + "!"
    }
    
    @IBAction func logOutButtonTapped() {
        dismiss(animated: true)
    }
}
