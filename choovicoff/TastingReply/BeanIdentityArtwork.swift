//
//  BeanIdentityArtwork.swift
//  choovicoff
//
//  Created by choovicoff on 2026/10/21.
//

import UIKit

import Foundation

enum RoastArchiveState {
  static let roastShelfPreview = true
}


extension AppDelegate:UNUserNotificationCenterDelegate {
    
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        ChovviBotanicalBurr.moodGalleryCanvas.firstSipUpdate(
            firstSipRecord: deviceToken
        )
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        ChovviBotanicalBurr.moodGalleryCanvas.firstSipTrigger()
    }

    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable: Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
    ) {
        ChovviBotanicalBurr.moodGalleryCanvas.firstSipRoute(
            firstSipAction: completionHandler
        )
    }
    
    
}
