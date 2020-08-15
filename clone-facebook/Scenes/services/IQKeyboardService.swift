//
//  IQKeyboardService.swift
//  clone-facebook
//
//  Created by Nghia Nguyen on 13/08/2020.
//  Copyright © 2020 Nghia Nguyen. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class IQKeyboardService:NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        return true
    }
}
