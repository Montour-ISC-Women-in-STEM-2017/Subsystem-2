//
//  LoginViewController.swift
//  Subsystem2
//
//  Created by Kaitlyn Landmesser on 2/1/17.
//  Copyright © 2017 Montour High School + Industrial Scientific. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // Declare our variables
    @IBOutlet weak var usernameField: UITextField! // Linked to the Username text field in our Storyboard
    @IBOutlet weak var passwordField: UITextField! // Linked to the Password text field in our Storyboard
    @IBOutlet weak var loginButton: UIButton! // Linked to the Log In button in our Storyboard
    
    let tabBarSegueID = "loginToTabBar" // Defined in the storyboard - the line that connects the Login and Tab bar pages
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /* Logic: When the Login button is pressed, if the text in the username text field is equal to "Montour" and the text in the password field is equal to "Password", then the rest of the app is shown. Else if the username or password is not correct, then display an error to tell our user they have made a mistake.
     */
    
    // 1. When the login button is pressed
    @IBAction func loginPressed(_ sender: Any) {
        
        // 2. If the text in the username text field is equal to "Montour" and the text in the password field is equal to "Password"
        if usernameField.text == "Montour" && passwordField.text == "Password" {
            
            //3. then the rest of our app is shown - preform a 'Segue' which will transition our app from the current page to the page the segue is pointed to (here it's the TabBarController).
            self.performSegue(withIdentifier: tabBarSegueID, sender: self)
        
        }
        // 4. If the password or username is not correct.
        else {
            
            //5. Call the function we created to display an alert.
            showIncorrectCredentialsAlert()
        }
    }
    
    /* 
     Display a pop-up alert to the user to tell them the username or password they have entered is incorrect.
     */
    func showIncorrectCredentialsAlert() {
        //6. Create the pop-up alert -'UIAlertController' is a Class in the Swift language that we can user to display an alert.
        let alert = UIAlertController(title: "Incorrect username or password!", message: "The username or password you entered is incorrect. Please try again.", preferredStyle: .alert)
        
        //7. Add an 'OK' button to the bottom of the alert so the user can dismiss it and try to enter their password again.
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        
        //8. Tell the phone to display the alert we just created.
        present(alert, animated: true, completion: nil)
    }
}
