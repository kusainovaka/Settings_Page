//
//  SettingsMenuViewController.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 23.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsMenuViewController: UIViewController {
  
  private lazy var settingsHeaderView = SettingsMenuHeaderView()
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

  var presenter: SettingsMenuViewOutput?

  override func viewDidLoad() {
    view.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    super.viewDidLoad()
    layoutViews()
    presenter?.viewDidLoad()
  }
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.isNavigationBarHidden = true
  }

  private func layoutViews() {
    let headerViewHeight = self.navigationController!.navigationBar.frame.height
    view.addSubview(settingsHeaderView)
    [ settingsHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      settingsHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      settingsHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      settingsHeaderView.heightAnchor.constraint(equalToConstant: headerViewHeight)
    ].forEach { $0.isActive = true }

    view.addSubview(tableView)
    [ tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: settingsHeaderView.bottomAnchor, constant: 2),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ].forEach { $0.isActive = true }
  }
}

extension SettingsMenuViewController: SettingsMenuViewInput {
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
