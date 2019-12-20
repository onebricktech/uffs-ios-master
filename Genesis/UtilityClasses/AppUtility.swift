//
//  AppUtility.swift
//  WaamaahApp
//
//  Created by Ashish Kumar singh on 09/07/18.
//  Copyright © 2018 Xicom All rights reserved.
//

import UIKit

let APPCOLOR = UIColor.init(red: (0/255.0), green: (109/255.0), blue: (191/255.0), alpha: 1.0)
let APPLIGHTCOLOR = UIColor.init(red: (0/255.0), green: (141/255.0), blue: (248/255.0), alpha: 1.0)

let APPGREENCOLOR = UIColor.init(red: (97/255.0), green: (205/255.0), blue: (95/255.0), alpha: 1.0)

let APPORANGECOLOR1 = UIColor.init(red: (255/255.0), green: (161/255.0), blue: (0/255.0), alpha: 1.0)
let APPLINECOLOR = UIColor.init(red: (200/255.0), green: (151/255.0), blue: (88/255.0), alpha: 1.0)
let APPNAME = "Genesis"
let APPDELEGATE = UIApplication.shared.delegate as! AppDelegate
let authStoryboard = UIStoryboard(name: "Authentication", bundle: nil)
let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
let otherStoryboard = UIStoryboard(name: "Other", bundle: nil)
let newOtherStoryboard = UIStoryboard(name: "NewOther", bundle: nil)
let isPrint = true

let WINDOW_WIDTH = UIScreen.main.bounds.width
let WINDOW_HEIGHT = UIScreen.main.bounds.height

enum FriendRequestStatus {
    case FriendRequestSend
    case Friend
    case Unfriend
    case IsFromRequestSend
    case IsFromApproveReject
    case IsCancelFriendRequest
    case IsUnfriendOfFriend
}

extension Data {
    var hexString: String {
        let hexString = map { String(format: "%02.2hhx", $0) }.joined()
        return hexString
    }
}


class AppUtility: NSObject {
    
}

func showAlert(title:String, message:String, controller:UIViewController){
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let defaultAction = UIAlertAction(title: "OK", style: .default, handler:nil)
    alertController.addAction(defaultAction)
    alertController.view.tintColor = APPCOLOR
   
    controller.present(alertController, animated: true, completion: nil)
}

func showAlert(title: String, message: String, controller:UIViewController, acceptBlock: @escaping () -> ()) {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let acceptButton = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction) in
        acceptBlock()
    })
    alertController.addAction(acceptButton)
    controller.present(alertController, animated: true, completion: nil)
}

func showAlert(title: String, message: String, acceptBlock: @escaping () -> ()) {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let acceptButton = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction) in
        acceptBlock()
    })
    alertController.addAction(acceptButton)
    APPDELEGATE.navigationController.topViewController?.present(alertController, animated: true, completion: nil)
}



func logInfo(message: String, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
    if (isPrint) {
        print("\(function): \(line): \(message)")
    }
}

//MARK:- HUD
//MARK:- HUD
func showHud() {
    SwiftLoader.show(true)
}

func hideHud() {
    SwiftLoader.hide()
}

//get day by adding in date
func getDateByAddingDay(value : Int, date: Date) -> Date {
    return Calendar.current.date(byAdding: .day, value: -value, to: getNoon(date: date))!
}

func getNoon(date : Date) -> Date {
    return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: date)!
}

