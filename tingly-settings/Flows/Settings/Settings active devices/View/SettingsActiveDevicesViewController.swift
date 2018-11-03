//
//  SettingsActiveDevicesViewController.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 14.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsActiveDevicesViewController: UIViewController {
  var presenter: SettingsActiveDevicesViewOutput?
    
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
    
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    title = "ACTIVE DEVICES"
    layoutViews()
    presenter?.viewDidLoad()
  }

  private func layoutViews() {
    view.addSubview(tableView)
    [ tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ].forEach { $0.isActive = true }
  }

}

extension SettingsActiveDevicesViewController: SettingsActiveDevicesViewInput {
  func setSections(_ sections: [TableViewSection]) {
        tableDirector.update(withSections: sections)
  }
    
  func doSomething() {
    //
  }

  func showLoading() {
  }
}
