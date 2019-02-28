//
//  AvatarCell.swift
//  ChatAppReal
//
//  Created by formathead on 21/02/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

enum AvatarType {
    case dark
    case light
}


@IBDesignable
class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    func configureCell(avatarType: AvatarType, index: Int) {
        
        if avatarType == AvatarType.dark {
            avatarImg.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        } else {
            avatarImg.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
        
    }
    
    
}//End Of The Class
