//
//  IdentityViewController.swift
//  Genesis
//
//  Created by Ashish Kr Singh on 01/12/19.
//  Copyright © 2019 Ashish Kr Singh. All rights reserved.
//

import UIKit

class IdentityViewController: UIViewController {
    
    @IBOutlet weak var firstCircleLabel: UILabel!
    @IBOutlet weak var secondCircleLabel: UILabel!
    @IBOutlet weak var thirdCircleLabel: UILabel!
    @IBOutlet weak var firstlineLabel: UILabel!
    @IBOutlet weak var secondlineLabel: UILabel!
    @IBOutlet weak var thirdlineLabel: UILabel!
    @IBOutlet weak var fourthlineLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialSetup()
    }
    
    func initialSetup() {
        self.firstCircleLabel.layer.borderWidth = 3
        self.firstCircleLabel.layer.borderColor = APPCOLOR.cgColor
        self.firstCircleLabel.backgroundColor = .white
        
        self.secondCircleLabel.layer.borderWidth = 3
        self.secondCircleLabel.layer.borderColor = APPCOLOR.cgColor
        self.secondCircleLabel.backgroundColor = .white

        self.thirdCircleLabel.layer.borderWidth = 0
        self.thirdCircleLabel.backgroundColor = .lightGray
        
        self.firstlineLabel.backgroundColor = APPCOLOR
        self.secondlineLabel.backgroundColor = APPCOLOR
        self.thirdlineLabel.backgroundColor = APPCOLOR
        self.fourthlineLabel.backgroundColor = .lightGray

    }

    @IBAction func okBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
