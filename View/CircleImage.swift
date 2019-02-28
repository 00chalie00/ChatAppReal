//
//  CircleImage.swift
//  ChatAppReal
//
//  Created by formathead on 26/02/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {
    
    
    override func awakeFromNib() {
        showSetup()
    }
    
    
    func showSetup() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        showSetup()
    }
    
    
}
