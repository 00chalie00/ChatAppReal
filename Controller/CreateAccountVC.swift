//
//  CreateAccountVC.swift
//  ChatAppReal
//
//  Created by formathead on 22/01/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func gotoMainpressed(_ sender: Any) {
        
        performSegue(withIdentifier: To_Main, sender: nil)
        
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        
        guard let email = emailTxt.text, emailTxt.text != "" else {return}
        guard let pass = passTxt.text, passTxt.text != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: pass){ (success) in
            if success {
                print("registered user!")
            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
        
    }
    
    
    
    
}//End Of The Class

