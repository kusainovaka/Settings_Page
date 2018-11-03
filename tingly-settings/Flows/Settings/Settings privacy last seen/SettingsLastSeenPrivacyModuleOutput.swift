//
//  SettingsLastSeenPrivacyModuleOutput.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 20.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

enum LastSeenPrivacy {
  case nobody
  case everyone
  case myContacts
}

protocol SettingsLastSeenPrivacyModuleOutput: class {
  
  func didChangeLastSeen(_ lastSeen: LastSeenPrivacy)
  
}
