//
//  TabbarViewController.swift
//  Genesis
//
//  Created by Ashish Kr Singh on 24/11/19.
//  Copyright © 2019 Ashish Kr Singh. All rights reserved.
//

import UIKit

class TabbarViewController: UIViewController {

    @IBOutlet weak var fourthBtn: UIButton!
    @IBOutlet weak var fifthBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    var homeVC: HomeViewController!
    var marketVC: MarketViewController!
    var sellVC: SellAndBuyViewController!
    var walletVC: WalletViewController!
    var accountVC: MyAccountViewController!

    var navHome: UINavigationController!
    var navMarket: UINavigationController!
    var navOrder: UINavigationController!
    var navWallet: UINavigationController!
    var navAccount : UINavigationController!
    var controller : UINavigationController!
    var controllerArray : Array<UINavigationController>!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.resetAllBtn()
        self.firstBtn.isSelected = true
        self.setsNavigationController()
        self.setInitialController(index: 0)
        self.bottomView.setShadow1(radius: 0.0)
    }
    
    func resetAllBtn() {
        self.firstBtn.isSelected = false
        self.secondBtn.isSelected = false
        self.thirdBtn.isSelected = false
        self.fourthBtn.isSelected = false
        self.fifthBtn.isSelected = false
    }
    
    private func setsNavigationController() {
        

        homeVC = (otherStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController)
        marketVC = (mainStoryboard.instantiateViewController(withIdentifier: "MarketViewController") as! MarketViewController)
        sellVC = (otherStoryboard.instantiateViewController(withIdentifier: "SellAndBuyViewController") as! SellAndBuyViewController)
        walletVC = (mainStoryboard.instantiateViewController(withIdentifier: "WalletViewController") as! WalletViewController)

        accountVC = (mainStoryboard.instantiateViewController(withIdentifier: "MyAccountViewController") as! MyAccountViewController)
        
        self.navHome = UINavigationController(rootViewController: homeVC)
        self.navMarket = UINavigationController(rootViewController: marketVC)
        self.navOrder = UINavigationController(rootViewController: sellVC)
        self.navWallet = UINavigationController(rootViewController: walletVC)
        self.navAccount = UINavigationController(rootViewController: accountVC)
        
        self.controllerArray = [self.navHome,self.navMarket,self.navOrder,self.navWallet,self.navAccount]
    }
    
    func setInitialController(index : Int){
        self.controllerArray = [self.navHome,self.navMarket,self.navOrder,self.navWallet,self.navAccount]
        
        for subview in containerView.subviews {
            subview.removeFromSuperview()
        }
        self.controller = self.controllerArray[index]
        controller.view.frame = containerView.bounds
        containerView.addSubview(controller.view)
        self.addChild(controller)
        
        controller.didMove(toParent: self)
        self.controller.isNavigationBarHidden = true
        self.view.endEditing(true)
        if controller.viewControllers.count > 1 {
            controller.popToRootViewController(animated: false)
        }
    }
    

    @IBAction func commonBtnAction(_ sender: UIButton) {
        self.resetAllBtn()
        sender.isSelected = true
        self.setInitialController(index: sender.tag - 100)
    }
    

}
