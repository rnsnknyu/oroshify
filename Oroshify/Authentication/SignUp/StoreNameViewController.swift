//
//  StoreNameViewController.swift
//  Oroshify
//
//  Created by Tomonari Ishida on 2021/02/22.
//

import UIKit
import Amplify
import AmplifyPlugins



class StoreNameViewController: UIViewController {
    
    @IBOutlet weak var storeNameTextField: UITextField!
    @IBOutlet weak var storeAddressTextField: UITextField!
    @IBOutlet weak var nextBtnIcon: UIButton!
    
    var DamyUserID: String!
    var DamyStoreType: String!
    var DamyAnnualSales: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureTF()
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
        storeNameTextField.textColor = #colorLiteral(red: 0.9803921569, green: 1, blue: 1, alpha: 1)
        storeAddressTextField.textColor = #colorLiteral(red: 0.9803921569, green: 1, blue: 1, alpha: 1)
        storeNameTextField.attributedPlaceholder = NSAttributedString(string: "your store Name", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1)])
        storeAddressTextField.attributedPlaceholder = NSAttributedString(string: "your store address", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1)])
    }
    
    @IBAction func nextBtnTapped(_ sender: Any) {
        
    }
    

}
