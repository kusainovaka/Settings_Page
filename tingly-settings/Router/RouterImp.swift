//
//  RouterImp.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 27.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

final class RouterImp: NSObject, Router {
  
  private weak var tabBarRootController: UITabBarController?
  private weak var rootController: UINavigationController?
  private var completions: [UIViewController : () -> Void]
  
  init(rootController: UITabBarController) {
    self.tabBarRootController = rootController
    completions = [:]
  }
  
  init(rootController: UINavigationController) {
    self.rootController = rootController
    completions = [:]
  }
  
  private func setNavBarAppearance() {
    rootController?.navigationBar.barTintColor = #colorLiteral(red: 0.4117647059, green: 0.6823529412, blue: 0.9098039216, alpha: 1)
    rootController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    let rightButton = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .done, target: self, action: #selector(closeModule))
    UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear], for: .normal)
    UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear], for: UIControlState.highlighted)
    rootController?.navigationItem.backBarButtonItem = rightButton
    rootController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.ceraRoundFontDisplay(size: 22, weight: .regular),
        NSAttributedStringKey.foregroundColor: UIColor.white]
  }
    
  @objc func closeModule() {
    dismissModule(animated: true, completion: nil)
  }
    
  func toPresent() -> UIViewController? {
    return rootController
  }
  
  func present(_ module: Presentable?) {
    present(module, animated: true)
  }
  
  func present(_ module: Presentable?, animated: Bool) {
    guard let controller = module?.toPresent() else { return }
    rootController?.present(controller, animated: animated, completion: nil)
  }
  
  func dismissModule() {
    dismissModule(animated: true, completion: nil)
  }
  
  func dismissModule(animated: Bool, completion: (() -> Void)?) {
    rootController?.dismiss(animated: animated, completion: completion)
  }
  
  func push(_ module: Presentable?, hideBar: Bool)  {
    setNavBarAppearance()
    push(module, animated: true, hideBar: hideBar)
  }
  
  func push(_ module: Presentable?, animated: Bool, hideBar: Bool)  {
    push(module, animated: animated, hideBar: hideBar, completion: nil)
  }
  
  func push(_ module: Presentable?, animated: Bool, hideBar: Bool, completion: (() -> Void)?) {
    guard
      let controller = module?.toPresent(),
      (controller is UINavigationController == false)
      else { assertionFailure("Deprecated push UINavigationController."); return }
  
    if let completion = completion {
      completions[controller] = completion
    }

    rootController?.setNavigationBarHidden(hideBar, animated: false)
    rootController?.pushViewController(controller, animated: animated)
  }
  
  func popModule()  {
    popModule(animated: true)
  }
  
  func popModule(animated: Bool)  {
    if let controller = rootController?.popViewController(animated: animated) {
      runCompletion(for: controller)
    }
  }
  
  func setRootModule(_ module: Presentable?, animated: Bool) {
    setRootModule(module, hideBar: false)
  }
  
  func setRootModule(_ module: Presentable?, hideBar: Bool, animated: Bool = true) {
    guard let controller = module?.toPresent() else { return }
    rootController?.setViewControllers([controller], animated: animated)
    rootController?.isNavigationBarHidden = hideBar
  }
    
  
  func setModules(_ modules: [Presentable?],  hideBar: Bool, animated: Bool) {
    let controllers = modules.compactMap { $0?.toPresent() }
    rootController?.setViewControllers(controllers, animated: animated)
    rootController?.isNavigationBarHidden = hideBar
  }
  
  
  func popToRootModule(animated: Bool) {
    if let controllers = rootController?.popToRootViewController(animated: animated) {
      controllers.forEach { controller in
        runCompletion(for: controller)
      }
    }
  }
  
  private func runCompletion(for controller: UIViewController) {
    guard let completion = completions[controller] else { return }
    completion()
    completions.removeValue(forKey: controller)
  }
  
  var topModule: Presentable? {
    return rootController?.topViewController
  }
  
}
