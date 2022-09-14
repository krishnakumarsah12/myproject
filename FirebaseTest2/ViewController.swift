//
//  ViewController.swift
//  FirebaseTest2
//
//  Created by krishna kumar sah on 13/09/22.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var signUpEmail: UITextField!
    
    @IBOutlet weak var signUpPassword: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Border()
    }
    @IBAction func loginScreen(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
                let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
    
    @IBAction func signinButton(_ sender: UIButton) {
    }
    
    
    
    @IBAction func signUpButton(_ sender: Any) {
        if signUpEmail.text?.isEmpty == true {
            print("no text in email field")
            return
        }
        if signUpPassword.text?.isEmpty == true{
            print("no text in password field")
            return
        }
        signUp()
    }
    func signUp() {
        Auth.auth().createUser(withEmail: signUpEmail.text!, password: signUpPassword.text!) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("error \(error?.localizedDescription)")
                return
            }
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
                    let navigationController = UINavigationController(rootViewController: vc)
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true)
            
        }
    }
    func Border()
    {
        signUpEmail.layer.cornerRadius = 15.0
        signUpEmail.layer.borderWidth = 2.0
        signUpEmail.layer.borderColor = UIColor.red.cgColor
        signUpPassword.layer.cornerRadius = 15.0
        signUpPassword.layer.borderWidth = 2.0
        signUpPassword.layer.borderColor = UIColor.red.cgColor
    }

    
}


