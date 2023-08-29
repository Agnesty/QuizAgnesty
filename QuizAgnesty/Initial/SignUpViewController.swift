//
//  ViewController.swift
//  QuizAgnesty
//
//  Created by Agnes Triselia Yudia on 10/08/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPassTF: UITextField!
    @IBOutlet weak var signupBtn: UIButton!{
        didSet{
            signupBtn.layer.cornerRadius = CGFloat(10)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // Do any additional setup after loading the view.
    }

    @IBAction func signupAction(_ sender: UIButton) {
        signUpClicked()
        guard let performLogin = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
        self.navigationController?.pushViewController(performLogin, animated: true)
    }
    
    @IBAction func goToLogin(_ sender: UIButton) {
        guard let performLogin = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
        self.navigationController?.pushViewController(performLogin, animated: true)
    }
    
    
    func signUpClicked() {
        let emailData = emailTF.text
        let nameData = nameTF.text
        let passwordData = passwordTF.text
        UserDefaults.standard.set(emailData, forKey: "emailUser")
        UserDefaults.standard.set(passwordData, forKey: "passwordUser")
        UserDefaults.standard.set(nameData, forKey: "nameUser")

        // Get and print the saved data from UserDefaults
        if let email = UserDefaults.standard.object( forKey: "emailUser") as? String {
            print("ini email: \(email)")
        }
        if let password = UserDefaults.standard.object( forKey: "passwordUser") as? String {
            print("ini password: \(password)")
        }
        
    }
}

