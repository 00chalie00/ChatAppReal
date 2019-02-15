//
//  AuthService.swift
//  ChatAppReal
//
//  Created by formathead on 11/02/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import Foundation
import Alamofire


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
        
        let lowerCaseEmail = email.lowercased()
        
        let header = ["Content-Type": "application/json; charset=utf-8"]
        
        let body: [String: Any] = ["email": lowerCaseEmail, "password": password]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString
            {
                (resonse) in
                
                if resonse.result.error == nil {
                    completion(true)
                } else {
                    completion(false)
                    debugPrint(resonse.result.error as Any)
                }
                
            }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}//End Of The Class

