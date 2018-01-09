//
//  MainTabBarController.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright © 2017 Юрий. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstTab = SearchProductViewController()
        firstTab.configurator.configureViewController(firstTab)
        let firstTabBarItem = UITabBarItem(title: NSLocalizedString("search_tab", comment: ""),
                                           image: UIImage(named: "search"),
                                           tag: 0)
        firstTab.tabBarItem = firstTabBarItem

        let secondTab = ShoppingListViewController()
        secondTab.configurator.configure(viewController: secondTab)
        let secondTabBarItem = UITabBarItem(title: NSLocalizedString("bag_tab", comment: ""),
                                            image: UIImage(named: "shopping_cart"),
                                            tag: 1)
        secondTab.tabBarItem = secondTabBarItem

        let viewControllerList = [firstTab, secondTab]
        self.viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }
    }
    
}
