//
//  SearchViewController.swift
//  Genesis
//
//  Created by Ashish Kr Singh on 30/11/19.
//  Copyright © 2019 Ashish Kr Singh. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var yourChoiceLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var myTableView: UITableView!
    var shortNameList = [String]()
    var longNameList = [String]()
    var imageNameList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.searchView.setShadow(radius: 4.0)
        self.headerView.setShadow(radius: 0.0, oppocity: 0.1)
        shortNameList = ["BTC","BNT","BTG","BTS","BAT","BTT","CELR","CDT","DASH","DLT","DATA","ETH","EOS"]
        longNameList = ["Bitcoin","Bancor","Bitcoin Gold","BitShares","Basic Attention Token","BitTorrent","Celer Network","Blox","Dash","Agrello","Streamr DATAcoin","Etherreum","EOS"]
        imageNameList = ["btcz","bnt","btg","bts","bat","btt","cenz","cdt","dash","dlt","data","eth","eos"]


    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func micBtnAction(_ sender: Any) {
    }
    
    //MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shortNameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarketTableViewCell1") as! MarketTableViewCell
        cell.coinSortLabel.text = shortNameList[indexPath.row]
        cell.coinLongLabel.text = longNameList[indexPath.row]
        cell.coinImageView.image = UIImage.init(named: imageNameList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

}
