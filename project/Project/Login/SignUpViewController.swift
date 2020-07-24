//
//  SignUpViewController.swift
//  Project
//
//  Created by 茂木匠 on 2020/7/23.
//  Copyright © 2020 茂木匠. All rights reserved.
//

import UIKit
import FirebaseAuth
import  Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
        

        
        
        
    }
    func setUpElements() {
        errorLabel.alpha = 0
        
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    

    func validateFields() -> String? {
        
        //check the all fields are filled in
        if firstNameTextField.text?
            .trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all fields."
        }
        //check if pass is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false {
            //pass isn't secure
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        return nil
        
    }

    @IBAction func signUptapped(_ sender: Any) {
        //validate fields
        let error = validateFields()
        
        if error != nil{
            //there is something wrong with fields
           showError(error!)
        }
        else{
            
            //create cleaned ver of data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                //check for error
                if  err != nil {
                    self.showError("Error creating User")
                }
                else{
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["fiestname":firstName,"lastname":lastName,"uid":result!.user.uid]){(error) in
                        if error != nil{
                            self.showError("Error saving User data")
                        }

                    }
                    //transition to home
                    self.transitionToHome()
                    
                }
            }
            
        }
        //create users
        
        
        
    }
    func showError(_ message:String)  {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    func  transitionToHome(){
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
          
          view.window?.rootViewController = homeViewController
          view.window?.makeKeyAndVisible()
        
    }

}
