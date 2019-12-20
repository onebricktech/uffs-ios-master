//
//  DepositViewController.swift
//  Genesis
//
//  Created by Ashish Kr Singh on 30/11/19.
//  Copyright © 2019 Ashish Kr Singh. All rights reserved.
//

import UIKit

class DepositViewController: UIViewController {

    @IBOutlet weak var coinLongLabel: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var coinShortLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func qrBtnAction(_ sender: Any) {
    }
    @IBAction func copyBtnAction(_ sender: Any) {
    }
    @IBAction func rightArrowBtnAction(_ sender: Any) {
    }
    @IBAction func historyBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
