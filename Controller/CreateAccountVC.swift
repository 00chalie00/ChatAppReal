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
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    
    //variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
        
        if avatarName.contains("light") && bgColor == nil {
            userImg.backgroundColor = UIColor.lightGray
        }
    }

    @IBAction func gotoMainpressed(_ sender: Any) {
        
        performSegue(withIdentifier: To_Main, sender: nil)
        
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        activity.isHidden = false
        activity.startAnimating()
        
        guard let name = usernameTxt.text, usernameTxt.text != "" else {return}
        guard let email = emailTxt.text, emailTxt.text != "" else {return}
        guard let pass = passTxt.text, passTxt.text != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: pass){(success) in
            
            print("in register")
            
            if success {
                print("after if success")
                AuthService.instance.loginUser(email: email, password: pass, completion:{(success) in
                    print("ligin in")
                        if success {
                            print("login in if success")
                            AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                                if success {
                                    self.activity.isHidden = true
                                    self.activity.stopAnimating()
                                    
                                    print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                    self.performSegue(withIdentifier: To_Main, sender: nil)
                                    
                                    NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                                }
                            })

                        }
                    })
                print("after login")
            }
        }
        print("after register\(AuthService.instance.userEmail)", AuthService.instance.authToke)
        
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
     performSegue(withIdentifier: To_Avatar, sender: nil)
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
        
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColor = "[\(r), \(g), \(b), 1]"
        UIView.animate(withDuration: 0.5) {
            self.userImg.backgroundColor = self.bgColor
        }
    }
    
    
    func setupView() {
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor:formatheadPurplePlaceHolder])
        emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor:formatheadPurplePlaceHolder])
       passTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor:formatheadPurplePlaceHolder])
        
        activity.isHidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleKB))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleKB() {
        view.endEditing(true)
    }
    
    
}//End Of The Class
