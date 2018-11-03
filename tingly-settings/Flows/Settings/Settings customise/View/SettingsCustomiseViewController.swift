//
//  SettingsCustomiseViewController.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 01.10.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsCustomiseViewController: UIViewController {
  
  private lazy var collectionView: UICollectionView = {
    let collectionViewFlowLayout = UICollectionViewFlowLayout()
    collectionViewFlowLayout.scrollDirection = .vertical
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()

  private var settingsDataSource: SettingsCustomiseDataSource?
  var presenter: SettingsCustomiseViewOutput?


  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    settingsDataSource = SettingsCustomiseDataSource(collectionView: collectionView)
    title = "CUSTOMISE"
    layoutViews()
    presenter?.viewDidLoad()
  }

  private func layoutViews() {
    view.addSubview(collectionView)
    [ collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ].forEach { $0.isActive = true }
  }
}

extension SettingsCustomiseViewController: SettingsCustomiseViewInput {
  func doSomething() {
    //
  }

  func showLoading() {
    //
  }
}
