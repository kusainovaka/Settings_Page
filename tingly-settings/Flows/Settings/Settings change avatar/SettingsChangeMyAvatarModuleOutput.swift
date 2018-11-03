//
//  SettingsChangeMyAvatarModuleOutput.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 20.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation
enum MyAvatar {
    case firstProfile
    case secondProfile
    case thirdProfile
}

protocol SettingsChangeMyAvatarModuleOutput: class {
  func didChangeAvatar(select: MyAvatar)
}
