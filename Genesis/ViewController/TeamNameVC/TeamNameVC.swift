//
//  TeamNameVC.swift
//  UFFSports
//
//  Created by Innovative Tech Lab on 06/12/19.
//  Copyright © 2019 CodeTECHNIQ. All rights reserved.
//

import UIKit

class TeamNameVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
//Table View Delgates and Datasource
extension TeamNameVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        
            return 70
       
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Cell Declaration
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamNameTVC", for: indexPath) as! TeamNameTVC
       
        return cell
    }
    
}
