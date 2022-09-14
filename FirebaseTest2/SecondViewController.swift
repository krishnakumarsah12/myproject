//
//  SecondViewController.swift
//  FirebaseTest2
//
//  Created by krishna kumar sah on 13/09/22.
//

import UIKit
import Firebase
import FirebaseAuth

class SecondViewController: UIViewController {
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Border()
        // Do any additional setup after loading the view.
    }
    @IBAction func signButton(_ sender: Any) {
        if let email = loginEmail.text , let password = loginPassword.text
                {
                    Auth.auth().signIn(withEmail: email, password:password) { (authresultdata, error) in
                        if let err = error
                        {
                            self.showAlert(message: err.localizedDescription)
                        }
                        else
                        {
                            self.loginEmail.text = ""
                            self.loginPassword.text = ""
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForthViewController") as! ForthViewController
                                    let navigationController = UINavigationController(rootViewController: vc)
                            navigationController.modalPresentationStyle = .fullScreen
                            self.present(navigationController, animated: true)
                        }
                    }
            }
    }
    func showAlert(message: String)
        {
            let ac = UIAlertController(title: "Info", message: message, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            present(ac, animated: true, completion: nil)
        }
    
    
    @IBAction func dontHaveAccount(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true)
    }
    func Border()
    {
        loginEmail.layer.cornerRadius = 15.0
        loginEmail.layer.borderWidth = 2.0
        loginEmail.layer.borderColor = UIColor.red.cgColor
        loginPassword.layer.cornerRadius = 15.0
        loginPassword.layer.borderWidth = 2.0
        loginPassword.layer.borderColor = UIColor.red.cgColor
    }
}

