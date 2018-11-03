//
//  Router.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 27.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

protocol Router: Presentable {
  
  func present(_ module: Presentable?)
  func present(_ module: Presentable?, animated: Bool)
  
  func push(_ module: Presentable?, hideBar: Bool)
  func push(_ module: Presentable?, animated: Bool, hideBar: Bool)
  func push(_ module: Presentable?, animated: Bool, hideBar: Bool, completion: (() -> Void)?)
  
  func popModule()
  func popModule(animated: Bool)
  
  func dismissModule()
  func dismissModule(animated: Bool, completion: (() -> Void)?)
  
  func setRootModule(_ module: Presentable?, animated: Bool)
  func setRootModule(_ module: Presentable?, hideBar: Bool, animated: Bool)
  
  func popToRootModule(animated: Bool)
  
  func setModules(_ modules: [Presentable?],  hideBar: Bool, animated: Bool)
  
  var topModule: Presentable? { get }
}
