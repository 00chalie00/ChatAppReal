//
//  FrontVC.swift
//  ChatAppReal
//
//  Created by formathead on 10/01/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class FrontVC: UIViewController {

    
    //Outlet
    
    @IBOutlet weak var menuBtn: UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuBtn?.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        
    }

}
