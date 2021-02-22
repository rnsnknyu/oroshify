//
//  ResetPasswordViewController.swift
//  Oroshify
//
//  Created by Tomonari Ishida on 2021/02/22.
//

import UIKit
import Amplify
import AmplifyPlugins


class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var confirminationCodeTextField: UITextField!
    @IBOutlet weak var newPasswordtextField: UITextField!
    @IBOutlet weak var sendEmailBtnIcon: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureTF()
        configureBtn()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func configureTF() {
        userIdTextField.textColor = #colorLiteral(red: 0.9803921569, green: 1, blue: 1, alpha: 1)
        confirminationCodeTextField.textColor = #colorLiteral(red: 0.9803921569, green: 1, blue: 1, alpha: 1)
        newPasswordtextField.textColor = #colorLiteral(red: 0.9803921569, green: 1, blue: 1, alpha: 1)
        userIdTextField.attributedPlaceholder = NSAttributedString(string: "userId (don't include spaces)", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1)])
        confirminationCodeTextField.attributedPlaceholder = NSAttributedString(string: "confirmination code", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1)])
        newPasswordtextField.attributedPlaceholder = NSAttributedString(string: "Password (at least 8 characters)", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1)])
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
    
    func configureBtn() {
        sendEmailBtnIcon.layer.borderColor = #colorLiteral(red: 0, green: 1, blue: 0.8612380624, alpha: 1)
        sendEmailBtnIcon.layer.borderWidth = 0.5
    }
    
    
    func resetPassword(username: String) {
        Amplify.Auth.resetPassword(for: username) { result in
            do {
                let resetResult = try result.get()
                switch resetResult.nextStep {
                case .confirmResetPasswordWithCode(let deliveryDetails, let info):
                    print("Confirm reset password with code send to - \(deliveryDetails) \(info)")
                case .done:
                    print("Reset completed")
                }
            } catch {
                print("Reset password failed with error \(error)")
            }
        }
    }
    
    func confirmResetPassword(
        username: String,
        newPassword: String,
        confirmationCode: String
    ) {
        Amplify.Auth.confirmResetPassword(
            for: username,
            with: newPassword,
            confirmationCode: confirmationCode
        ) { result in
            switch result {
            case .success:
                print("Password reset confirmed")
            case .failure(let error):
                print("Reset password failed with error \(error)")
            }
        }
    }
    
    
    //Actions
    
    @IBAction func sendEmailBtnTapped(_ sender: Any) {
        resetPassword(username: self.userIdTextField.text!)
    }
    
    @IBAction func resetPasswordBtnTapped(_ sender: Any) {
        confirmResetPassword(username: self.userIdTextField.text!, newPassword: self.newPasswordtextField.text!, confirmationCode: self.confirminationCodeTextField.text!)
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
