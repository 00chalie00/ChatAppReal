//
//  AuthService.swift
//  ChatAppReal
//
//  Created by formathead on 11/02/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class AuthService {
    
    //Singletond을 위해 생성
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToke: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletitionHandler) {
        
        print("1")
        let lowerCaseEmail = email.lowercased()
        
//        let header = ["Content-Type": "application/json; charset=utf-8"]
        
        let body: [String: Any] = ["email": lowerCaseEmail, "password": password]
         print("2")
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEAD
            ).responseString
            {
                (response) in
                print("3")
                if response.result.error == nil {
                    completion(true)
                } else {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
                
            }
        print("4")
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletitionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let body = ["email": lowerCaseEmail, "password":password ]
        
//        let header = ["Content-Type": "application/json; chartset=utf-8"]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEAD).responseJSON {
            (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                do {
                    let json = try JSON(data: data)
                    
                    print(json)
                    
                    self.userEmail = json["user"].stringValue
                    self.authToke = json["token"].stringValue

                } catch {
                    print(error)
                }
                
                self.isLoggedIn = true
                completion(true)
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletitionHandler) {
        
        let lowerCaseemail = email.lowercased()
        
        let header = [
            "Authorization": "Bearer \(AuthService.instance.authToke)",
            "content-Type": "application/json; chartset=utf-8"
        ]
        
        let body:[String: Any] = [
            "name": name,
            "email": lowerCaseemail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers:header).responseJSON { (response) in
            
            if response.result.error == nil {
                
                guard let data = response.data else { return }
                do {
                    
                    let json = try JSON(data: data)
                    let avatarColor = json["avatarColor"].stringValue
                    let avatarName = json["avatarName"].stringValue
                    let email = json["email"].stringValue
                    let name = json["name"].stringValue
                    let id = json["_id"].stringValue
                    
                    //Do-Catch를 쓸 때 fun call은 Do Block 안에 쓴다.
                    UserDataService.instance.setUserData(color: avatarColor, avName: avatarName, email: email, name: name, avid: id)
                    
                    } catch {
                        print(error)
                }
                
                //여기다 fun call을 쓰면 fun parameter을 인지 못한다.
                completion(true)
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
}//End Of The Class

