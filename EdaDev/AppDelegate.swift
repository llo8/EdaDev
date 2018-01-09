//
//  AppDelegate.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright © 2017 Юрий. All rights reserved.
//

import Foundation
import UIKit

typealias LaunchOptions = [UIApplicationLaunchOptionsKey: Any]

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: LaunchOptions? = nil) -> Bool {

        let tabBar = MainTabBarController()
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()

        return true
    }

}
