//
//  ViewController.swift
//  FirebaseTests
//
//  Created by Carlos Eduardo on 11/05/19.
//  Copyright © 2019 Carlos Eduardo. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var gmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func createUser(gmail: String, password: String) {
        Auth.auth().createUser(withEmail: gmail, password: password) { authDataResult, error in
            if error != nil {
                self.showDefaultAlert(title: "Erro", message: "Algo deu errado:", withErrorMessage: error?.localizedDescription)
                return
            }

            self.showDefaultAlert(title: "Sucesso", message: "Usuário registrado sob UID: \(authDataResult!.user.uid)", withErrorMessage: nil)
        }
    }

    @IBAction func signUp(_ sender: UIButton) {
        createUser(gmail: gmailTextField.text!, password: passwordTextField.text!)
    }

    func showDefaultAlert(title: String, message: String, withErrorMessage errorMessage: String?) {
        var fullMessage = message
        if errorMessage != nil {
            fullMessage += "\n\(errorMessage!)"
        }

        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let alert = UIAlertController(title: title, message: fullMessage, preferredStyle: .alert)
        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }

}
