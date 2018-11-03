//
//  SettingsAskQuestionViewController.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 24.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsAskQuestionViewController: UIViewController {
  var presenter: SettingsAskQuestionViewOutput?

  lazy var headerView = CustomNavigationBarView(title: "ASK A QUESTION", rightButtonType: .sendButton)
  lazy var aboutTextField = SettingsProfileAboutTextFieldView(textCount: 300, placeholderIsHidden: false, placheolderText: "Enter your question here")

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    modalPresentationStyle = .overCurrentContext
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    hideKeyboardWhenTappedAround()
    super.viewDidLoad()
    layoutViews()
  }

  func layoutViews() {
    view.addSubview(headerView)
    [ headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ].forEach { $0.isActive = true }
    
    headerView.leftButton.action = #selector(doneAction)
    headerView.rightButton.action = #selector(closeAction)

    view.addSubview(aboutTextField)
    [aboutTextField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 23),
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
    
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


extension SettingsAskQuestionViewController: SettingsAskQuestionViewInput {
  func doSomething() {
    //
  }

  func showLoading() {
    //
  }
}


