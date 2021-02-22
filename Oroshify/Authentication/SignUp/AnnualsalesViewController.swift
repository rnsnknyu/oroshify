//
//  AnnualsalesViewController.swift
//  Oroshify
//
//  Created by Tomonari Ishida on 2021/02/21.
//

import UIKit
import Amplify
import AmplifyPlugins


class AnnualsalesViewController: UIViewController {

    @IBOutlet weak var firstBtnIcon: UIButton!
    @IBOutlet weak var secoundBtnIcon: UIButton!
    @IBOutlet weak var thridBtnIcon: UIButton!
    @IBOutlet weak var fouthBtnIcon: UIButton!
    @IBOutlet weak var fifthBtnIcon: UIButton!
    
    
    var DamyUserId: String!
    var StoreType: String!
    var DamyAnnualSales: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBtn()
        configureNavBar()
    }
    
    
    
    func configureBtn() {
        firstBtnIcon.layer.borderColor = #colorLiteral(red: 0, green: 1, blue: 0.8612380624, alpha: 1)
        firstBtnIcon.layer.borderWidth = 0.5
        secoundBtnIcon.layer.borderColor = #colorLiteral(red: 0, green: 1, blue: 0.8612380624, alpha: 1)
        secoundBtnIcon.layer.borderWidth = 0.5
        thridBtnIcon.layer.borderColor = #colorLiteral(red: 0, green: 1, blue: 0.8612380624, alpha: 1)
        thridBtnIcon.layer.borderWidth = 0.5
        fouthBtnIcon.layer.borderColor = #colorLiteral(red: 0, green: 1, blue: 0.8612380624, alpha: 1)
        fouthBtnIcon.layer.borderWidth = 0.5
        fifthBtnIcon.layer.borderColor = #colorLiteral(red: 0, green: 1, blue: 0.8612380624, alpha: 1)
        fifthBtnIcon.layer.borderWidth = 0.5
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
    
    
    
    @IBAction func firstBtnTapped(_ sender: Any) {
        DamyAnnualSales = "$0-$100k"
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "StoreNameViewController") as! StoreNameViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        nextVC.DamyUserID = self.DamyUserId
        nextVC.DamyStoreType = self.StoreType
        nextVC.DamyAnnualSales = self.DamyAnnualSales
    }
    
    @IBAction func secoundBtnTapped(_ sender: Any) {
        DamyAnnualSales = "$100k-$200k"
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "StoreNameViewController") as! StoreNameViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        nextVC.DamyUserID = self.DamyUserId
        nextVC.DamyStoreType = self.StoreType
        nextVC.DamyAnnualSales = self.DamyAnnualSales
    }
    
    @IBAction func thridBtnTapped(_ sender: Any) {
        DamyAnnualSales = "$200k-$500k"
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "StoreNameViewController") as! StoreNameViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        nextVC.DamyUserID = self.DamyUserId
        nextVC.DamyStoreType = self.StoreType
        nextVC.DamyAnnualSales = self.DamyAnnualSales
    }
    
    @IBAction func fouthBtnTapped(_ sender: Any) {
        DamyAnnualSales = "$500k-$1m"
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "StoreNameViewController") as! StoreNameViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        nextVC.DamyUserID = self.DamyUserId
        nextVC.DamyStoreType = self.StoreType
        nextVC.DamyAnnualSales = self.DamyAnnualSales
    }
    
    @IBAction func fifthBtnTapped(_ sender: Any) {
        DamyAnnualSales = "Over $1m"
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "StoreNameViewController") as! StoreNameViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        nextVC.DamyUserID = self.DamyUserId
        nextVC.DamyStoreType = self.StoreType
        nextVC.DamyAnnualSales = self.DamyAnnualSales
    }
    
    
    
}
