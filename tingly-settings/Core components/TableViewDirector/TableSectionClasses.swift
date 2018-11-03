//
//  TableSectionClasses.swift
//  Tingly
//
//  Created by Dmitry Yurlagin on 05.09.2018.
//  Copyright © 2018 Liquid Gears Limited. All rights reserved.
//

import Foundation

protocol TableViewSection {
  var cellModels: [TableViewCellModelProtocol] { get set }
  var header: SectionHeaderFooterModel? { get set  }
  var footer: SectionHeaderFooterModel? { get set }
}

class BaseTableViewSection {
  var cellModels: [TableViewCellModelProtocol]
  var header: SectionHeaderFooterModel?
  var footer: SectionHeaderFooterModel?

  init(cellModels: [TableViewCellModelProtocol], header: SectionHeaderFooterModel?, footer: SectionHeaderFooterModel?) {
    self.cellModels = cellModels
    self.header = header
    self.footer = footer
  }
}

extension BaseTableViewSection: TableViewSection { }
