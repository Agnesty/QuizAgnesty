//
//  LoginViewController.swift
//  QuizAgnesty
//
//  Created by Agnes Triselia Yudia on 10/08/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!{
        didSet{
            loginBtn.layer.cornerRadius = CGFloat(10)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.bool(forKey: "UdahLogin") {
            guard let performHome = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController else { return }
            self.navigationController?.pushViewController(performHome, animated: true)
        }
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        if !emailTF.hasText || !passwordTF.hasText{
            let alert = UIAlertController(title: nil, message: "Silakan masukan email dan password", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
           
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        } else
        if emailTF.text == UserDefaults.standard.object(forKey: "emailUser") as? String, passwordTF.text == UserDefaults.standard.object(forKey: "passwordUser") as? String {
            UserDefaults.standard.set(true, forKey: "UdahLogin")
            guard let performHome = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController else { return }
            self.navigationController?.pushViewController(performHome, animated: true)
        } else {
            let alert = UIAlertController(title: nil, message: "Maaf user belum terdaftar", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
           
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func goToSignUp(_ sender: UIButton) {
        guard let performSignUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else { return }
        self.navigationController?.pushViewController(performSignUp, animated: true)
    }

}
