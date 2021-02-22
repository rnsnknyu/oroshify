//
//  AuthenticationViewController.swift
//  Oroshify
//
//  Created by Tomonari Ishida on 2021/02/20.
//

import UIKit

class AuthenticationViewController: UIViewController {

    
    @IBOutlet weak var signupBtnIcon: UIButton!
    @IBOutlet weak var signinBtnIcon: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBtn()
        configureNavBar()
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
    }
    
    func configureBtn() {
        signinBtnIcon.layer.borderColor = #colorLiteral(red: 0, green: 1, blue: 0.8612380624, alpha: 1)
        signinBtnIcon.layer.borderWidth = 0.5
    }
    
    
    @IBAction func signupBtnTapped(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func signinBtnTapped(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SigninViewController") as! SigninViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
