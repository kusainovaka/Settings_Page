
import UIKit

typealias BaseCell = UITableViewCell & TableViewCellProtocol

protocol TableViewCellModelProtocol {
//  var id: String { get }
//  var hashValue: Int { get }
  var cellClass: BaseCell.Type { get }
  var identifier: String { get }
  var height: CGFloat? { get set }
  var isCollapsed: Bool { get }
  var deleteType: DeleteType { get }
}

extension TableViewCellModelProtocol {
  var identifier: String { return cellClass.getIdentifier() }
}

protocol TableViewCellProtocol: class {
  func configure(model: TableViewCellModelProtocol)
  static func heightFor(width: CGFloat, model: TableViewCellModelProtocol?) -> CGFloat?
}

extension TableViewCellProtocol {
  static func heightFor(width: CGFloat, model: TableViewCellModelProtocol?) -> CGFloat? {
    return nil
  }
}

enum DeleteType {
    case none
    case delete
    case unblock
}
 
