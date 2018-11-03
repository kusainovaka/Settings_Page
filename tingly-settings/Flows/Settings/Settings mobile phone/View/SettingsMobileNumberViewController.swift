//
//  SettingsMobileNumberViewController.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 01.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsMobileNumberViewController: UIViewController {
    
  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .grouped)
    tableView.separatorStyle = .none
    tableView.isScrollEnabled = false
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()

  var presenter: SettingsMobileNumberViewOutput?
  private lazy var tableDirector: TableViewDirector = {
    let tableDirector = TableViewDirector(tableView: tableView, sections: [])
    return tableDirector
  }()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    title = "MOBILE NUMBER"
    layoutViews()
    presenter?.viewDidLoad()
  }

  func layoutViews(){
    view.addSubview(tableView)
    [ tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ].forEach { $0.isActive = true}
  }
}

extension SettingsMobileNumberViewController: SettingsMobileNumberViewInput {
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
