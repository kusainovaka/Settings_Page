//
//  SettingsProfileAboutViewInput.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 09.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

protocol SettingsProfileAboutViewInput: class {
  func setSections(_ sections: [TableViewSection])
  func doSomething()
  func showLoading()
  func setEditing()
}
