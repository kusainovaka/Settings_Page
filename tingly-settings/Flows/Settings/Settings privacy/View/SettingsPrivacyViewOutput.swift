//
//  SettingsPrivacyViewOutput.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 18.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

protocol SettingsPrivacyViewOutput {

  func viewDidLoad()
  func didSelectLastSeen()
  func didSelectProfilePhoto()
  func didSelectAbout()
  func didSelectStatus()
  func didSelectBlocked()
}
