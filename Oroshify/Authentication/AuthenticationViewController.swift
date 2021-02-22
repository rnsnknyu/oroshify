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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        configureNavBar()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func configureNavBar() {
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController!.navigationBar.barTintColor = .clear
        self.navigationController!.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
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
