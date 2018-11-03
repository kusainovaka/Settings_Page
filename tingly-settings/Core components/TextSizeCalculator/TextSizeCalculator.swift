//
//  TextSizeCalculator.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 06.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

enum TextSizeCalculator { }

extension TextSizeCalculator {
  
  static func textSizeThatFitsWidth(_ width: CGFloat, string: NSAttributedString?) -> CGSize {
    
    guard let attributedString = string else {
      return .zero
    }
    let textContainer: NSTextContainer = {
      let size = CGSize(width: width, height: .greatestFiniteMagnitude)
      let container = NSTextContainer(size: size)
      container.lineFragmentPadding = 0
      return container
    }()
    

    let textStorage = NSTextStorage(attributedString: attributedString)
  
    let layoutManager: NSLayoutManager = {
      let layoutManager = NSLayoutManager()
      layoutManager.addTextContainer(textContainer)
      textStorage.addLayoutManager(layoutManager)
      return layoutManager
    }()
    
    let rect = layoutManager.usedRect(for: textContainer)
    return rect.size
  }
  
}
