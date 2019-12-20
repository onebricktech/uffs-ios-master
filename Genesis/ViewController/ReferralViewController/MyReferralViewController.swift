//
//  MyReferralViewController.swift
//  Genesis
//
//  Created by Ashish Kr Singh on 30/11/19.
//  Copyright © 2019 Ashish Kr Singh. All rights reserved.
//

import UIKit

class MyReferralViewController: UIViewController {

    @IBOutlet weak var lastView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var commisionLabel: UILabel!
    @IBOutlet weak var numberOfReferralLabel: UILabel!
    @IBOutlet weak var referralLinkLabel: UILabel!
    @IBOutlet weak var referralCodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.headerView.setShadow(radius: 0.0, oppocity: 2.0)
        self.firstView.setShadow(radius: 0.0)
        self.lastView.setShadow(radius: 8.0)

    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func copyReferralCodeBtnAction(_ sender: Any) {
    }
    
    @IBAction func linkBtnAction(_ sender: Any) {
    }
    @IBAction func showQRBtnAction(_ sender: Any) {
    
    }
    
    @IBAction func copyReferralLinkBtnAction(_ sender: Any) {
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
