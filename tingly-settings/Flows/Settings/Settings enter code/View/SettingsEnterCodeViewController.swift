//
//  SettingsEnterCodeViewController.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 16.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsEnterCodeViewController: UIViewController {

  var presenter: SettingsEnterCodeViewOutput?
  lazy var headerView = CustomNavigationBarView(title: "ENTER CODE", rightButtonType: .noneButton)

  private lazy var changeNumberView = SettingsEnterCodeView()

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
    headerView.rightButton.action = #selector(closeAction)

    view.addSubview(changeNumberView)
    [changeNumberView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
     changeNumberView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
     changeNumberView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
     changeNumberView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ].forEach { $0.isActive = true }
    changeNumberView.phoneNumber.setTitle("7 968 006 28 15", for: .normal)
    changeNumberView.editButton.addTarget(self, action: #selector(editPhoneNumber), for: .touchUpInside)
  }

  @objc func closeAction() {
    presenter?.didSelectCloseButton()
  }
    
  @objc private func editPhoneNumber() {
    presenter?.didEditPhoneNumber()
  }
}

extension SettingsEnterCodeViewController: SettingsEnterCodeViewInput {
  func doSomething() {
    //
  }

  func showLoading() {
    //
  }
}
