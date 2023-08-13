//
//  ViewController.swift
//  OneSignalLibrarySwift
//
//  Created by Berkay Kuzu on 14.06.2023.
//

import UIKit
import OneSignal

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    
        playerID()
    }
    
    func playerID() {
        if let deviceState = OneSignal.getDeviceState() {
            let userId = deviceState.userId
            print("OneSignal Push Player ID: ", userId ?? "called too early, not set yet")
//            let subscribed = deviceState.isSubscribed
//            print("Device is subscribed: ", subscribed)
//            let hasNotificationPermission = deviceState.hasNotificationPermission
//            print("Device has notification permissions enabled: ", hasNotificationPermission)
//            let notificationPermissionStatus = deviceState.notificationPermissionStatus
//            print("Device's notification permission status: ", notificationPermissionStatus.rawValue)
//            let pushToken = deviceState.pushToken
//            print("Device Push Token Identifier: ", pushToken ?? "no push token, not subscribed")
        }
    }

}

