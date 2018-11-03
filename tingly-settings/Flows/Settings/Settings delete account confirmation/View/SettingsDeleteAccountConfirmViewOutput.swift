//
//  SettingsDeleteAccountConfirmViewOutput.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 15.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

protocol SettingsDeleteAccountConfirmViewOutput: class {
  func viewDidLoad()
  func didSelectDoneButton()
  func didSelectCloseButton()
}
