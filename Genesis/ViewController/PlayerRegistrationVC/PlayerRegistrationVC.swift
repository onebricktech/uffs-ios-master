//
//  PlayerRegistrationVC.swift
//  UFFSports
//
//  Created by Innovative Tech Lab on 05/12/19.
//  Copyright © 2019 CodeTECHNIQ. All rights reserved.
//

import UIKit

class PlayerRegistrationVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let pickerSex = UIPickerView()
    let pickerportsLeague = UIPickerView()
    let pickerteamPosition = UIPickerView()
    let pickersportsTeam = UIPickerView()
    let datePicker = UIDatePicker()

    @IBOutlet weak var txtSportsTeam: UITextField!
    @IBOutlet weak var txtBirthdayPicker: UITextField!
    @IBOutlet weak var txtTeamPosition: UITextField!
    @IBOutlet weak var textLeague: UITextField!
    @IBOutlet weak var textSex: UITextField!
    let sex = ["Male","Female","Others"]
    let sportsLeague = ["League 1","League 2","League 3"]
    let teamPosition = ["Team 1","Team 2","Team 3"]
    let sportsTeam = ["Sports Team 1","Sports Team 2","Sports Team 3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerSex.dataSource = self
        pickerSex.delegate = self
        pickerportsLeague.dataSource = self
        pickerportsLeague.delegate = self
        pickerteamPosition.dataSource = self
        pickerteamPosition.delegate = self
        pickersportsTeam.dataSource = self
        pickersportsTeam.delegate = self
        textSex.inputView = pickerSex
        textLeague.inputView = pickerportsLeague
        txtTeamPosition.inputView = pickerteamPosition
        txtSportsTeam.inputView = pickersportsTeam
        pickerToolBar(textfield: textSex)
        pickerToolBar(textfield: textLeague)
        pickerToolBar(textfield: txtTeamPosition)
        pickerToolBar(textfield: txtSportsTeam)
        showDatePicker()

        // Do any additional setup after loading the view.
    }
    
    func showDatePicker(){
       //Formate Date
       datePicker.datePickerMode = .date

      //ToolBar
      let toolbar = UIToolbar();
      toolbar.sizeToFit()
      let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
     let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

    toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)

     txtBirthdayPicker.inputAccessoryView = toolbar
     txtBirthdayPicker.inputView = datePicker

    }

     @objc func donedatePicker(){
      let formatter = DateFormatter()
      formatter.dateFormat = "dd/MM/yyyy"
      txtBirthdayPicker.text = formatter.string(from: datePicker.date)
      self.view.endEditing(true)
    }

    @objc func cancelDatePicker(){
       self.view.endEditing(true)
     }
    
    func pickerToolBar(textfield: UITextField)  {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.donePicker))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textfield.inputAccessoryView = toolBar
    }
    
    @objc func donePicker() {
        textSex.resignFirstResponder()
        textLeague.resignFirstResponder()
        txtTeamPosition.resignFirstResponder()
        txtSportsTeam.resignFirstResponder()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerSex {
            return sex.count
        } else if pickerView == pickerportsLeague{
             return sportsLeague.count
        }
        else if pickerView == pickerteamPosition{
             return teamPosition.count
        }
        else if pickerView == pickersportsTeam{
             return sportsTeam.count
        }
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerSex {
            return sex[row]
        } else if pickerView == pickerportsLeague{
             return sportsLeague[row]
        }
        else if pickerView == pickerteamPosition{
                    return teamPosition[row]
               }
        else if pickerView == pickersportsTeam{
                    return sportsTeam[row]
               }
        return ""
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionSubmit(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
