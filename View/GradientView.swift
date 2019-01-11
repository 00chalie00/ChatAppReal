//
//  GradientView.swift
//  ChatAppReal
//
//  Created by formathead on 11/01/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
     // https://zeddios.tistory.com/270
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.4436434805, green: 0.5137578845, blue: 0.8936015368, alpha: 1) {
        
        didSet {
            
            //https://zeddios.tistory.com/359
            self.setNeedsLayout()
            
        }
    }
    
    @IBInspectable var bottonColor: UIColor = #colorLiteral(red: 0.2274509804, green: 0.831372549, blue: 0.8431372549, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    
}
