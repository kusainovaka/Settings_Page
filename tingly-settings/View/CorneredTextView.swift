//
//  CorneredTextView.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 15.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class CorneredTextView: UITextView {
    
  override init(frame: CGRect, textContainer: NSTextContainer?) {
    super.init(frame: frame, textContainer: textContainer)
    clipsToBounds = true
    layer.cornerRadius = 6
    keyboardType = .decimalPad
    font = UIFont.ceraRoundFontDisplay(size: 20, weight: .medium)
    backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.6705882353, blue: 0.6705882353, alpha: 1)
    textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    textContainerInset = UIEdgeInsetsMake(13, 19, 13, 5)
    translatesAutoresizingMaskIntoConstraints = false
    becomeFirstResponder()
  }
    

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
