//
//  SettingsInfoViewController.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 28.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsInfoViewController: UIViewController {
    
  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .grouped)
    tableView.separatorStyle = .none
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  var presenter: SettingsInfoViewOutput?

  private lazy var tableDirector: TableViewDirector = {
    let tableDirector = TableViewDirector(tableView: tableView, sections: [])
    return tableDirector
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    title = "INFO"
    layoutViews()
    presenter?.viewDidLoad()
  }
    
 private func layoutViews() {
   view.addSubview(tableView)
    [ tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ].forEach { $0.isActive = true }
  }
}

extension SettingsInfoViewController: SettingsInfoViewInput {
  
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

