//
//  Register1ViewController.swift
//  Genesis
//
//  Created by Ashish Singh on 26/11/19.
//  Copyright © 2019 Ashish Kr Singh. All rights reserved.
//

import UIKit

class Register1ViewController: UIViewController {
    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var usernametextField: UITextField!
    @IBOutlet weak var firstNameView: UIView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameView: UIView!
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var cpassowrdView: UIView!
    
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var birthdayView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailView: UIView!
    
    @IBOutlet weak var birthDayTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var proceedBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var agreeBtn: UIButton!
    @IBOutlet weak var bannerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialMethod()
    }
    
    func initialMethod() {
        
        self.usernameView.setShadow(radius: 4.0, oppocity: 0.3)
        self.firstNameView.setShadow(radius: 4.0, oppocity: 0.3)
        self.lastNameView.setShadow(radius: 4.0, oppocity: 0.3)
        self.emailView.setShadow(radius: 4.0, oppocity: 0.3)
        self.countryView.setShadow(radius: 4.0, oppocity: 0.3)
        self.birthdayView.setShadow(radius: 4.0, oppocity: 0.3)
        self.passwordView.setShadow(radius: 4.0, oppocity: 0.3)
        self.cpassowrdView.setShadow(radius: 4.0, oppocity: 0.3)

        self.proceedBtn.setShadow(radius: 4.0, oppocity: 0.3)
        self.loginBtn.setShadow(radius: 4.0, oppocity: 0.3)
        self.bannerImageView.setBottomShadow(radius: 0.0)
        
        self.usernameView.layer.borderColor = APPCOLOR.cgColor
        self.firstNameView.layer.borderColor = APPCOLOR.cgColor
        self.lastNameView.layer.borderColor = APPCOLOR.cgColor
        self.emailView.layer.borderColor = APPCOLOR.cgColor
        self.countryView.layer.borderColor = APPCOLOR.cgColor
        self.birthdayView.layer.borderColor = APPCOLOR.cgColor
        self.passwordView.layer.borderColor = APPCOLOR.cgColor
        self.cpassowrdView.layer.borderColor = APPCOLOR.cgColor

        self.loginBtn.layer.borderColor = APPCOLOR.cgColor
    }
    
    @IBAction func eyeBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.tag == 100 {
            passwordTextField.isSecureTextEntry = !sender.isSelected
            
        }else if sender.tag == 101 {
            confirmTextField.isSecureTextEntry = !sender.isSelected
        }
        
    }
    @IBAction func birthDayBtnAction(_ sender: Any) {
    }
    @IBAction func countryBtnAction(_ sender: Any) {
    }
    @IBAction func proceedBtnAction(_ sender: Any) {
        
        if self.usernametextField.text!.isEmpty {
            showAlert(title: APPNAME, message: "Please enter E-Vault Username.", controller: self)
        }else if self.firstNameTextField.text!.isEmpty {
            showAlert(title: APPNAME, message: "Please enter First Name.", controller: self)
        }else if self.lastNameTextField.text!.isEmpty {
            showAlert(title: APPNAME, message: "Please enter Last Name.", controller: self)
        }else if self.emailTextField.text!.isEmpty {
            showAlert(title: APPNAME, message: "Please enter Email ID.", controller: self)
        }else if self.countryTextField.text!.isEmpty {
            showAlert(title: APPNAME, message: "Please select country.", controller: self)
        }else if self.birthDayTextField.text!.isEmpty {
            showAlert(title: APPNAME, message: "Please select BirthDay.", controller: self)
        }else if self.passwordTextField.text!.isEmpty {
            showAlert(title: APPNAME, message: "Please enter Password.", controller: self)
        }else if self.confirmTextField.text!.isEmpty {
            showAlert(title: APPNAME, message: "Please enter Confirm Password.", controller: self)
        }else if self.confirmTextField.text! != self.passwordTextField.text {
            showAlert(title: APPNAME, message: "Password and Confirm Password must be same.", controller: self)
        }else {
            let objVC = authStoryboard.instantiateViewController(withIdentifier: "BasicIDLoginViewController") as! BasicIDLoginViewController
            APPDELEGATE.navigationController.pushViewController(objVC, animated: true)
        }
    }
    
    @IBAction func termsBtnAction(_ sender: UIButton) {
        
    }
    
    @IBAction func agreeBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
