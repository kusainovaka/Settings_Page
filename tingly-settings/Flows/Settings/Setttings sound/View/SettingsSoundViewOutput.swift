//
//  SettingsSoundViewOutput.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 11.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

protocol SettingsSoundViewOutput {
  func viewDidLoad()
  func didSelectNone()
  func didSelectCloseButton()
  func didSelectDoneButton()
}
