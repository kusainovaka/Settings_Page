//
//  SettingsCustomiseDataSource.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 01.10.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsCustomiseDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource,
                                   UICollectionViewDelegateFlowLayout {
  
  private weak var collectionView: UICollectionView?
  private var wallpapersArray: [String] = ["first-wallpaper","second-wallpaper","third-wallpaper","fourth-wallpaper","second-wallpaper"]
  init(collectionView: UICollectionView) {
    self.collectionView = collectionView
    super.init()
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.showsVerticalScrollIndicator = false
    collectionView.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    collectionView.delegate = self
    collectionView.dataSource = self
    self.collectionView?.register(SettingsCustomiseCell.self, forCellWithReuseIdentifier: SettingsCustomiseCell.nameOfClass)
    self.collectionView?.register(SettingsHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: SettingsHeaderView.nameOfClass)
  }
    
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: SettingsHeaderView.nameOfClass, for: indexPath) as! SettingsHeaderView
    headerView.titleLabel.text = "CHAT WALLPAPER"
    return headerView
  }
    
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: 52)
  }

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return wallpapersArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsCustomiseCell.nameOfClass, for: indexPath) as! SettingsCustomiseCell
    cell.backgroundImage.image = UIImage(named: wallpapersArray[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     let collectionViewWidth = collectionView.bounds.size.width / 2
    return CGSize(width: collectionViewWidth - 14, height: collectionViewWidth * 1.4)
  }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(6, 6, 6, 6)
    }

}
