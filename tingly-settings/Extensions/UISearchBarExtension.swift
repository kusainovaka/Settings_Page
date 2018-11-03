//
//  UISearchBarExtension.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 18.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

extension UISearchBar {
  var textField: UITextField? {
    let subViews = subviews.flatMap { $0.subviews }
    guard let textField = (subViews.filter { $0 is UITextField }).first as? UITextField else { return nil
    }
    return textField
  }
}
