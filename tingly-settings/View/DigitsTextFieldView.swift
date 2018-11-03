//
//  DigitsTextFieldView.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 16.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class DigitsTextFieldView: UIView {

  let textView = UITextView()
  let numbersStackView = UIStackView()
  private let numberOfDigits = 6

  var didChangeCode: ((String) -> ())?

  private lazy var numbers: [UILabel] = {
    var numbers = [UILabel]()
    for i in 0 ..< numberOfDigits {
        let label = makeNumberLabel()
        numbers.append(label)
    }
    return numbers
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .clear
    textView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(numbersStackView)
    numbersStackView.translatesAutoresizingMaskIntoConstraints = false
    numbersStackView.distribution = .fillEqually
    numbersStackView.spacing = 10
    
    [numbersStackView.topAnchor.constraint(equalTo: self.topAnchor),
     numbersStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
     numbersStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
     numbersStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    
    configure()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func makeNumberLabel() -> UILabel {
    let label = UILabel()
    label.layer.cornerRadius = 6
    label.clipsToBounds = true
    label.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.6705882353, blue: 0.6705882353, alpha: 1)
    label.textAlignment = .center
    label.font = UIFont.ceraRoundFontDisplay(size: 20, weight: .medium)
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    label.widthAnchor.constraint(equalToConstant: 40).isActive = true
    label.heightAnchor.constraint(equalToConstant: 45).isActive = true
    return label
  }
    
  func configure() {
    textView.delegate = self
    textView.keyboardType = .numberPad
    textView.tintColor = .clear
    numbers.forEach{ numbersStackView.addArrangedSubview($0)}
  }

  fileprivate func fillNumbers() {
    //        for (index, numberLabel) in numbers.enumerated() {
    //            numberLabel.text = index < textView.text.count ? String(textView.text[index]) : nil
    //        }
  }
}


extension DigitsTextFieldView: UITextViewDelegate {
  func textViewDidChange(_ textView: UITextView) {
    
            fillNumbers()
            didChangeCode?(textView.text)
  }

  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    let resultString = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
    return resultString.numbers.count <= numberOfDigits && text.count == text.numbers.count
  }
}
