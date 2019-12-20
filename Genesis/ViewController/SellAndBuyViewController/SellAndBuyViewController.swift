//
//  SellAndBuyViewController.swift
//  Genesis
//
//  Created by Ashish Kr Singh on 01/12/19.
//  Copyright © 2019 Ashish Kr Singh. All rights reserved.
//

import UIKit

class SellAndBuyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var mainBuyBtn: UIButton!
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var sellLabel: UILabel!
    @IBOutlet weak var buyLabel: UILabel!
    @IBOutlet weak var myorderBtn: UIButton!
    @IBOutlet weak var sellBtn: UIButton!
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var titleBtn: UIButton!
    @IBOutlet weak var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.headerView.setShadow(radius: 0.0)
    }
    
    func resetAllLabel() {
        self.orderLabel.isHidden = true
        self.sellLabel.isHidden = true
        self.buyLabel.isHidden = true
        self.buyBtn.setTitleColor(.black, for: .normal)
        self.sellBtn.setTitleColor(.black, for: .normal)
        self.myorderBtn.setTitleColor(.black, for: .normal)
    }
    
    @IBAction func commonBtnAction(_ sender: UIButton) {
        self.resetAllLabel()
        sender.setTitleColor(APPCOLOR, for: .normal)
        
        if sender.tag == 100 {
            self.buyLabel.isHidden = false
            mainBuyBtn.backgroundColor = APPGREENCOLOR
        }else if sender.tag == 101 {
            self.sellLabel.isHidden = false
            mainBuyBtn.backgroundColor = .red

        }else if sender.tag == 102 {
            self.orderLabel.isHidden = false
        }
        
    }
  
    @IBAction func titleBtnAction(_ sender: Any) {
        
    }
    
    @IBAction func mainBuyBtnAction(_ sender: Any) {
        
    }
    
    @IBAction func orderHistoryBtnAction(_ sender: Any) {
    }
    
    @IBAction func firstMinusBtnAction(_ sender: Any) {
    }
    
    @IBAction func secondMinusBtnAction(_ sender: Any) {
    }
    
    @IBAction func thirdMinusBtnAction(_ sender: Any) {
    }
    
    @IBAction func firstPlusBtnAction(_ sender: Any) {
    }
    
    @IBAction func secondPlusBtnAction(_ sender: Any) {
    }
    
    @IBAction func thirdPlusBtnAction(_ sender: Any) {
    }
    
    //MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarketTableViewCell") as! MarketTableViewCell
        cell.upperLineImageView.isHidden = true
        cell.bottomLineImageView.isHidden = true
        cell.amountLabel.textColor = .black

        if indexPath.row == 8 {
            cell.upperLineImageView.isHidden = false
            cell.bottomLineImageView.isHidden = false
            cell.priceLabel.textColor = .red
            cell.amountLabel.textColor = .red
        }
        
        if indexPath.row > 8 {
            cell.priceLabel.textColor = APPGREENCOLOR
        }else {
            cell.priceLabel.textColor = .red
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 8 {
            return 36.0

        }else {
            return 25.0
        }
    }
}
