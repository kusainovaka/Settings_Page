//
//  UITextFieldExtension.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 09.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

extension UITextField {
  func setLeftPaddingPoints(_ amount:CGFloat){
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
    self.leftView = paddingView
    self.leftViewMode = .always
  }
  func setRightPaddingPoints(_ amount:CGFloat) {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
    self.rightView = paddingView
    self.rightViewMode = .always
  }
}
