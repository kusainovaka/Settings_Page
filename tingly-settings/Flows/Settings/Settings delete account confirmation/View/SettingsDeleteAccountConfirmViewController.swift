//
//  SettingsDeleteAccountConfirmViewController.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 15.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsDeleteAccountConfirmViewController: UIViewController {
  lazy var headerView = CustomNavigationBarView(title: "DELETE ACCOUNT", rightButtonType: .doneButton)
  var presenter: SettingsDeleteAccountConfirmViewOutput?
  lazy var deleteAccountView = SettingsDeleteAccountConfirmView()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    super.viewDidLoad()
    layoutViews()
  }

  private func layoutViews() {
    view.addSubview(headerView)
    [ headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ].forEach { $0.isActive = true }
  
    headerView.leftButton.action = #selector(closeAction)
    headerView.rightButton.action = #selector(doneAction)
    
    view.addSubview(deleteAccountView)
    [deleteAccountView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
     deleteAccountView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
     deleteAccountView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
     deleteAccountView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ].forEach { $0.isActive = true }
  }
    
  @objc func doneAction() {
    presenter?.didSelectDoneButton()
  }

  @objc func closeAction() {
    presenter?.didSelectCloseButton()
  }
}

extension SettingsDeleteAccountConfirmViewController: SettingsDeleteAccountConfirmViewInput {
  func doSomething() {
    //
  }

  func showLoading() {
    //
  }
}
