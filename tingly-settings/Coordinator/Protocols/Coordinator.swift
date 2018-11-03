//
//  Coordinator.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 27.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

protocol Coordinator: class {
  func start()
  func start(with option: DeepLinkOption?)
}
