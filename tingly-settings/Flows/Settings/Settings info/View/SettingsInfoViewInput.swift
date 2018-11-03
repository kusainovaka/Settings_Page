//
//  SettingsInfoViewInput.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 28.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

protocol SettingsInfoViewInput: class {

  func setSections(_ sections: [TableViewSection])
  func doSomething()
  
}
