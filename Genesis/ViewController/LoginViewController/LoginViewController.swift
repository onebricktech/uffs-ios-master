//
//  LoginViewController.swift
//  Genesis
//
//  Created by Ashish Kr Singh on 24/11/19.
//  Copyright © 2019 Ashish Kr Singh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var eyeBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialMethod()
    }
    
    func initialMethod() {
        self.emailView.setShadow(radius: 4.0, oppocity: 0.3)
        self.emailView.layer.borderColor = APPCOLOR.cgColor
        self.passwordView.layer.borderColor = APPCOLOR.cgColor
        self.passwordView.setShadow(radius: 4.0, oppocity: 0.3)
        self.loginBtn.setShadow(radius: 4.0, oppocity: 0.3)
        self.registerBtn.layer.cornerRadius = 4.0
        self.registerBtn.layer.borderWidth = 1
        self.registerBtn.layer.borderColor = APPCOLOR.cgColor
        self.registerBtn.setShadow(radius: 4.0, oppocity: 0.3)
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
//        if self.emailTextField.text!.isEmpty {
//            showAlert(title: APPNAME, message: "Please enter Email.", controller: self)
//        }else if self.passwordTextField.text!.isEmpty {
//            showAlert(title: APPNAME, message: "Please enter Password.", controller: self)
//        }else {
            let objVC = authStoryboard.instantiateViewController(withIdentifier: "TeamandPlayerVC") as! TeamandPlayerVC
            self.navigationController?.pushViewController(objVC, animated: true)
           
            
        //}
    }
    
    @IBAction func forgotBtnAction(_ sender: Any) {
        
    }
    
    @IBAction func eyeBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.passwordTextField.isSecureTextEntry = !sender.isSelected
    }
    
    @IBAction func registerBtnAction(_ sender: Any) {
        let objVC = authStoryboard.instantiateViewController(withIdentifier: "Register1ViewController") as! Register1ViewController
        self.navigationController?.pushViewController(objVC, animated: true)
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
