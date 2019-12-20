//
//  MarketTableViewCell.swift
//  Genesis
//
//  Created by Ashish Singh on 28/11/19.
//  Copyright © 2019 Ashish Kr Singh. All rights reserved.
//

import UIKit

class MarketTableViewCell: UITableViewCell {

    @IBOutlet weak var lossBtn: UIButton!
    @IBOutlet weak var profitBtn: UIButton!
    @IBOutlet weak var bottomLineImageView: UIImageView!
    @IBOutlet weak var upperLineImageView: UIImageView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var coinLongLabel: UILabel!
    @IBOutlet weak var coinSortLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var btnLabel: UIButton!
    @IBOutlet weak var perLabel: UILabel!
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var volLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
