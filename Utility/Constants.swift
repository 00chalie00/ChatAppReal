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


//UserDefault

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//URL Constants
let BASE_URL = "https://webapi20190207.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"

