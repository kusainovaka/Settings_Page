//
//  SettingsEditProfileViewController.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 09.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsEditProfileViewController: UIViewController {
    
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

  var presenter: SettingsEditProfileViewOutput?

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    title = "EDIT PROFILE"
    layoutViews()
    presenter?.viewDidLoad()
    hideKeyboardWhenTappedAround()
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

extension SettingsEditProfileViewController: SettingsEditProfileViewInput {

  func setSections(_ sections: [TableViewSection]) {
    tableDirector.update(withSections: sections)
  }

  func doSomething() {
    //
  }

  func showLoading() {
    //
  }
    
  func editProfileAction() {
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "done-white"), style: .done, target: self, action: #selector(doneAction))
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close"), style: .done, target: self, action: #selector(cancelAction))
  }
    
  @objc func doneAction() {
    endEditing()
  }
    
  @objc func cancelAction() {
    endEditing()
  }
}
