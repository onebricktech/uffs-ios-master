//
//  MyAccountViewController.swift
//  Genesis
//
//  Created by Ashish Kr Singh on 24/11/19.
//  Copyright © 2019 Ashish Kr Singh. All rights reserved.
//

import UIKit

class MyAccountViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    //logout view
    @IBOutlet weak var transparentView: UIView!
    @IBOutlet weak var noBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.transparentView.isHidden = true
        self.noBtn.layer.borderColor = APPCOLOR.cgColor
    }
    
    //MARK:- IBAction Methods
    @IBAction func noBtnAction(_ sender: Any) {
        self.transparentView.isHidden = true
    }
    @IBAction func yesBtnAction(_ sender: Any) {
        self.transparentView.isHidden = true

    }
    
    //MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarketTableViewCell1") as! MarketTableViewCell
        cell.btnLabel.setTitle("", for: .normal)
        cell.btnLabel.isHidden = false
        cell.containerView.setShadow(radius: 0.0, oppocity: 0.1)
        switch indexPath.row {
        case 0:
            cell.centerLabel.text = "My Referral ID"
            cell.coinImageView.image = UIImage.init(named: "icons8_Gift_100px_1")
            cell.btnLabel.setTitle("ID:646545", for: .normal)
            cell.btnLabel.setTitleColor(.darkGray, for: .normal)
            break
        case 1:
            cell.centerLabel.text = "Identity Authentication"
            cell.coinImageView.image = UIImage.init(named: "icons8_Name_Tag_100px")
            cell.btnLabel.setTitle("Teir 2", for: .normal)
            cell.btnLabel.setTitleColor(APPCOLOR, for: .normal)
            break
        case 2:
            cell.centerLabel.text = "Change Password"
            cell.coinImageView.image = UIImage.init(named: "icons8_Security_Lock_100px")
            break
        case 3:
            cell.centerLabel.text = "Settings"
            cell.coinImageView.image = UIImage.init(named: "icons8_Settings_100px")
            break
        case 4:
            
            cell.centerLabel.text = "Support"
            cell.coinImageView.image = UIImage.init(named: "icons8_Customer_Support_100px")
            break
        case 5:
            cell.centerLabel.text = "Logout"
            cell.coinImageView.image = UIImage.init(named: "icons8_Shutdown_100px")
            cell.btnLabel.isHidden = true

            break
            
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let objVC = mainStoryboard.instantiateViewController(withIdentifier: "MyReferralViewController") as! MyReferralViewController
            APPDELEGATE.navigationController.pushViewController(objVC, animated: true)
            break
        case 1:
            let objVC = mainStoryboard.instantiateViewController(withIdentifier: "IdentityViewController") as! IdentityViewController
            objVC.modalPresentationStyle = .overFullScreen
            DispatchQueue.main.async {
                self.present(objVC, animated: true, completion: nil)
            }
            
            break
        case 2:
            let objVC = authStoryboard.instantiateViewController(withIdentifier: "ChangeViewController") as! ChangeViewController
            APPDELEGATE.navigationController.pushViewController(objVC, animated: true)
            break
        case 3:
            
            break
        case 4:
            let objVC = mainStoryboard.instantiateViewController(withIdentifier: "HelpAndSupportViewController") as! HelpAndSupportViewController
            APPDELEGATE.navigationController.pushViewController(objVC, animated: true)
            break
        case 5:
            self.transparentView.isHidden = false
            
            break
            
        default:
            break
        }
        
    }

}
