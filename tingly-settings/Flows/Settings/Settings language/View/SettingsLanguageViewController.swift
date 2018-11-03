//
//  SettingsLanguageViewController.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 31.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsLanguageViewController: UIViewController {
    
  var searchController = UISearchController(searchResultsController: nil)
  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .grouped)
    tableView.separatorStyle = .none
    tableView.isScrollEnabled = false
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()

  private lazy var tableDirector: TableViewDirector = {
        let tableDirector = TableViewDirector(tableView: tableView, sections: [])
        return tableDirector
  }()
    
  var presenter: SettingsLanguageViewOutput?

  override func viewDidLoad() {
  super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    title = "LANGUAGE"
    navigatorSearchBar()
    layoutViews()
    presenter?.viewDidLoad()
    
  }
    
  private func navigatorSearchBar(){
        searchController.dimsBackgroundDuringPresentation = true
        let attribute = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 22),
                         NSAttributedStringKey.foregroundColor: UIColor.white ]
        navigationController?.navigationBar.largeTitleTextAttributes = attribute
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchController.searchBar.textField?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchController.searchBar.textField?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchController.searchBar.setImage(nil, for: .search, state: .normal)
        searchController.searchBar.setImage(#imageLiteral(resourceName: "textFieldClose"), for: .clear, state: .normal)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
  private func layoutViews() {
    
    view.addSubview(tableView)
    [ tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ].forEach { $0.isActive = true }
  }
}

extension SettingsLanguageViewController: SettingsLanguageViewInput {
  func setSections(_ sections: [TableViewSection]) {
    tableDirector.update(withSections: sections)
  }
    
  func doSomething() {
    //
  }

  func showLoading() {
    //
  }
}

extension SettingsLanguageViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
 }
}

extension SettingsLanguageViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
   }
}
