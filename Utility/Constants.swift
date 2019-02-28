//
//  File.swift
//  ChatAppReal
//
//  Created by formathead on 17/01/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import Foundation

typealias CompletitionHandler = (_ Success: Bool) -> ()

//segue
let TO_Login = "toLogin"
let To_CreateAccount = "gotoCreateAccount"
let To_Main = "unwind"
let To_Avatar = "gotoAvatar"


//UserDefault

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//URL Constants
let BASE_URL = "https://webapi20190207.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

//HEADER

let HEAD = ["Content-Type": "application/json; chartset=utf-8"]


//Color
let formatheadPurplePlaceHolder = #colorLiteral(red: 0.7490196078, green: 0.3529411765, blue: 0.9490196078, alpha: 0.5)
 
//Notification Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUSerDataChanged")
