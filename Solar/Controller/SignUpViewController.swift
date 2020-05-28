//
//  SignUpViewController.swift
//  Solar
//
//  Created by Enkefa on 18.05.2020.
//  Copyright © 2020 Enkefa. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: RoundTextField!
    @IBOutlet weak var passwordTextField: RoundTextField!
    @IBOutlet weak var createAccountButtonOutlet: RoundButton!
    
    @IBAction func createAccountButton(_ sender: Any) {
        //performSeque if text good n stuff send request
    }
    
    @IBAction func logInButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDoneOnKeyboard()
        
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_ :)), for: UIControl.Event.editingChanged)
        textFieldDidChange(emailTextField)
        
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_ :)), for: UIControl.Event.editingChanged)
        textFieldDidChange(passwordTextField)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self

        
    }

    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -150 // Move view 150 points upward
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0 // Move view to original position
    }
    
// this is broken
    @objc func textFieldDidChange(_ textField: UITextField) {
//
//            if emailTextField.text != nil {
//                createAccountButtonOutlet.isEnabled = true
//                createAccountButtonOutlet.alpha = 1
//            } else {
//                createAccountButtonOutlet.isEnabled = false
//                createAccountButtonOutlet.alpha = 0
//            }

        }
        
        func setDoneOnKeyboard() {
            let keyboardToolbar = UIToolbar()
            keyboardToolbar.sizeToFit()
            let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
            keyboardToolbar.items = [flexBarButton, doneBarButton]
            self.emailTextField.inputAccessoryView = keyboardToolbar
            self.passwordTextField.inputAccessoryView = keyboardToolbar

        }
        
        
        @objc func dismissKeyboard(){
            self.emailTextField.resignFirstResponder()
            self.passwordTextField.resignFirstResponder()

        }
    }


