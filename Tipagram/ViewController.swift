//
//  ViewController.swift
//  Tipagram
//
//  Created by Olivia Corrodi on 8/30/18.
//  Copyright © 2018 Olivia Corrodi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseAuthUI


typealias FIRUser = FirebaseAuth.User

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    var type = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func waiterButtonPressed(_ sender: Any) {
        self.type = "waiter"
        login(type: type)
    }
    
    func login(type: String) {
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        authUI.delegate = self
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
    
    @IBAction func restaurantButtonPressed(_ sender: Any) {
        self.type = "restaurant"
        login(type: type)
    }
    
    @IBAction func customerButtonPressed(_ sender: Any) {
        self.type = "customer"
        login(type: type)
    }
    
    
    


}

extension ViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        
        if let error = error {
            print("Error signing in: \(error.localizedDescription)")
            return
        }
        
        guard let user = user else { return }
        
        let userRef = Database.database().reference().child("users").child(user.uid)
        
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let existingUser = User(snapshot: snapshot) {
                //existing user
                print("\(#function): user exists already.")
                
            } else {
                //new user
                userRef.updateChildValues(["uid" : user.uid, "email" : user.email, "type" : self.type])
            }
        })
        defaults.set(type, forKey: "type")
        defaults.set(true, forKey: "loggedIn")
        performSegue(withIdentifier: "toMain", sender: nil)
    }
}


