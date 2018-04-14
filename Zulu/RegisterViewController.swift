//
//  RegisterViewController.swift
//  Zulu
//
//  Created by Jonathan Paulson on 3/22/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class RegisterViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var storeUserSwitch: UISwitch!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    var refUsers : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cancelButton.layer.cornerRadius = 10
        cancelButton.clipsToBounds = true
        
        signUpButton.layer.cornerRadius = 10
        signUpButton.clipsToBounds = true
        
        // Do any additional setup after loading the view.
        refUsers = Database.database().reference().child("users")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        print("Cancel button pressed")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
         print("Sign up button tapped")
        
        //Register user with Firebase
        /*
         if (firstNameTextField.text?.isEmpty)! || (lastNameTextField.text?.isEmpty)! || (emailAddressTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! || (repeatPasswordTextField.text?.isEmpty)!
         {
         print("Fill in all text fields")
         displayMessage(userMessage: "Fill in all text fields")
         return
         }
         
         if((passwordTextField.text?.elementsEqual(repeatPasswordTextField.text!))! != true)
         {
         print("Make sure both passwords are the same")
         displayMessage(userMessage: "The passwords do not match")
         return
         }
        
        Auth.auth().createUser(withEmail: emailAddressTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if let u = user {
                let email = self.emailAddressTextField.text!
                self.refUsers.child("users").setValue(email)
                
                let user = ["email":email, "firstName":self.firstNameTextField.text! as String, "lastName":self.lastNameTextField.text! as String, "storeAccount":self.storeUserSwitch.isOn] as [String : Any]
                
                self.refUsers.child("users").child(email).setValue(user)
                
                //Go to home screen
                self.performSegue(withIdentifier: "backToSignIn", sender: self)
            }
            else {
                //Error: Check error and show message
            }
        
        }
        */
        
        self.performSegue(withIdentifier: "backToSignIn", sender: self)
        
        /*
         //Create Activity Indicator
         let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
         
         //Position activity indicator in the center of the main view
         myActivityIndicator.center = view.center
         
         //If needed you can prevent activity indicator from hiding when stopAnimating() is called
         myActivityIndicator.hidesWhenStopped = false
         
         //Start Activity Indicator
         myActivityIndicator.startAnimating()
         
         view.addSubview(myActivityIndicator)
         */
    }
    
    /*
    func displayMessage(userMessage:String) -> Void {
        DispatchQueue.main.async
            {
                let alertController = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                    // Code in this block will trigger when OK button tapped.
                    print("Ok button tapped")
                    DispatchQueue.main.async
                        {
                            self.dismiss(animated: true, completion: nil)
                    }
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion:nil)
        }
    }
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        emailAddressTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repeatPasswordTextField.resignFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
