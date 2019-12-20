//
//  ViewController.swift
//  UFFSports
//
//  Created by Innovative Tech Lab on 04/12/19.
//  Copyright © 2019 CodeTECHNIQ. All rights reserved.
//

import UIKit

class TeamandPlayerVC: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
    }
    
    
    @IBAction func actionRegisterPlayer(_ sender: Any) {
        let vc = authStoryboard.instantiateViewController(withIdentifier: "PlayerRegistrationVC") as? PlayerRegistrationVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}

//Table View Delgates and Datasource
extension TeamandPlayerVC : UICollectionViewDelegate, UICollectionViewDataSource,UITableViewDelegate, UITableViewDataSource {
     
    
   func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
   }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 5
        
       }

       // make a cell for each cell index path
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamName", for: indexPath as IndexPath)
                       as! TeamNameCVC
                      return cell
           
       }

       // MARK: - UICollectionViewDelegate protocol

       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           // handle tap events
            let vc = authStoryboard.instantiateViewController(withIdentifier: "TeamNameVC") as? TeamNameVC
                   self.navigationController?.pushViewController(vc!, animated: true)
       }
    
     
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 5
     }
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
     {
             return 190
        
     }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         //Cell Declaration
         let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerNameTVC", for: indexPath) as! PlayerNameTVC
        
         return cell
     }
    
}
