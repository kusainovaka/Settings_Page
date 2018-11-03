//
//  SettingsInfoViewOutput.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 28.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

protocol SettingsInfoViewOutput {
  
  func viewDidLoad()
  func didSelectLanguage()
  func didSelectMobileNumber()
  func didSelectActiveDevices()
  func didSelectAwayFor()
  func didSelectDeleteAccount()

}
