//
//  SettingsMenuViewOutput.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 23.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

protocol SettingsMenuViewOutput {
  
  func viewDidLoad()
  func didSelectAccount()
  func didSelectMainSettings()
  func didSelectAvatar()

}
