//
//  SettingsProfileAboutViewController.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 09.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsProfileAboutViewController: UIViewController {

  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .grouped)
    tableView.separatorStyle = .none
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  private lazy var profileFooterView = SettingsDeleteFooterView()
  var isEdit: Bool?

  private lazy var tableDirector: TableViewDirector = {
    let tableDirector = TableViewDirector(tableView: tableView, sections: [])
    return tableDirector
  }()

  var presenter: SettingsProfileAboutViewOutput?

  override func viewDidLoad() {
    view.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    title = "ABOUT"
    super.viewDidLoad()
    layoutViews()
    presenter?.viewDidLoad()
    editProfileItem()
  }

  private func layoutViews() {
    view.addSubview(tableView)
    [ tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ].forEach { $0.isActive = true }
    
    view.addSubview(profileFooterView)
    profileFooterView.isHidden = true
    [ profileFooterView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      profileFooterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      profileFooterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      profileFooterView.heightAnchor.constraint(equalToConstant: 48)
        ].forEach { $0.isActive = true }
  }
    
  private func editProfileItem() {
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "edit"), style: .done, target: self, action: #selector(editProfileAction))
  }
    
  @objc func editProfileAction() {
    profileFooterView.isHidden = false
    title = "TAP TO EDIT"
    presenter?.setEditing()
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "done-white"), style: .done, target: self, action: #selector(saveEditingAction))
  }
    
  @objc func saveEditingAction() {
    profileFooterView.isHidden = true
    title = "ABOUT"
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "edit"), style: .done, target: self, action: #selector(editProfileAction))
  }
}

extension SettingsProfileAboutViewController: SettingsProfileAboutViewInput {
  func setSections(_ sections: [TableViewSection]) {
    tableDirector.update(withSections: sections)
  }

  func doSomething() {
  }
    
  func showLoading() {
    //
  }
    
  func setEditing() {
  }
}
