//
//  SettingsChangeNumberViewController.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 15.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsChangeNumberViewController: UIViewController {
  lazy var headerView = CustomNavigationBarView(title: "CHANGE NUMBER", rightButtonType: .doneButton)
  var presenter: SettingsChangeNumberViewOutput?
  private lazy var changeNumberView = SettingsChangeNumberView()

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
    
    headerView.rightButton.action = #selector(didFillingGap)
    headerView.leftButton.action = #selector(closeAction)
    
    view.addSubview(changeNumberView)
    [changeNumberView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
     changeNumberView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
     changeNumberView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
     changeNumberView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ].forEach { $0.isActive = true }
    changeNumberView.newNumberTexField.delegate = self
  }
    
  @objc func doneAction() {
    presenter?.didEnterCode()
  }

  @objc func closeAction() {
    presenter?.didSelectCloseButton()
  }
}

extension SettingsChangeNumberViewController: SettingsChangeNumberViewInput {
  func doSomething() {
    //
  }

  func showLoading() {
      //
  }
}

extension SettingsChangeNumberViewController: SettingsChangeNumberDelegate {
    @objc func didFillingGap(_ settingsChangeView: EnterMobileNumberTextField, fill: Bool) {
    guard fill else { return }
    headerView.rightButton.target = nil
    headerView.rightButton.action = #selector(doneAction)
    }
}
