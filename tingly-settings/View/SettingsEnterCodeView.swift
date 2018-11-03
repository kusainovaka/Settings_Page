//
//  SettingsEnterCodeView.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 16.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsEnterCodeView: UIView {
  let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.acromFontDisplay(size: 16, weight: .medium)
    label.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    label.textAlignment = .center
    label.text = "ENTER YOUR PASS CODE"
    return label
  }()

  let phoneNumber: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.titleLabel?.font = UIFont.ceraRoundFontDisplay(size: 18, weight: .medium)
    button.setTitleColor(#colorLiteral(red: 0.4117647059, green: 0.6823529412, blue: 0.9098039216, alpha: 1), for: .normal)
    return button
  }()
    
  let editButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(#imageLiteral(resourceName: "blue"), for: .normal)
    return button
  }()

  let nextButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(#imageLiteral(resourceName: "next-2"), for: .normal)
    button.setImage(#imageLiteral(resourceName: "next"), for: .disabled)
    button.isEnabled = false
    return button
  }()

  let resendLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.acromFontDisplay(size: 16, weight: .medium)
    label.textColor = #colorLiteral(red: 0.6705882353, green: 0.6705882353, blue: 0.6705882353, alpha: 1)
    label.textAlignment = .left
    label.text = "RESEND PASS CODE AGAIN IN"
    return label
  }()

  let timerNumber: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.acromFontDisplay(size: 16, weight: .medium)
    label.textColor = #colorLiteral(red: 0.4980392157, green: 0.7294117647, blue: 0.9215686275, alpha: 1)
    label.text = "30"
    label.textAlignment = .right
    return label
  }()
    
  var time = 30
  var timer = Timer()
    
  var digitsStackView = DigitsTextFieldView()
    var timeText: String? {
        didSet {
            timerNumber.text = timeText
        }
    }
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .clear
    addSubview(titleLabel)
    [titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 59),
     titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
     titleLabel.widthAnchor.constraint(equalToConstant: 250),
     titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ].forEach { $0.isActive = true }
    
    addSubview(phoneNumber)
    [phoneNumber.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 41),
     phoneNumber.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -106),
     phoneNumber.widthAnchor.constraint(equalToConstant: 140),
     phoneNumber.heightAnchor.constraint(equalToConstant: 18)
        ].forEach { $0.isActive = true }
    
    addSubview(editButton)
    [editButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 43),
     editButton.trailingAnchor.constraint(equalTo: phoneNumber.leadingAnchor, constant: -22),
     editButton.widthAnchor.constraint(equalToConstant: 10),
     editButton.heightAnchor.constraint(equalToConstant: 14)
        ].forEach { $0.isActive = true }
    
    addSubview(digitsStackView)
    [digitsStackView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 22),
     digitsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -42),
     digitsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 42),
     digitsStackView.heightAnchor.constraint(equalToConstant: 45)
        ].forEach { $0.isActive = true }
    
    addSubview(nextButton)
    [nextButton.topAnchor.constraint(equalTo: digitsStackView.bottomAnchor, constant: 33),
     nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
     nextButton.widthAnchor.constraint(equalToConstant: 64),
     nextButton.heightAnchor.constraint(equalToConstant: 64)
        ].forEach { $0.isActive = true }
    
    addSubview(resendLabel)
    [resendLabel.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 34),
     resendLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
     resendLabel.widthAnchor.constraint(equalToConstant: 265),
     resendLabel.heightAnchor.constraint(equalToConstant: 19)
        ].forEach { $0.isActive = true }
    
    addSubview(timerNumber)
    timerNumber.text = timeText
    [timerNumber.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 34),
     timerNumber.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -51),
     timerNumber.widthAnchor.constraint(equalToConstant: 40),
     timerNumber.heightAnchor.constraint(equalToConstant: 19)
        ].forEach { $0.isActive = true }
    
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
  }

  @objc func updateTime() {
    guard time == 0 else {
        time -= 1
        timeText = "\(time)"
        return
    }
    timer.invalidate()
   }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
