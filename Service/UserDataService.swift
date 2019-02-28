//
//  UserDataService.swift
//  ChatAppReal
//
//  Created by formathead on 18/02/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var name = ""
    public private(set) var email = ""
    public private(set) var avatarName = ""
    public private(set) var avatarColor = ""
    
    func setUserData(color: String, avName: String, email: String, name: String, avid: String) {
        
        self.avatarColor = color
        self.avatarName = avName
        self.email = email
        self.name = name
        self.id = avid
        
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
        
    }
    
    
    func rerutnUIColor(components: String) -> UIColor {
        
        //서버에 등록된 색정보(rgba)에서 특정 문자를 스캔
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r, g, b, a : NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
        guard let rUnwrapped = r else {return defaultColor}
        guard let gUnwrapped = g else {return defaultColor}
        guard let bUnwrapped = b else {return defaultColor}
        guard let aUnwrapped = a else {return defaultColor}
        
        let rfloat = CGFloat(rUnwrapped.doubleValue)
        let gfloat = CGFloat(gUnwrapped.doubleValue)
        let bfloat = CGFloat(bUnwrapped.doubleValue)
        let afloat = CGFloat(aUnwrapped.doubleValue)
        
        let newColor = UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
        
        return newColor
        
    }
    
    
}// End Of The Class

