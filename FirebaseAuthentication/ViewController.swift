//
//  ViewController.swift
//  FirebaseAuthentication
//
//  Created by Satyam Saluja on 30/09/17.
//  Copyright © 2017 Satyam Saluja. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var signInSelector: UISegmentedControl!
    @IBOutlet weak var signInLable: UILabel!
    @IBOutlet weak var emailTextFeild: UITextField!
    @IBOutlet weak var passwordTextFeild: UITextField!
    @IBOutlet weak var signInButton: UIButton!
 
    @IBAction func GoogleSignInButton(_ sender: Any) {
        
    }
    var isSignIn=true
    @IBAction func SignInButton(_ sender: Any) {
        
        //.......REGESTER USER.......
        
        if isSignIn==false{
            if let email=emailTextFeild.text , let pass=passwordTextFeild.text{
                Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                    
                    //check user isn't nil
                    if let u=user{
                        let alert=UIAlertController(title: "Welcome \(email)", message: "You have been Registered", preferredStyle: .alert)
                        let okay=UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                        alert.addAction(okay)
                        self.present(alert, animated: true, completion: nil)
                        //get new screen,user created
                    }
                    else if pass.count<6 {
                        let alert=UIAlertController(title: "Invalid Password", message:"Password must contail atleast 6 characters", preferredStyle: .alert)
                        let ok=UIAlertAction(title: "OK", style: .cancel, handler: nil)
                         alert.addAction(ok)
                        self.present(alert, animated: true, completion: nil)
                        print("ERROR MESSAGE--->\(error)")
                    }
                    else {
                        let alert=UIAlertController(title: "ERROR", message: String(describing:error!.localizedDescription), preferredStyle: .alert)
                        let ok=UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alert.addAction(ok)
                        self.present(alert, animated: true, completion: nil)
                    }
                })
            }
        }
            
        //........SIGIN IN A USER...........
            
        else {
            if let email=emailTextFeild.text,let pass=passwordTextFeild.text{
                Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
                //check if user isnt nil
                    if let u=user{
                        let alert=UIAlertController(title: "Welcome \(email)", message: "You are Signed in", preferredStyle: .alert)
                        let okay=UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                        alert.addAction(okay)
                        self.present(alert, animated: true, completion: nil)
                        //go to next screen
                    }
                    else {
                
                        let alert=UIAlertController(title: "ERROR", message: String(describing: error!.localizedDescription.description), preferredStyle: .alert)
                        let ok=UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alert.addAction(ok)
                        self.present(alert, animated: true, completion: nil)
                        
                        print("ERROR MESSAGE--->\(error)")
                    }
                })
        }
    }
    }
    @IBAction func signInSelectorChange(_ sender: Any) {
        isSignIn = !isSignIn
        if isSignIn{
            signInLable.text="Sign In"
            signInButton.setTitle("Sign In", for: .normal)
        }
        else{
            signInLable.text="Register"
            signInButton.setTitle("Register", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

