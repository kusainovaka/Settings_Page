//
//  SettingsDeleteAccountViewController.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 13.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsDeleteAccountViewController: UIViewController {
  lazy var headerView = CustomNavigationBarView(title: "DELETE ACCOUNT", rightButtonType: .nextButton)
  var presenter: SettingsDeleteAccountViewOutput?
  lazy var changeNumberView = SettingsDeleteAccountView()

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
    view.addSubview(changeNumberView)
    [changeNumberView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
     changeNumberView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
     changeNumberView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
     changeNumberView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ].forEach { $0.isActive = true }
  }
    
  @objc func doneAction() {
    presenter?.didSelectDoneButton()
  }

  @objc func closeAction() {
    presenter?.didSelectCloseButton()
  }
}

extension SettingsDeleteAccountViewController: SettingsDeleteAccountViewInput {
  func doSomething() {
    //
  }

  func showLoading() {
    //
  }
}
