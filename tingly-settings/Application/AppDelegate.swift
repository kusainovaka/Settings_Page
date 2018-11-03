//
//  AppDelegate.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 23.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()
  private var rootViewController: UINavigationController = UINavigationController()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let window = UIWindow()
    window.makeKeyAndVisible()
    window.rootViewController = rootViewController
    self.window = window
    applicationCoordinator.start()
    return true
  }

  private func makeCoordinator() -> Coordinator {
    return ApplicationCoordinator(router: RouterImp(rootController: rootViewController),
                                  coordinatorFactory: CoordinatorFactoryImp())
  }


}

