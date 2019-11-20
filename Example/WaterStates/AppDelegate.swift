//
//  AppDelegate.swift
//  WaterStates
//
//  Created by BarredEwe on 10/25/2019.
//  Copyright (c) 2019 BarredEwe. All rights reserved.
//

import UIKit
import WaterStates

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        WaterStatesConfig.loadingView.title = nil
        WaterStatesConfig.emptyView.appearance.actionButtonColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return true
    }

}
