//
//  HeaderFooterClasses.swift
//  Tingly
//
//  Created by Dmitry Yurlagin on 05.09.2018.
//  Copyright © 2018 Liquid Gears Limited. All rights reserved.
//

import UIKit

typealias TableHeaderFooterView = UITableViewHeaderFooterView & SectionHeaderFooterView

protocol SectionHeaderFooterModel {
  var height: CGFloat? { get set }
  var viewClass: TableHeaderFooterView.Type { get }
  var identifier: String { get }
}

extension SectionHeaderFooterModel {
  var identifier: String { return viewClass.getIdentifier() }
}

protocol SectionHeaderFooterView {
  func configure(model: SectionHeaderFooterModel)
  static func heightFor(width: CGFloat, model: SectionHeaderFooterModel?) -> CGFloat?
}

extension SectionHeaderFooterView {
  static func heightFor(width: CGFloat, model: SectionHeaderFooterModel?) -> CGFloat? {
    return nil
  }
}
