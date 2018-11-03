//
//  SettingsDeleteAccountViewOutput.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 13.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

protocol SettingsDeleteAccountViewOutput: class {
  func viewDidLoad()
  func didSelectCloseButton()
  func didSelectDoneButton()
}
