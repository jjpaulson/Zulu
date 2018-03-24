//
//  SignInViewController.swift
//  Zulu
//
//  Created by Jonathan Paulson on 3/22/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        print("Sign in button tapped")
        //DO some sort of validation on email and password
        
        //Sign in user with Firebase
        /*
        if let email = emailAddressTextField.text, let password = userPasswordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if let u = user {
                    //User found, Go to home page
                    self.performSegue(withIdentifier: "goToHome", sender: self)
                }
                else {
                    //Error: check error and show message
                }
            })
        }
        */
        self.performSegue(withIdentifier: "goToHome", sender: self)
        
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        print("Register button tapped")
        
        //Switch over to registration page
        let registerViewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        
        self.present(registerViewController, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailAddressTextField.resignFirstResponder()
        userPasswordTextField.resignFirstResponder()
    }
    
    
    
    
}
