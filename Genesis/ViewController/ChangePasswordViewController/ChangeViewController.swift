//
//  ChangeViewController.swift
//  Genesis
//
//  Created by Ashish Kr Singh on 24/11/19.
//  Copyright © 2019 Ashish Kr Singh. All rights reserved.
//

import UIKit

class ChangeViewController: UIViewController {

    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var currentPasswordTextField: UITextField!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.thirdView.setShadow(radius: 4.0, oppocity: 0.2)
        self.secondView.setShadow(radius: 4.0, oppocity: 0.2)
        self.firstView.setShadow(radius: 4.0, oppocity: 0.2)

        self.thirdView.layer.borderColor = APPCOLOR.cgColor
        self.secondView.layer.borderColor = APPCOLOR.cgColor
        self.firstView.layer.borderColor = APPCOLOR.cgColor
        self.submitBtn.setShadow(radius: 4.0, oppocity: 0.3)
        self.headerView.setBottomShadow(radius: 0.0)
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func commonEyeBtnAction(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        if sender.tag == 100 {
            self.currentPasswordTextField.isSecureTextEntry = !sender.isSelected
        }else if sender.tag == 101 {
            self.newPasswordTextField.isSecureTextEntry = !sender.isSelected
        }else {
            self.confirmTextField.isSecureTextEntry = !sender.isSelected
        }
        
    }
    
    @IBAction func submitBtnAction(_ sender: Any) {
        if self.currentPasswordTextField.text!.isEmpty {
            showAlert(title: APPNAME, message: "Please enter Current Password.", controller: self)
        }else if self.newPasswordTextField.text!.isEmpty {
            showAlert(title: APPNAME, message: "Please enter New Password.", controller: self)
        }else if self.confirmTextField.text!.isEmpty {
            showAlert(title: APPNAME, message: "Please enter Confirm New Password.", controller: self)
        } else {
            showAlert(title: "Alert", message: "Password reset successfully.") {
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
