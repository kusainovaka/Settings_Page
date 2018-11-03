//
//  SettingsLastSeenViewInput.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 18.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

protocol SettingsLastSeenViewInput: class {
  func setSections(_ sections: [TableViewSection])
  func doSomething()
  func showLoading()
}
