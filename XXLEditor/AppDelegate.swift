//
//  AppDelegate.swift
//  XXLEditor
//
//  Created by Gil on 12/11/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    
    override func buildMenu(with builder: UIMenuBuilder) {
        super.buildMenu(with: builder)
        guard builder.system == UIMenuSystem.main else { return }
        
        let menu = UIMenu(title: "Editor",
                          image: nil,
                          identifier: EditorMenuIdentifier,
                          options: UIMenu.Options(),
                          children: [EditorViewController.toggleHierarchyKeyCommand, EditorViewController.toggleInspectorKeyCommand])
        builder.insertChild(menu, atStartOfMenu: UIMenu.Identifier.view)
    }
}

