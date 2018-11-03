//
//  SettingsAvatarViewController.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 10.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsAvatarViewController: UIViewController {
  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .grouped)
    tableView.separatorStyle = .none
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()

  private lazy var tableDirector: TableViewDirector = {
    let tableDirector = TableViewDirector(tableView: tableView, sections: [])
    return tableDirector
  }()

  var presenter: SettingsAvatarViewOutput?

  override func viewDidLoad() {
    view.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    title = "MY AVATARS"
    super.viewDidLoad()
    layoutViews()
    presenter?.viewDidLoad()
    addNewAvatarButtonItem()
  }

  private func layoutViews() {
    view.addSubview(tableView)
    [ tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ].forEach { $0.isActive = true }
  }
    
  private func addNewAvatarButtonItem() {
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "newMessage"), style: .done, target: self, action: #selector(addNewAvatar))
  }

  @objc private func addNewAvatar() {
    
  }
}

extension SettingsAvatarViewController: SettingsAvatarViewInput {
  func setSections(_ sections: [TableViewSection]) {
    tableDirector.update(withSections: sections)
  }

  func doSomething() {
    //
  }
  func showLoading() {
    //
  }
}
