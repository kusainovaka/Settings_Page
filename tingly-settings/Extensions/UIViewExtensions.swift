//
//  UIViewExtensions.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 23.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

extension UIView {

  private class func viewInNibNamed<T: UIView>(_ nibNamed: String) -> T {
    //swiftlint:disable:next force_cast
    return Bundle.main.loadNibNamed(nibNamed, owner: nil, options: nil)!.first as! T
  }

  class func nib() -> Self {
    return viewInNibNamed(nameOfClass)
  }
  
  static func getIdentifier() -> String {
    return String.init(describing: self) + "Identifier"
  }

  static func getName() -> String {
    return String.init(describing: self)
  }

  class func nib(_ frame: CGRect) -> Self {
    let view = nib()
    view.frame = frame
    view.layoutIfNeeded()
    return view
  }

  func roundCorners(corners:UIRectCorner, radius: CGFloat) {
    DispatchQueue.main.async {
      let path = UIBezierPath(roundedRect: self.bounds,
                              byRoundingCorners: corners,
                              cornerRadii: CGSize(width: radius, height: radius))
      let maskLayer = CAShapeLayer()
      maskLayer.frame = self.bounds
      maskLayer.path = path.cgPath
      self.layer.mask = maskLayer
    }
  }
}
