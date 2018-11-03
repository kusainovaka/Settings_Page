//
//  SettingsMenuViewInput.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 23.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

protocol SettingsMenuViewInput: class {
  func setSections(_ sections: [TableViewSection])
  func doSomething()
  func showLoading()

}
