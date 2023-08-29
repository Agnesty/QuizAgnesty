//
//  ProfileViewController.swift
//  QuizAgnesty
//
//  Created by Agnes Triselia Yudia on 10/08/23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var labelname: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelname.text = UserDefaults.standard.string(forKey: "nameUser")
        labelEmail.text = UserDefaults.standard.string(forKey: "emailUser")
        
    }
    
    @IBAction func logoutAction(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: "Anda yakin akan keluar?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Batal", style: .cancel, handler: nil)
        let logoutAction = UIAlertAction(title: "OK", style: .destructive) { _ in
            
            guard UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") is LoginViewController else { return }
            self.navigationController?.popToRootViewController(animated: true)
            
            UserDefaults.standard.removeObject(forKey: "nameUser")
            UserDefaults.standard.removeObject(forKey: "emailUser")
            UserDefaults.standard.removeObject(forKey: "passwordUser")
        }
        
        
        alert.addAction(cancelAction)
        alert.addAction(logoutAction)
        present(alert, animated: true, completion: nil)
        
        
    }
    
 

}
