//
//  HomeViewController.swift
//  Genesis
//
//  Created by Ashish Kr Singh on 24/11/19.
//  Copyright © 2019 Ashish Kr Singh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var rightConstant: NSLayoutConstraint!
    @IBOutlet weak var leftConstant: NSLayoutConstraint!
    
    var isProfit = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.headerView.setShadow(radius: 0.0, oppocity: 0.3)
        self.rightConstant.constant = -WINDOW_WIDTH
        self.leftConstant.constant = WINDOW_WIDTH
    }
    
    @IBAction func closeSearchBtnAction(_ sender: Any) {
        self.rightConstant.constant = -WINDOW_WIDTH
        self.leftConstant.constant = WINDOW_WIDTH
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func searchBtnAction(_ sender: Any) {
        self.rightConstant.constant = 0
        self.leftConstant.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc func profitBtnAction(sender: UIButton) {
        isProfit = true
        self.myTableView.reloadData()
    }
    
    @objc func lossBtnAction(sender: UIButton) {
        isProfit = false
        self.myTableView.reloadData()
    }
    
    //MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MarketTableViewCell") as! MarketTableViewCell
           
            let attributedString = NSMutableAttributedString(string:"")
            
            let boldAttr = [NSAttributedString.Key.font : UIFont.init(name: "OpenSans-Regular", size: 16.0), NSAttributedString.Key.foregroundColor : APPCOLOR]
            let normalAttr = [NSAttributedString.Key.font : UIFont.init(name: "OpenSans-Regular", size: 13.0), NSAttributedString.Key.foregroundColor : APPLIGHTCOLOR]
            let boldString = NSMutableAttributedString(string: "EVX", attributes:boldAttr)
            let normalString = NSMutableAttributedString(string: " / BTC", attributes:normalAttr)

            attributedString.append(boldString)
            attributedString.append(normalString)

            cell.firstLabel.attributedText = attributedString
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MarketTableViewCell2") as! MarketTableViewCell
            let attributedString = NSMutableAttributedString(string:"")
            
            let boldAttr = [NSAttributedString.Key.font : UIFont.init(name: "OpenSans-Regular", size: 16.0), NSAttributedString.Key.foregroundColor : APPCOLOR]
            let normalAttr = [NSAttributedString.Key.font : UIFont.init(name: "OpenSans-Regular", size: 13.0), NSAttributedString.Key.foregroundColor : APPLIGHTCOLOR]
            let boldString = NSMutableAttributedString(string: "EVX", attributes:boldAttr)
            let normalString = NSMutableAttributedString(string: " / BTC", attributes:normalAttr)
            
            attributedString.append(boldString)
            attributedString.append(normalString)
            
            cell.firstLabel.attributedText = attributedString
            
            if isProfit {
                cell.thirdLabel.backgroundColor = APPGREENCOLOR
                cell.thirdLabel.text = "+56,8686"
            }else {
                cell.thirdLabel.backgroundColor = .red
                cell.thirdLabel.text = "-67,767"

            }
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return UIView.init()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarketTableViewCell1") as! MarketTableViewCell
        cell.profitBtn.addTarget(self, action: #selector(self.profitBtnAction(sender:)), for: .touchUpInside)
        cell.lossBtn.addTarget(self, action: #selector(self.lossBtnAction(sender:)), for: .touchUpInside)
        cell.profitBtn.isSelected = false
        cell.lossBtn.isSelected = false
        cell.profitBtn.setTitleColor(.black, for: .normal)
        cell.lossBtn.setTitleColor(.black, for: .normal)

        if isProfit {
            cell.profitBtn.isSelected = true
            cell.profitBtn.setTitleColor(APPCOLOR, for: .normal)

        }else {
            cell.lossBtn.isSelected = true
            cell.lossBtn.setTitleColor(APPCOLOR, for: .normal)

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }

}
