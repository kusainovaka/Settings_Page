//
//  SettingsProfilePhotoModuleOutput.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 20.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

protocol SettingsProfilePhotoModuleOutput: class {
    
  func didChangeProfilePhoto(_ lastSeen: LastSeenPrivacy)
    
}
