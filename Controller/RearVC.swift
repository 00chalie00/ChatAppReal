//
//  RearVC.swift
//  ChatAppReal
//
//  Created by formathead on 10/01/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class RearVC: UIViewController {

    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    //Outlet
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var avatarImg: CircleImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(RearVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }

    
    @IBAction func loginPressed(_ sender: Any) {
        
//        performSegue(withIdentifier: TO_Login, sender: nil)
        if AuthService.instance.isLoggedIn {
            let profileVC = ProfileVC()
            profileVC.modalPresentationStyle = .custom
            present(profileVC, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: TO_Login, sender: nil)
        }
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        
        if AuthService.instance.isLoggedIn {
            loginBtn.setTitle("\(UserDataService.instance.name)", for: .normal)
            avatarImg.image = UIImage(named: "\(UserDataService.instance.avatarName)")
            
            avatarImg.backgroundColor = UserDataService.instance.rerutnUIColor(components: UserDataService.instance.avatarColor)
            
        } else {
            loginBtn.setTitle("Login", for: .normal)
            avatarImg.image = UIImage(named: "profileDefault")
            avatarImg.backgroundColor = UIColor.clear
        }
        
    }
    
    
}// End Of The Class

