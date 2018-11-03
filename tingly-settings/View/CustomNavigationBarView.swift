//
//  CustomNavigationBarView.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 10.10.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class CustomNavigationBarView: UINavigationBar {
    let rightButton = UIBarButtonItem()
    let leftButton = UIBarButtonItem(image: #imageLiteral(resourceName: "close"), style: .done, target: self, action: nil)
    let navigationItem = UINavigationItem()

    init(title: String, rightButtonType: DoneButtonType) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .red
        
        navigationItem.title = title
        switch rightButtonType {
        case .doneButton:
            rightButton.image = #imageLiteral(resourceName: "done-white")
        case .sendButton:
            rightButton.image = #imageLiteral(resourceName: "send")
        case .nextButton:
            rightButton.image = #imageLiteral(resourceName: "next-arraw")
        case .noneButton:
            break
        }
        leftButton.action = #selector(hello)
        barTintColor = #colorLiteral(red: 0.4117647059, green: 0.6823529412, blue: 0.9098039216, alpha: 1)
        tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
       titleTextAttributes = [NSAttributedStringKey.font: UIFont.ceraRoundFontDisplay(size: 22, weight: .regular),
                              NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        
        items = [navigationItem]
    }
    
    @objc func hello() {
        print("Hello")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
