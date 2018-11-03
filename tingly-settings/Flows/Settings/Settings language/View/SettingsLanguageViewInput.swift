//
//  SettingsLanguageViewInput.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 31.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

protocol SettingsLanguageViewInput: class {
  func setSections(_ sections: [TableViewSection])
  func doSomething()
  func showLoading()
}
