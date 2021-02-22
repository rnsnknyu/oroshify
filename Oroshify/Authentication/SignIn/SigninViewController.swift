//
//  SigninViewController.swift
//  Oroshify
//
//  Created by Tomonari Ishida on 2021/02/20.
//

import UIKit
import Amplify
import AmplifyPlugins

class SigninViewController: UIViewController {

    
  
    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInBtnIcon: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTF()
        configureNavBar()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func configureNavBar() {
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController!.navigationBar.barTintColor = #colorLiteral(red: 0.1019607843, green: 0.1019607843, blue: 0.1019607843, alpha: 1)
        self.navigationController!.navigationBar.tintColor = .white
        self.navigationController!.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func configureTF() {
        userIdTextField.textColor = #colorLiteral(red: 0.9803921569, green: 1, blue: 1, alpha: 1)
        passwordTextField.textColor = #colorLiteral(red: 0.9803921569, green: 1, blue: 1, alpha: 1)
        userIdTextField.attributedPlaceholder = NSAttributedString(string: "userId (don't include spaces)", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1)])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password (at least 8 characters)", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1)])
    }
    
    func signIn(username: String, password: String) {
        Amplify.Auth.signIn(username: username, password: password) { result in
            switch result {
            case .success:
                print("Sign in succeeded")
            case .failure(let error):
                print("Sign in failed \(error)")
            }
        }
    }
    
    @IBAction func signInBtnTapped(_ sender: Any) {
    }

    @IBAction func forgotBtnTapped(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
}
