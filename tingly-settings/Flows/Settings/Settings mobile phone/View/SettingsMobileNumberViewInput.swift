//
//  SettingsMobileNumberViewInput.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 01.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

protocol SettingsMobileNumberViewInput: class {
  func setSections(_ sections: [TableViewSection])
  func doSomething()
  func showLoading()
    
}
