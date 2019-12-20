//
//  DetailsViewController.swift
//  Genesis
//
//  Created by Ashish Singh on 03/12/19.
//  Copyright © 2019 Ashish Kr Singh. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var marketVieew: UIView!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var marketLabel: UILabel!
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var marketBtn: UIButton!
    @IBOutlet weak var bookBtn: UIButton!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var volLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var dollerAmountLabel: UILabel!
    @IBOutlet weak var mainAmountLabel: UILabel!
    @IBOutlet weak var titleBtn: UIButton!
    
    var isBook = true
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.headerView.setShadow(radius: 0.0, oppocity: 1.0)
        self.marketVieew.setShadow(radius: 0.0, oppocity: 1.0)
        self.marketVieew.isHidden = true

    }
    
    @IBAction func marketBtnAction(_ sender: Any) {
        self.bookBtn.setTitleColor(.black, for: .normal)
        self.bookLabel.isHidden = true
        
        self.marketBtn.setTitleColor(APPCOLOR, for: .normal)
        self.marketLabel.isHidden = false
        self.marketVieew.isHidden = false
        
        isBook = false
        self.myTableView.reloadData()

    }
    @IBAction func bookBtnAction(_ sender: Any) {
        self.marketBtn.setTitleColor(.black, for: .normal)
        self.marketLabel.isHidden = true
        
        self.bookBtn.setTitleColor(APPCOLOR, for: .normal)
        self.bookLabel.isHidden = false
        self.marketVieew.isHidden = true
        isBook = true
        self.myTableView.reloadData()

    }
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func titleBtnAction(_ sender: Any) {
        
    }
  
    //MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isBook {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MarketTableViewCell") as! MarketTableViewCell
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MarketTableViewCell1") as! MarketTableViewCell
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }
}
