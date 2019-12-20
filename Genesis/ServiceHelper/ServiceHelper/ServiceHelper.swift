//
//  ServiceHelper.swift
//  WaamaahApp
//
//  Created by Ashish Kumar singh on 03/08/18.
//  Copyright © 2018 Ashish Kumar singh. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

final class ServiceHelper {
   
    //staging
    
    //production
    let baseURL =  "https://deskbill.in/dhobi/api/"
    
    // Specifying the Headers we need
    class var sharedInstance: ServiceHelper {
        
        struct Static {
            static let instance = ServiceHelper()
        }
        return Static.instance
    }
    
    //Create Post and send request
    func createPostRequest(isShowHud: Bool, params: [String : AnyObject]!,apiName : String, completion: @escaping (_ response: AnyObject?, _ error: NSError?) -> Void)
    {
        
        if !APPDELEGATE.checkReachablility() {
            completion(nil,NSError.init(domain: "Please check your internet connection!", code: 000, userInfo: nil))
            return
        }
        if isShowHud {
            showHud()
        }
        
        let url = self.baseURL + apiName
        let parameterDict = params as NSDictionary
        

        var headers = HTTPHeaders()
        
        let token = "\(UserDefaults.standard.value(forKey: kAccessToken) ?? "")"
        if token.count != 0{
            headers = ["Content-Type" : "application/json", "Authorization" : "Bearer \(token)"]
        }else{
            headers = ["Accept" : "application/json"]
        }
        logInfo(message: "\n\n Token  >>>>>>\(headers)")
        logInfo(message: "\n\n Request URL  >>>>>>\(url)")
        logInfo(message: "\n\n Request Parameters >>>>>>\n\(parameterDict)")
        
        Alamofire.request(URL.init(string: url)!, method: HTTPMethod.post, parameters: parameterDict as? Parameters, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(_):
                logInfo(message: "\nsuccess:\n Response From Server >>>>>>\n\(response)")
                hideHud()

                if let dict = response.result.value as? Dictionary<String,AnyObject> {
                    if let statusCode = dict.validatedValue("response_code", expected: "" as AnyObject) as? String{
                        if statusCode == "400" || statusCode == "401"{
                            self.gotoRootViewController()
                        }else {
                            completion(response.result.value as AnyObject?, nil)
                        }
                    }else {
                        completion(response.result.value as AnyObject?, nil)
                    }
                }else {
                    completion(response.result.value as AnyObject?, nil)
                }

            case .failure(_):
                logInfo(message: "\nfailure:\n failure Response From Server >>>>>>\n\(String(describing: response.result.error))")
                hideHud()
                completion(nil, response.result.error as NSError?)
            }
        }
    }
    
    func createPostRequestUnreloadForm(isShowHud: Bool, params: [String : AnyObject]!,apiName : String, completion: @escaping (_ response: AnyObject?, _ error: NSError?) -> Void)
    {
        
        if !APPDELEGATE.checkReachablility() {
            completion(nil,NSError.init(domain: "Please check your internet connection!", code: 000, userInfo: nil))
            return
        }
        if isShowHud {
            showHud()
        }
        
        let url = self.baseURL + apiName
        let parameterDict = params as NSDictionary
        
        
        var headers = HTTPHeaders()
        
        
        let token = "\(UserDefaults.standard.value(forKey: kAccessToken) ?? "")"
        if token.count != 0{
            headers = ["Content-Type" : "application/json", "Authorization" : "Bearer \(token)"]
        }else{
            headers = ["Accept" : "application/json"]
        }
        
        logInfo(message: "\n\n Token  >>>>>>\(headers)")
        logInfo(message: "\n\n Request URL  >>>>>>\(url)")
        logInfo(message: "\n\n Request Parameters >>>>>>\n\(parameterDict)")
        
        let postData = NSMutableData()
        
        for (key,value) in params {
            if postData.length == 0 {
                postData.append("\(key)=\(value)".data(using: String.Encoding.utf8)!)
            }else {
                postData.append("&\(key)=\(value)".data(using: String.Encoding.utf8)!)
            }
        }
        
        print(url)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        
       
        
        request.httpBody = postData as Data
        
        Alamofire.request(request).responseJSON { response in
            if response.response != nil {
                if let json = response.result.value {
                    logInfo(message: "\nsuccess:\n Response From Server >>>>>>\n\(response)")
                    hideHud()
                    
                    if let dict = response.result.value as? Dictionary<String,AnyObject> {
                        if let statusCode = dict.validatedValue("response_code", expected: "" as AnyObject) as? String{
                            if statusCode == "400" || statusCode == "401"{
                                self.gotoRootViewController()
                            }else {
                                completion(response.result.value as AnyObject?, nil)
                            }
                        }else {
                            completion(response.result.value as AnyObject?, nil)
                        }
                    }else {
                        completion(response.result.value as AnyObject?, nil)
                    }
                }else {
                    logInfo(message: "\nfailure:\n failure Response From Server >>>>>>\n\(String(describing: response.result.error))")
                    hideHud()
                    completion(nil, response.result.error as NSError?)
                }
            }else {
                logInfo(message: "\nfailure:\n failure Response From Server >>>>>>\n\(String(describing: response.result.error))")
                hideHud()
                completion(nil, response.result.error as NSError?)
            }
        }
        
    }
    
    func createDeleteRequest(isShowHud: Bool, params: [String : AnyObject]!,apiName : String, completion: @escaping (_ response: AnyObject?, _ error: NSError?) -> Void)
    {
        
        if !APPDELEGATE.checkReachablility() {
            completion(nil,NSError.init(domain: "Please check your internet connection!", code: 000, userInfo: nil))
            return
        }
        if isShowHud {
            showHud()
        }
        
        let url = self.baseURL + apiName
        let parameterDict = params as NSDictionary
        
        
        var headers = HTTPHeaders()
        
        
        let token = "\(UserDefaults.standard.value(forKey: kAccessToken) ?? "")"
        if token.count != 0{
            headers = ["Content-Type" : "application/json", "Authorization" : "Bearer \(token)"]
        }else{
            headers = ["Accept" : "application/json"]
        }
        
        logInfo(message: "\n\n Token  >>>>>>\(headers)")
        logInfo(message: "\n\n Request URL  >>>>>>\(url)")
        logInfo(message: "\n\n Request Parameters >>>>>>\n\(parameterDict)")
        Alamofire.request(URL.init(string: url)!, method: HTTPMethod.delete, parameters: parameterDict as? Parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            hideHud()
            switch response.result {
            case .success(_):
                logInfo(message: "\nsuccess:\n Response From Server >>>>>>\n\(response)")
                
                if let dict = response.result.value as? Dictionary<String,AnyObject> {
                    if let statusCode = dict.validatedValue("response_code", expected: "" as AnyObject) as? String{
                        if statusCode == "400" || statusCode == "401"{
                            self.gotoRootViewController()
                        }else {
                            completion(response.result.value as AnyObject?, nil)
                        }
                    }else {
                        completion(response.result.value as AnyObject?, nil)
                    }
                }else {
                    completion(response.result.value as AnyObject?, nil)
                }
            case .failure(_):
                logInfo(message: "\nfailure:\n failure Response From Server >>>>>>\n\(String(describing: response.result.error))")
                completion(nil, response.result.error as NSError?)
            }
        }
    }
    
    //Create Put and send request
    func createPutRequest(isShowHud: Bool, params: [String : AnyObject]!,apiName : String, completion: @escaping (_ response: AnyObject?, _ error: NSError?) -> Void){
        
        if !APPDELEGATE.checkReachablility() {
            completion(nil,NSError.init(domain: "Please check your internet connection!", code: 000, userInfo: nil))
            return
        }
        if isShowHud {
            showHud()
        }
        
        let url = self.baseURL + apiName
        let parameterDict = params as NSDictionary
        
        
        var headers = HTTPHeaders()
        
        
        let token = "\(UserDefaults.standard.value(forKey: kAccessToken) ?? "")"
        if token.count != 0{
            headers = ["Content-Type" : "application/json", "Authorization" : "Bearer \(token)"]
        }else{
            headers = ["Accept" : "application/json"]
        }
        
        logInfo(message: "\n\n Token  >>>>>>\(headers)")
        logInfo(message: "\n\n Request URL  >>>>>>\(url)")
        logInfo(message: "\n\n Request Parameters >>>>>>\n\(parameterDict)")
        Alamofire.request(URL.init(string: url)!, method: HTTPMethod.put, parameters: parameterDict as? Parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            hideHud()

            switch response.result {
            case .success(_):
                logInfo(message: "\nsuccess:\n Response From Server >>>>>>\n\(response)")
               
                
                if let dict = response.result.value as? Dictionary<String,AnyObject> {
                    if let statusCode = dict.validatedValue("response_code", expected: "" as AnyObject) as? String{
                        if statusCode == "400" || statusCode == "401"{
                            self.gotoRootViewController()
                        }else {
                            completion(response.result.value as AnyObject?, nil)
                        }
                    }else {
                        completion(response.result.value as AnyObject?, nil)
                    }
                }else {
                    completion(response.result.value as AnyObject?, nil)
                }
                
            case .failure(_):
                logInfo(message: "\nfailure:\n failure Response From Server >>>>>>\n\(String(describing: response.result.error))")
                completion(nil, response.result.error as NSError?)
            }
        }
    }
    
    //Create Get and send request
    func createGetRequest(isShowHud: Bool, params: [String : AnyObject]!,apiName : String, completion: @escaping (_ response: AnyObject?, _ error: NSError?) -> Void) {
        
        if !APPDELEGATE.checkReachablility() {
            completion(nil,NSError.init(domain: "Please check your internet connection!", code: 000, userInfo: nil))
            return
        }
        if isShowHud {
            showHud()
        }
        let url = self.baseURL + apiName
       
        
     
        let parameterDict = params as Dictionary
        var headers = HTTPHeaders()
       
        let token = "\(UserDefaults.standard.value(forKey: kAccessToken) ?? "")"
        if token.count != 0{
            headers = ["Content-Type" : "application/json", "Authorization" : "Bearer \(token)"]
        }else{
            headers = ["Accept" : "application/json"]
        }
        
        logInfo(message: "\n\n Token  >>>>>>\(headers)")
        logInfo(message: "\n\n Request URL  >>>>>>\(url)")
        logInfo(message: "\n\n Request Parameters >>>>>>\n\(parameterDict)")
        
        Alamofire.request(URL.init(string: url)!, method: HTTPMethod.get, parameters: parameterDict, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            hideHud()

            switch response.result {
            case .success(_):
                logInfo(message: "\nsuccess:\n Response From Server >>>>>>\n\(response)")
                
                if let dict = response.result.value as? Dictionary<String,AnyObject> {
                    if let statusCode = dict.validatedValue("response_code", expected: "" as AnyObject) as? String{
                        if statusCode == "400" || statusCode == "401"{
                            self.gotoRootViewController()
                        }else {
                            completion(response.result.value as AnyObject?, nil)
                        }
                    }else {
                        completion(response.result.value as AnyObject?, nil)
                    }
                }else {
                    completion(response.result.value as AnyObject?, nil)
                }
                
               
            case .failure(_):
                logInfo(message: "\nfailure:\n failure Response From Server >>>>>>\n\(String(describing: response.result.error))")
                completion(nil, response.result.error as NSError?)
            }
        }
    }
    
    
    func createRequestToUploadDataWithString(additionalParams : Dictionary<String,Any>,dataContent : Data?,strName : String,strFileName : String,strType : String ,apiName : String,completion: @escaping (_ response: AnyObject?, _ error: NSError?) -> Void) {
        if !APPDELEGATE.checkReachablility() {
            completion(nil,NSError.init(domain: "Please check your internet connection!", code: 000, userInfo: nil))
            return
        }
        showHud()
        let url = self.baseURL + apiName
        
        var headers = HTTPHeaders()
        let token = "\(UserDefaults.standard.value(forKey: kAccessToken) ?? "")"
        if token.count != 0{
            headers = ["Content-Type" : "application/json", "Authorization" : "Bearer \(token)"]
        }else{
            headers = ["Accept" : "application/json"]
        }
        
        logInfo(message: "\n\n Token  >>>>>>\(headers)")
        logInfo(message: "\n\n Request URL  >>>>>>\(url)")
        logInfo(message: "\n\n Parameter >>>> \(additionalParams)")
        let URL = try! URLRequest(url: url, method: .post, headers: headers)
        
        Alamofire.upload(multipartFormData: { (multipartData) in
            for (key,value) in additionalParams {
                multipartData.append("\(value)".data(using: .utf8)!, withName: key)
            }
            if dataContent != nil {
                multipartData.append(dataContent!, withName:strName, fileName: strFileName, mimeType: strType)
            }
        }, with: URL) { (result) in
            switch result {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    hideHud()
                    completion(response.result.value as AnyObject?, nil)
                }
                break
            case .failure(let encodingError):
                hideHud()

                completion(nil, encodingError as NSError?)
                break
            }
        }
    }
    
    
    
    func gotoRootViewController() {
//        UserDefaults.standard.setValue("", forKey: kAccessToken)
//        UserDefaults.standard.synchronize()
//        APPDELEGATE.privateSideMenuController = nil
//        let routeVC = authStoryboard.instantiateViewController(withIdentifier: "BALoginViewController") as! BALoginViewController
//        APPDELEGATE.navigationController = UINavigationController.init(rootViewController:routeVC)
//        APPDELEGATE.navigationController.setNavigationBarHidden(true, animated: false)
//        APPDELEGATE.window?.rootViewController = APPDELEGATE.navigationController
    }
}
