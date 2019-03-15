//
//  ProfileVC.swift
//  ChatAppReal
//
//  Created by formathead on 08/03/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var userIMG: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userMail: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    
    @IBAction func pressedClose(_ sender: Any) {
           self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pressedLogout(_ sender: Any) {
    }
    
    
    func setupView() {
        
        userIMG.image = UIImage(named: UserDataService.instance.avatarName)
        userName.text = UserDataService.instance.name
        userMail.text = UserDataService.instance.email
    }
    
}//End Of The Class

