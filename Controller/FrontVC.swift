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
        
        // addTarget 참고 https://pg-happy.jp/swift-addtarget.html
        menuBtn?.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
    }

}
