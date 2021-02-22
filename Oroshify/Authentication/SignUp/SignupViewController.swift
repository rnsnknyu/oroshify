//
//  SignupViewController.swift
//  Oroshify
//
//  Created by Tomonari Ishida on 2021/02/20.
//

import UIKit
import Amplify
import AmplifyPlugins

class SignupViewController: UIViewController {
    
    
    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupBtnIcon: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureTF()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK:- translate userId
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToVerification" {
            let nextVC = segue.destination as! VerificationViewController
            nextVC.DamyUserId = self.userIdTextField.text!
        }
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
        mailTextField.textColor = #colorLiteral(red: 0.9803921569, green: 1, blue: 1, alpha: 1)
        passwordTextField.textColor = #colorLiteral(red: 0.9803921569, green: 1, blue: 1, alpha: 1)
        userIdTextField.attributedPlaceholder = NSAttributedString(string: "userId (空白を含まない)", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1)])
        mailTextField.attributedPlaceholder = NSAttributedString(string: "example@mellow.app", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1)])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "パスワード (8文字以上)", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1)])
    }
    
    func signUp(username: String, password: String, email: String) {
        let userAttributes = [AuthUserAttribute(.email, value: email)]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        Amplify.Auth.signUp(username: username, password: password, options: options) { result in
            switch result {
            case .success(let signUpResult):
                if case let .confirmUser(deliveryDetails, _) = signUpResult.nextStep {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "ToVerification", sender: nil)
                    }
                    print("Delivery details \(String(describing: deliveryDetails))")
                } else {
                    print("SignUp Complete")
                }
            case .failure(let error):
                print("An error occurred while registering a user \(error)")
            }
        }
    }
    
    
    @IBAction func signupBtnTapped(_ sender: Any) {
        self.signUp(username: self.userIdTextField.text!, password: self.passwordTextField.text!, email: self.mailTextField.text!)
        
    }
    
}
