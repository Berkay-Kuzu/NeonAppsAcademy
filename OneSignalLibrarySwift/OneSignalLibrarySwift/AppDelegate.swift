//
//  AppDelegate.swift
//  OneSignalLibrarySwift
//
//  Created by Berkay Kuzu on 14.06.2023.
//

import UIKit
import OneSignal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
          // Remove this method to stop OneSignal Debugging
          OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_NONE)
          
          // OneSignal initialization
          OneSignal.initWithLaunchOptions(launchOptions)
          OneSignal.setAppId("2ff73334-73e4-4bbb-afef-a5525ae0cc1d")
          
          // promptForPushNotifications will show the native iOS notification permission prompt.
          // We recommend removing the following code and instead using an In-App Message to prompt for notification permission (See step 8)
          OneSignal.promptForPushNotifications(userResponse: { accepted in
            print("User accepted notifications: \(accepted)")
          })
          
          // Set your customer userId
          // OneSignal.setExternalUserId("userId")
        
           return true
        }
        
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



