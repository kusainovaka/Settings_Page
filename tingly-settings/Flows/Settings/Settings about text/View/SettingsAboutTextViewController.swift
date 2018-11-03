//
//  SettingsAboutTextViewController.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 12.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsAboutTextViewController: UIViewController {
  
  var presenter: SettingsAboutTextViewOutput?
  lazy var headerView = CustomNavigationBarView(title: "ABOUT(100)", rightButtonType: .doneButton)
  lazy var aboutTextField = SettingsProfileAboutTextFieldView(textCount: 100, placeholderIsHidden: true, placheolderText: "")
    
  var titleText: Int? {
        didSet {
            guard let textCount = titleText else {
                return
            }
            headerView.navigationItem.title = "ABOUT(\(textCount))"
        }
    }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    hideKeyboardWhenTappedAround()
    super.viewDidLoad()
    layoutViews()
    aboutTextField.aboutText(text: "You should complete this task before 12.03.2018! Because we have to be prepared till")
    let textCount = aboutTextField.aboutTextField.text.count
    let total = 100 - textCount
    headerView.navigationItem.title = "ABOUT(\(total))"
  }
    
  private func layoutViews() {
    view.addSubview(headerView)
    [ headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ].forEach { $0.isActive = true }
    
    headerView.leftButton.action = #selector(doneAction)
    headerView.rightButton.action = #selector(closeAction)
    
    view.addSubview(aboutTextField)
    aboutTextField.delegate = self
    [aboutTextField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 21),
     aboutTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
     aboutTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23),
     aboutTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250)
    ].forEach { $0.isActive = true }
  }
    
  @objc func doneAction() {
    presenter?.didSelectDoneButton()
  }
    
  @objc func closeAction() {
    presenter?.didSelectDoneButton()
  }
}

extension SettingsAboutTextViewController: ProfileAboutTextCount {
    func getTextCount(count: Int) {
        titleText = count
    }
}

extension SettingsAboutTextViewController: SettingsAboutTextViewInput {
  func doSomething() {
    //
  }

  func showLoading() {
    //
  }
}
