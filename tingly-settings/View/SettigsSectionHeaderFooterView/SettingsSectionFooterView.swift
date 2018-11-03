//
//  SectionHeaderFooterView.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 05.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsSectionFooterView: UITableViewHeaderFooterView {
  
  private var model: SettingsFooterSectionModel!
  private struct Constants {
    static let topMargin: CGFloat = 12.0
    static let bottonMargin: CGFloat = 12.0
    static let leadingAnchor: CGFloat = 15.0
    static let trailingAnchor: CGFloat = 15.0
    static let font: UIFont = .systemFont(ofSize: 12, weight: .medium)
  }
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.font = UIFont.acromFontDisplay(size: 12, weight: .medium)
    label.textColor = #colorLiteral(red: 0.6705882353, green: 0.6705882353, blue: 0.6705882353, alpha: 1)
    return label
  }()
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setup() {
    addSubview(titleLabel)
    titleLabel.font = Constants.font
    //UIFont.acromFontDisplay(size: 12, weight: .medium) - check this font its nil
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.topMargin),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leadingAnchor),
      trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: Constants.trailingAnchor)
    ])
  }
}

extension SettingsSectionFooterView: SectionHeaderFooterView {
  
  func configure(model: SectionHeaderFooterModel) {
    guard let footerModel = model as? SettingsFooterSectionModel else {
      assertionFailure("WTF??")
      return
    }
    self.model = footerModel
    titleLabel.text = footerModel.text
  }
  
  static func heightFor(width: CGFloat, model: SectionHeaderFooterModel?) -> CGFloat? {
    guard let footerModel = model as? SettingsFooterSectionModel, let text = footerModel.text else {
      return nil
    }
    
    let attributedString = NSAttributedString(string: text, attributes: [
      NSAttributedStringKey.font: Constants.font
      ])
    
    let textHeight = TextSizeCalculator.textSizeThatFitsWidth(width, string: attributedString).height
    return textHeight + Constants.topMargin + Constants.bottonMargin
  }
}


