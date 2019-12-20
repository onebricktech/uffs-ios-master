//
//  WalletViewController.swift
//  Genesis
//
//  Created by Ashish Kr Singh on 24/11/19.
//  Copyright © 2019 Ashish Kr Singh. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var distributionBtn: UIButton!
    @IBOutlet weak var tempView: UIView!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var distributionLabel: UILabel!
    @IBOutlet weak var depositLabel: UILabel!
    @IBOutlet weak var withdrawLabel: UILabel!
    @IBOutlet weak var transactionHistoryLabel: UILabel!

    @IBOutlet weak var tempViewHeightConstant: NSLayoutConstraint!
    
    @IBOutlet weak var withdrawBtn: UIButton!
    @IBOutlet weak var depositBtn: UIButton!
    @IBOutlet weak var equalAmountLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var showAllBtn: UIButton!
    
    var isBalance = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialMethod()
    }
    
    //MARK: - Helper Methods
    func initialMethod() {
        self.tempView.setBottomShadow(radius: 0.0)
        self.showAllBtn.setTitle("Show All Balance", for: .normal)
        
    }
    
    func resetButtons(sender: UIButton) {
        self.depositLabel.isHidden = true;
        self.withdrawLabel.isHidden = true;
        self.distributionLabel.isHidden = true;
       
        self.depositBtn.setTitleColor(.black, for: .normal)
        self.withdrawBtn.setTitleColor(.black, for: .normal)
        self.distributionBtn.setTitleColor(.black, for: .normal)
        
        if sender.tag == 100 {
            self.depositLabel.isHidden = false;
        }else if sender.tag == 101 {
            self.withdrawLabel.isHidden = false;
        }else if sender.tag == 102 {
            self.distributionLabel.isHidden = false;
        }
        sender.setTitleColor(APPCOLOR, for: .normal)
        
    }
    
    @IBAction func depositBtnAction(_ sender: Any) {
        let objVC = mainStoryboard.instantiateViewController(withIdentifier: "DepositViewController") as! DepositViewController
        APPDELEGATE.navigationController.pushViewController(objVC, animated: true)
    }
    
    @IBAction func withdrawBtnAction(_ sender: Any) {
        let objVC = mainStoryboard.instantiateViewController(withIdentifier: "WithdrawViewController") as! WithdrawViewController
        APPDELEGATE.navigationController.pushViewController(objVC, animated: true)
    }
    
    @IBAction func shoAllBtnAction(_ sender: UIButton) {
        isBalance = !isBalance
        if isBalance {
            self.showAllBtn.setTitle("Show Transaction History", for: .normal)
            self.transactionHistoryLabel.text = "All Balances"
            self.tempViewHeightConstant.constant = 30
           // self.tempView.layer.opacity = 0.0
            self.tempView.clipsToBounds = true

        }else {
            self.showAllBtn.setTitle("Show All Balance", for: .normal)
            self.transactionHistoryLabel.text = "Transaction History"
            self.tempViewHeightConstant.constant = 70
            self.tempView.setBottomShadow(radius: 0.0)
            self.tempView.clipsToBounds = false

        }
        self.view.layoutIfNeeded()
        self.myTableView.reloadData()
    }
    
    @IBAction func commonBtnAction(_ sender: UIButton) {
        self.resetButtons(sender: sender)
        if sender.tag == 100 {
            // depositLabel
        }else if sender.tag == 101 {
            // withdrawLabel
        }else if sender.tag == 102 {
            //distributionLabel
            
        }
    }
    
    //MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isBalance {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MarketTableViewCell1") as! MarketTableViewCell
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MarketTableViewCell") as! MarketTableViewCell
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isBalance {
            return 55.0
        }else {
            return 66.0
        }
    }

}
