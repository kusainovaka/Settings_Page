//
//  SettingsSoundViewController.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 11.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsSoundViewController: UIViewController {
  lazy var headerView = CustomNavigationBarView(title: "SOUND", rightButtonType: .doneButton)
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

  var presenter: SettingsSoundViewOutput?

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    layoutViews()
    presenter?.viewDidLoad()
  }
    
  private func layoutViews() {
    view.addSubview(headerView)
    [ headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
      headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ].forEach { $0.isActive = true }
    headerView.leftButton.action = #selector(doneAction)
    headerView.rightButton.action = #selector(closeAction)

    view.addSubview(tableView)
    [ tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ].forEach { $0.isActive = true }
  }
    
  @objc func doneAction() {
    presenter?.didSelectDoneButton()
  }

  @objc func closeAction() {
    presenter?.didSelectCloseButton()
  }
}

extension SettingsSoundViewController: SettingsSoundViewInput {
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
