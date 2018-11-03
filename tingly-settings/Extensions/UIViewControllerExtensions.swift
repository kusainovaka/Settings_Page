//
//  UIViewControllerExtensions.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 23.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

extension UIViewController {
  
  private class func instantiateControllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard,
                                                                            identifier: String) -> T {
    //swiftlint:disable:next force_cast
    return storyboard.instantiateViewController(withIdentifier: identifier) as! T
  }
  
  class func controllerInStoryboard(_ storyboard: UIStoryboard, identifier: String) -> Self {
    return instantiateControllerInStoryboard(storyboard, identifier: identifier)
  }
  
  class func controllerInStoryboard(_ storyboard: UIStoryboard) -> Self {
    return controllerInStoryboard(storyboard, identifier: nameOfClass)
  }
  
  class func controllerFromStoryboard(_ storyboard: Storyboards) -> Self {
    return controllerInStoryboard(UIStoryboard(name: storyboard.rawValue, bundle: nil), identifier: nameOfClass)
  }

  func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
  }
    
  @objc func dismissKeyboard() {
        view.endEditing(true)
  }
    
  func endEditing() {
    self.navigationItem.rightBarButtonItem = nil
    self.navigationItem.leftBarButtonItem = nil
    view.endEditing(true)
  }
}
