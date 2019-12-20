//
//  BasicIDLoginViewController.swift
//  Genesis
//
//  Created by Ashish Singh on 26/11/19.
//  Copyright © 2019 Ashish Kr Singh. All rights reserved.
//

import UIKit

class BasicIDLoginViewController: UIViewController {
    @IBOutlet weak var phoneNumberView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var verifiedView: UIView!
    @IBOutlet weak var getStartBtn: UIButton!
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var remeberBtn: UIButton!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var transparentView: UIView!
    @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialMethod()
        
    }
    
    func initialMethod() {
        self.phoneNumberView.setShadow(radius: 4.0, oppocity: 0.3)
        self.passwordView.setShadow(radius: 4.0, oppocity: 0.3)
        self.loginBtn.setShadow(radius: 4.0, oppocity: 0.3)
        self.createBtn.setShadow(radius: 4.0, oppocity: 0.3)
        self.getStartBtn.setShadow(radius: 4.0, oppocity: 0.3)
        self.passwordView.layer.borderColor = APPCOLOR.cgColor
        self.phoneNumberView.layer.borderColor = APPCOLOR.cgColor
        self.loginBtn.layer.borderColor = APPCOLOR.cgColor
        self.createBtn.layer.borderColor = APPCOLOR.cgColor
        self.containerView.layer.borderColor = UIColor.lightGray.cgColor
        self.verifiedView.layer.borderColor = UIColor.lightGray.cgColor

    }
    
    @IBAction func getStartBtnAction(_ sender: Any) {
        self.transparentView.isHidden = true
    
        
    }
    @IBAction func closeBtnAction(_ sender: Any) {
        self.transparentView.isHidden = true
    }
    @IBAction func createBtnAction(_ sender: Any) {
        self.transparentView.isHidden = false
        self.containerView.isHidden = true
        self.verifiedView.isHidden = false
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
       
    }
    @IBAction func rememberBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    @IBAction func eyeBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.passwordTextField.isSecureTextEntry = !sender.isSelected

    }
    @IBAction func qrBtnAction(_ sender: Any) {
        self.transparentView.isHidden = false
        self.containerView.isHidden = false
        self.verifiedView.isHidden = true

    }
    
    @IBAction func flagBtnAction(_ sender: Any) {
    }
    
}
