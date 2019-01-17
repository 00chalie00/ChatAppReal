//
//  RearVC.swift
//  ChatAppReal
//
//  Created by formathead on 10/01/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class RearVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        
        
    }

    
    @IBAction func loginPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_Login, sender: nil)
    }
    
}// End Of The Class

