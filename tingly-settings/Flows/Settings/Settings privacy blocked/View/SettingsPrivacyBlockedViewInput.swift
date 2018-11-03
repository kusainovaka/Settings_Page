//
//  SettingsPrivacyBlockedViewInput.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 30.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

protocol SettingsPrivacyBlockedViewInput: class {
  func setSections(_ sections: [TableViewSection])
  func doSomething()
  func showLoading()
}
