//
//  StringExtension.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 09.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

extension String {
    var isBackspace: Bool {
        let char = self.cString(using: String.Encoding.utf8)!
        return strcmp(char, "\\b") == -92
    }
    
    var numbers: String {
        return String(describing: filter { String($0).rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789")) != nil })
    }
}
