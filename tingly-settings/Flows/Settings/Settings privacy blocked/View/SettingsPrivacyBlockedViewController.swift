//
//  SettingsPrivacyBlockedViewController.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 30.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsPrivacyBlockedViewController: UIViewController {

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

  var presenter: SettingsPrivacyBlockedViewOutput?

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    title = "BLOCKED"
    layoutViews()
    presenter?.viewDidLoad()
    editBlockedButtonItem()
  }

  private func layoutViews() {
    view.addSubview(tableView)
    [ tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ].forEach { $0.isActive = true }
  }
    
  private func editBlockedButtonItem() {
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "edit"), style: .done, target: self, action: #selector(editBlockedAction))
  }
    
  @objc private func editBlockedAction() {
    
  }
    
}

extension SettingsPrivacyBlockedViewController: SettingsPrivacyBlockedViewInput {

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


