//
//  MarketViewController.swift
//  Genesis
//
//  Created by Ashish Kr Singh on 24/11/19.
//  Copyright © 2019 Ashish Kr Singh. All rights reserved.
//

import UIKit

class MarketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var tempView: UIView!
    @IBOutlet weak var usdBtn: UIButton!
    @IBOutlet weak var altsBtn: UIButton!
    @IBOutlet weak var btcBtn: UIButton!
    @IBOutlet weak var bnbBtn: UIButton!
    @IBOutlet weak var favoriteBtn: UIButton!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var bnbLabel: UILabel!
    @IBOutlet weak var btcLabel: UILabel!
    @IBOutlet weak var altsLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!

    @IBOutlet weak var blankLabel: UILabel!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var leftConstant: NSLayoutConstraint!
    @IBOutlet weak var rightConstant: NSLayoutConstraint!
    @IBOutlet weak var searchView: UIView!
    var isCharge = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialMethod()
    }
    
    //MARK: - Helper Methods
    func initialMethod() {
        self.tempView.setBottomShadow(radius: 0.0)
        self.searchView.setShadow(radius: 4.0)
        self.rightConstant.constant = -WINDOW_WIDTH
        self.leftConstant.constant = WINDOW_WIDTH
        self.searchBtn.layer.cornerRadius = 2.0;
        
    }
    
    func resetButtons(sender: UIButton) {
        self.favoriteLabel.isHidden = true;
        self.bnbLabel.isHidden = true;
        self.btcLabel.isHidden = true;
        self.altsLabel.isHidden = true;
        self.usdLabel.isHidden = true;
        self.favoriteBtn.setTitleColor(.black, for: .normal)
        self.bnbBtn.setTitleColor(.black, for: .normal)
        self.btcBtn.setTitleColor(.black, for: .normal)
        self.altsBtn.setTitleColor(.black, for: .normal)
        self.usdBtn.setTitleColor(.black, for: .normal)
        if sender.tag == 100 {
            self.favoriteLabel.isHidden = false;
        }else if sender.tag == 101 {
            self.bnbLabel.isHidden = false;
        }else if sender.tag == 102 {
            self.btcLabel.isHidden = false;
        }else if sender.tag == 103 {
            self.altsLabel.isHidden = false;
        }else if sender.tag == 104 {
            self.usdLabel.isHidden = false;
        }
        sender.setTitleColor(APPCOLOR, for: .normal)
        
    }
    
    @IBAction func micBtnAction(_ sender: Any) {
    }
    
    @IBAction func closeArrowSerchBtnAction(_ sender: Any) {
        self.rightConstant.constant = -WINDOW_WIDTH
        self.leftConstant.constant = WINDOW_WIDTH
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func searchBtnAction(_ sender: UIButton) {
       
        self.rightConstant.constant = 15
        self.leftConstant.constant = 15
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }

    }
    
    @IBAction func commonBtnAction(_ sender: UIButton) {
        self.resetButtons(sender: sender)
        self.myTableView.isHidden = false
        self.blankLabel.isHidden = true
        if sender.tag == 100 {
            self.favoriteLabel.isHidden = false;
            self.myTableView.isHidden = true
            self.blankLabel.isHidden = false
        }else if sender.tag == 101 {
            self.bnbLabel.isHidden = false;
        }else if sender.tag == 102 {
            self.btcLabel.isHidden = false;
        }else if sender.tag == 103 {
            self.altsLabel.isHidden = false;
        }else if sender.tag == 104 {
            self.usdLabel.isHidden = false;
        }
    }
    
    @IBAction func chargeBtnAction(_ sender: UIButton) {
        isCharge = !isCharge
        self.myTableView.reloadData()
    }
   
    //MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarketTableViewCell") as! MarketTableViewCell
        
        
        if isCharge {
            cell.btnLabel.backgroundColor = .red
        }else {
            cell.btnLabel.backgroundColor = APPGREENCOLOR
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objVC = otherStoryboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        APPDELEGATE.navigationController.pushViewController(objVC, animated: true)
    }
}
