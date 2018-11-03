//
//  NSObjectExtensions.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 23.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

extension NSObject {
  
  class var nameOfClass: String {
    return NSStringFromClass(self).components(separatedBy: ".").last!
  }
}
