//
//  AppDelegate.swift
//  CleanArchitecture
//
//  Created by Navneet on 15/05/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder
{
    var window: UIWindow?

    // store must be initialized when app is launched.
    private(set) var store: SyncManagerModel

    override init() {
        // initialize store
        var env: DomainAppConfiguration = .dev
        // get env from info plist and assign
        if let envString = Bundle.main.object(forInfoDictionaryKey: "ENV") as? String,
            let uEnv = DomainAppConfiguration(rawValue: envString)
        {
            env = uEnv
        }
        store = SyncManagerModel(with : env)
        super.init()
    }
}

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
        -> Bool
    {
        return true
    }
}




