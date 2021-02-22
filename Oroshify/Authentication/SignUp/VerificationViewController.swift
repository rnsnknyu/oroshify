//
//  VerificationViewController.swift
//  Oroshify
//
//  Created by Tomonari Ishida on 2021/02/20.
//

import UIKit
import Amplify
import AmplifyPlugins

class VerificationViewController: UIViewController {

    
    @IBOutlet weak var confirminationCodeTextField: UITextField!
    @IBOutlet weak var confirmBtnIcon: UIButton!
    var DamyUserName: String!
    var DamyUserId: String!
    
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
        if segue.identifier == "ToStoretype" {
            let nextVC = segue.destination as! StroretypeViewController
            nextVC.userIdDamy = self.DamyUserId
        }
    }
    func configureTF() {
        confirminationCodeTextField.attributedPlaceholder = NSAttributedString(string: "Confirmination Code", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1)])
        confirminationCodeTextField.textColor = #colorLiteral(red: 0.9803921569, green: 1, blue: 1, alpha: 1)
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
    
    func confirmSignUp(for username: String, with confirmationCode: String) {
        Amplify.Auth.confirmSignUp(for: username, confirmationCode: confirmationCode) { result in
            switch result {
            case .success:
                print("Confirm signUp succeeded")
            case .failure(let error):
                print("An error occurred while confirming sign up \(error)")
            }
        }
    }
    
    
    
    @IBAction func confirmBtnTapped(_ sender: Any) {
        confirmSignUp(for: self.DamyUserId, with: self.confirminationCodeTextField.text!)
    }
    

}
