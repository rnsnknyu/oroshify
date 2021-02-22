//
//  StroretypeViewController.swift
//  Oroshify
//
//  Created by Tomonari Ishida on 2021/02/21.
//

import UIKit
import Amplify
import AmplifyPlugins

class StroretypeViewController: UIViewController {

    
    @IBOutlet weak var physicalStoreBtnIcon: UIButton!
    @IBOutlet weak var onlineStoreBtnIcon: UIButton!
    @IBOutlet weak var popUpStoreBtnIcon: UIButton!
    @IBOutlet weak var noneBtnIcon: UIButton!
    
    
    var userIdDamy: String!
    var DamyStoreType: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureBtn()
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
        physicalStoreBtnIcon.layer.borderColor = #colorLiteral(red: 0, green: 1, blue: 0.8612380624, alpha: 1)
        physicalStoreBtnIcon.layer.borderWidth = 0.5
        onlineStoreBtnIcon.layer.borderColor = #colorLiteral(red: 0, green: 1, blue: 0.8612380624, alpha: 1)
        onlineStoreBtnIcon.layer.borderWidth = 0.5
        popUpStoreBtnIcon.layer.borderColor = #colorLiteral(red: 0, green: 1, blue: 0.8612380624, alpha: 1)
        popUpStoreBtnIcon.layer.borderWidth = 0.5
        noneBtnIcon.layer.borderColor = #colorLiteral(red: 0, green: 1, blue: 0.8612380624, alpha: 1)
        noneBtnIcon.layer.borderWidth = 0.5
    }
    
   
    @IBAction func physicalStoreBtnTapped(_ sender: Any) {
        DamyStoreType = "physicalStore"
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "AnnualsalesViewController") as! AnnualsalesViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        nextVC.DamyUserId = self.userIdDamy
        nextVC.StoreType = self.DamyStoreType
    }
    
    @IBAction func onlineStoreBtnTapped(_ sender: Any) {
        DamyStoreType = "onlineStore"
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "AnnualsalesViewController") as! AnnualsalesViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        nextVC.DamyUserId = self.userIdDamy
        nextVC.StoreType = self.DamyStoreType
    }
    
    @IBAction func popUpStoreBtnTapped(_ sender: Any) {
        DamyStoreType = "popUpStore"
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "AnnualsalesViewController") as! AnnualsalesViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        nextVC.DamyUserId = self.userIdDamy
        nextVC.StoreType = self.DamyStoreType
    }
    
    @IBAction func noneBtnTapped(_ sender: Any) {
        DamyStoreType = "none"
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "AnnualsalesViewController") as! AnnualsalesViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        nextVC.DamyUserId = self.userIdDamy
        nextVC.StoreType = self.DamyStoreType
    }
    
    
}
