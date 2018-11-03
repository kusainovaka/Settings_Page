import UIKit

class TableViewDirector: NSObject {

  private weak var tableView: UITableView?
  private var sections: [TableViewSection]

  init(tableView: UITableView, sections: [TableViewSection]) {
    self.tableView = tableView
    self.sections = sections
    super.init()
    tableView.dataSource = self
    tableView.delegate = self
  }

  open func update(withSections newSections: [TableViewSection]) {
    self.sections = newSections
    tableView?.reloadData()
  }

  public func reloadRowHeights() {
    tableView?.beginUpdates()
    tableView?.endUpdates()
  }

  private func cellModel(forIndexPath indexPath: IndexPath) -> TableViewCellModelProtocol? {
    return sections[indexPath.section].cellModels[indexPath.row]
  }

}

extension TableViewDirector: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sections[section].cellModels.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    guard  let cellModel = cellModel(forIndexPath: indexPath) else {
      assertionFailure("Inconsistent datasource")
      return UITableViewCell()
    }

    var cell = tableView.dequeueReusableCell(withIdentifier: cellModel.identifier)

    if cell == nil {
      
      let bundle = Bundle(for: cellModel.cellClass)
      if let _ = bundle.path(forResource: cellModel.cellClass.getName(), ofType: "nib") {
        tableView.register(UINib.init(nibName: cellModel.cellClass.getName(), bundle: nil),
                           forCellReuseIdentifier: cellModel.identifier)
      } else {
        tableView.register(cellModel.cellClass, forCellReuseIdentifier: cellModel.identifier)
      }
      
      cell = tableView.dequeueReusableCell(withIdentifier: cellModel.identifier)
    }
  
    if let cell = cell as? BaseCell {
      cell.configure(model: cellModel)
      return cell
    } else {
      assertionFailure("Cell's xib didn't registered.")
      return UITableViewCell()
    }
  }
}

extension TableViewDirector: UITableViewDelegate {

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

    guard let cellModel = cellModel(forIndexPath: indexPath) else {
      assertionFailure("Inconsistent datasource")
      return CGFloat.leastNormalMagnitude
    }

    guard !cellModel.isCollapsed else { return CGFloat.leastNonzeroMagnitude }

    if let height = cellModel.height {
      return height
    } else if let newHeight = cellModel.cellClass.heightFor(width: tableView.bounds.width, model: cellModel) {
      sections[indexPath.section].cellModels[indexPath.row].height = newHeight
      return newHeight
    }
    return UITableViewAutomaticDimension
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

    guard let headerModel = sections[section].header else {
      return nil
    }

    var headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerModel.identifier)

    if headerView == nil {

      let bundle = Bundle(for: headerModel.viewClass)
      if let _ = bundle.path(forResource: headerModel.viewClass.getName(), ofType: "nib") {
        tableView.register(UINib.init(nibName: headerModel.viewClass.getName(), bundle: nil),
                           forHeaderFooterViewReuseIdentifier: headerModel.identifier)
      } else {
        tableView.register(headerModel.viewClass,
                           forHeaderFooterViewReuseIdentifier: headerModel.identifier)
      }
      headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerModel.identifier) as? TableHeaderFooterView
    }

    if let headerView = headerView as? TableHeaderFooterView {
      headerView.configure(model: headerModel)
      return headerView
    } else {
      assertionFailure("Header's xib didn't registered.")
      return nil
    }
  }

  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

    guard let footerModel = sections[section].footer else {
      return nil
    }

    var footerView: TableHeaderFooterView?
    footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerModel.identifier) as? TableHeaderFooterView

    if footerView == nil {
      
      let bundle = Bundle(for: footerModel.viewClass)
      if let _ = bundle.path(forResource: footerModel.viewClass.getName(), ofType: "nib") {
        tableView.register(UINib.init(nibName: footerModel.viewClass.getName(), bundle: nil),
                           forHeaderFooterViewReuseIdentifier: footerModel.identifier)
      } else {
        tableView.register(footerModel.viewClass,
                           forHeaderFooterViewReuseIdentifier: footerModel.identifier)
      }
      footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerModel.identifier) as? TableHeaderFooterView
    }

    if let footerView = footerView {
      footerView.configure(model: footerModel)
      return footerView
    } else {
      assertionFailure("Header's xib didn't registered.")
      return nil
    }
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    guard var header = sections[section].header else { return .leastNonzeroMagnitude }
    if let modelHeight = header.height {
      return modelHeight
    } else if let calculatedHeight = header.viewClass.heightFor(width: tableView.bounds.width, model: header) {
      header.height = calculatedHeight
      return calculatedHeight
    } else {
      return CGFloat.leastNormalMagnitude
    }
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    guard var footer = sections[section].footer else { return .leastNonzeroMagnitude }
    if let modelHeight = footer.height {
      return modelHeight
    } else if let calculatedHeight = footer.viewClass.heightFor(width: tableView.bounds.width, model: footer) {
      footer.height = calculatedHeight
      return calculatedHeight
    } else {
      return CGFloat.leastNormalMagnitude
    }
  }

  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let delete = deleteAction(at: indexPath)
    let unblock = unblockAction(at: indexPath)
    guard let cellModel = cellModel(forIndexPath: indexPath) else {
      return UISwipeActionsConfiguration.init()
    }
    
    switch cellModel.deleteType {
    case .none:
        return UISwipeActionsConfiguration.init()
    case . delete:
        return UISwipeActionsConfiguration(actions: [delete])
    case .unblock:
        return UISwipeActionsConfiguration(actions: [unblock])
    }
  }

  private func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
    let action = UIContextualAction(style: .destructive, title: "DELETE", handler: { (action, view, completion) in
        completion(true)
    })
    action.image = #imageLiteral(resourceName: "close")
    action.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.368627451, blue: 0.3333333333, alpha: 1)
    return action
  }
    
  private func unblockAction(at indexPath: IndexPath) -> UIContextualAction {
    let action = UIContextualAction(style: .destructive, title: "UNBLOCK", handler: { (action, view, completion) in
        completion(true)
    })
    action.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.368627451, blue: 0.3333333333, alpha: 1)
    return action
  }
}
