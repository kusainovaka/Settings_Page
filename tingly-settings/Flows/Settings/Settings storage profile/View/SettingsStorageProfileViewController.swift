//
//  SettingsStorageProfileViewController.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 26.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsStorageProfileViewController: UIViewController {
    
  var presenter: SettingsStorageProfileViewOutput?
  private lazy var profileHeaderView = SettingsStorageProfileView()
  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .grouped)
    tableView.separatorStyle = .none
    tableView.isScrollEnabled = false
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()

  private lazy var tableDirector: TableViewDirector = {
    let tableDirector = TableViewDirector(tableView: tableView, sections: [])
    return tableDirector
  }()
  private lazy var profileFooterView = SettingsDeleteFooterView()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    title = "MOLLY GREEN"
    layoutViews()
    presenter?.viewDidLoad()
    profileHeaderView.profileData(avatar: #imageLiteral(resourceName: "oval"), size: Int.format(bytes: 41324), messages: "93 045 messages")
  }
  
  private func layoutViews() {
    view.addSubview(profileHeaderView)
    [ profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      profileHeaderView.heightAnchor.constraint(equalToConstant: 91)
    ].forEach { $0.isActive = true }
    
    view.addSubview(profileFooterView)
    profileFooterView.isHidden = true
    [ profileFooterView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      profileFooterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      profileFooterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      profileFooterView.heightAnchor.constraint(equalToConstant: 48)
        ].forEach { $0.isActive = true }
    
    view.addSubview(tableView)
    [ tableView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: profileFooterView.topAnchor)
        ].forEach { $0.isActive = true }
    }
    
    func didManage() {
      profileFooterView.isHidden = false
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close"), style: .done, target: self, action: #selector(closeAction))
    }
    
    @objc func closeAction() {
        presenter?.didCloseAction()
        profileFooterView.isHidden = true
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        self.navigationItem.rightBarButtonItem?.tintColor = .clear
    }
}

extension SettingsStorageProfileViewController: SettingsStorageProfileViewInput {
  func setSections(_ sections: [TableViewSection]) {
    tableDirector.update(withSections: sections)
  }

  func doSomething() {
    profileFooterView.isHidden = false
    self.navigationItem.backBarButtonItem?.isEnabled = false
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close"), style: .done, target: self, action: #selector(closeAction))
  }

  func showLoading() {
    //
  }
}
