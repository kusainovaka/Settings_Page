//
//  IntExtension.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 28.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

extension Int {
  static func format(bytes: Double) -> String {
    guard bytes > 0 else {
        return "Zero KB"
    }
    
    let suffixes = ["bytes", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"]
    let k: Double = 1000
    let i = floor(log(bytes) / log(k))
    
    let numberFormatter = NumberFormatter()
    numberFormatter.maximumFractionDigits = i < 3 ? 0 : 1
    numberFormatter.numberStyle = .decimal
    
    let numberString = numberFormatter.string(from: NSNumber(value: bytes / pow(k, i))) ?? "Unknown"
    let suffix = suffixes[Int(i)]
    return "\(numberString) \(suffix)"
  }
}

