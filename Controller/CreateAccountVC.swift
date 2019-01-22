//
//  CreateAccountVC.swift
//  ChatAppReal
//
//  Created by formathead on 22/01/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func gotoMainpressed(_ sender: Any) {
        
        performSegue(withIdentifier: To_Main, sender: nil)
        
    }
    
    
    
}//End Of The Class

