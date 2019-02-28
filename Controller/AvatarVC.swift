//
//  AvatarVC.swift
//  ChatAppReal
//
//  Created by formathead on 21/02/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class AvatarVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collecView: UICollectionView!
    @IBOutlet weak var segumentControl: UISegmentedControl!
    
    //Variable
    var avatarType = AvatarType.dark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collecView.delegate = self
        collecView.dataSource = self

    }

    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func toggleSegment(_ sender: Any) {
        
        if segumentControl.selectedSegmentIndex == 0 {
            avatarType = .dark
        } else {
            avatarType = .light
        }
        collecView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collecView.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath) as? AvatarCell {
            cell.configureCell(avatarType: avatarType, index: indexPath.item)
            return cell
        }
        return AvatarCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if avatarType == .dark {
            UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
        } else {
            UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        
        dismiss(animated: true, completion: nil)
    }
    //Cell Size 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var numofColums: CGFloat = 3
        if UIScreen.main.bounds.width > 320 {
            numofColums = 4
        }

        let spaceBetweenCells : CGFloat = 10
        let padding: CGFloat = 40
        let cellDimension = ((collectionView.bounds.width - padding) - (numofColums - 1) * spaceBetweenCells) / numofColums

        return CGSize(width: cellDimension, height: cellDimension)
        
    }
    
}//End Of The Class
