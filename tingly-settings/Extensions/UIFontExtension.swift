//
//  UIFontExtension.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 30.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
 static func acromFontDisplay(size: CGFloat, weight: AcromFont) -> UIFont! {
    let fontName = acromFontName(from: weight)
    let font = UIFont(name: fontName, size: size)
    return font
 }

 static func ceraRoundFontDisplay(size: CGFloat, weight: CeraRoundFont) -> UIFont! {
    let fontName = ceraRoundFontName(from: weight)
    let font = UIFont(name: fontName, size: size)
    return font
 }
    
 private static func acromFontName(from weight: AcromFont) -> String {
    switch weight {
    case  .bold:
      return weight.fontName
    case .extraBold :
      return weight.fontName
    case  .light:
      return weight.fontName
    case .medium :
      return weight.fontName
    case  .thin:
      return weight.fontName
    case .regular :
      return weight.fontName
    }
 }
    
    private static func ceraRoundFontName(from weight: CeraRoundFont) -> String {
        switch weight {
        case  .bold:
            return weight.fontName
        case .black :
            return weight.fontName
        case  .light:
            return weight.fontName
        case .medium :
            return weight.fontName
        case  .thin:
            return weight.fontName
        case .regular :
            return weight.fontName
        }
    }
    
 enum AcromFont: String {
    case bold = "Acrom-Bold"
    case extraBold = "Acrom-ExtraBold"
    case light = "Acrom-Light"
    case medium = "Acrom-Medium"
    case thin = "Acrom-Thin"
    case regular = "Acrom-Regular"
        
    var fontName: String {
     return rawValue
    }
  }
    enum CeraRoundFont: String {
        case bold = "CeraRoundProDEMO-Bold"
        case black = "CeraRoundProDEMO-Black"
        case light = "CeraRoundProDEMO-Light"
        case medium = "CeraRoundProDEMO-Medium"
        case thin = "CeraRoundProDEMO-Thin"
        case regular = "CeraRoundProDEMO-Regular"
        
        var fontName: String {
            return rawValue
        }
    }
}


