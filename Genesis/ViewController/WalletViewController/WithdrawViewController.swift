//
//  WithdrawViewController.swift
//  Genesis
//
//  Created by Ashish Kr Singh on 30/11/19.
//  Copyright © 2019 Ashish Kr Singh. All rights reserved.
//

import UIKit

class WithdrawViewController: UIViewController {
    
    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var coinShortLabel: UILabel!
    @IBOutlet weak var coinLongLabel: UILabel!
    @IBOutlet weak var availableBalance: UILabel!
    @IBOutlet weak var tempView: UIView!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    //success view
    @IBOutlet weak var transparentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialSetup()
        self.transparentView.isHidden = true
        
    }
    
    func initialSetup() {
            self.tempView.layer.borderColor = APPCOLOR.cgColor
    }
    
    @IBAction func viewTransactionBtnAction(_ sender: Any) {
        self.transparentView.isHidden = true

    }
    
    @IBAction func qrCodeBtnAction(_ sender: Any) {
    }
    
    @IBAction func downArrowBtnAction(_ sender: Any) {
    }
    
    @IBAction func maxBtnAction(_ sender: Any) {
    }
    
    @IBAction func rightArrowBtnAction(_ sender: Any) {
        let objVC = mainStoryboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        objVC.modalPresentationStyle = .overFullScreen
        self.present(objVC, animated: true, completion: nil)
    }
    
    @IBAction func historyBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func withdrawBtnAction(_ sender: Any) {
        self.transparentView.isHidden = false

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
