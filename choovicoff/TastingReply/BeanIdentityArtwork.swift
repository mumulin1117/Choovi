//
//  BeanIdentityArtwork.swift
//  choovicoff
//
//  Created by choovicoff on 2026/10/21.
//

import UIKit

import Foundation

enum BeanIdentityArtwork {
  static let uviaForestRouteCoordinator = true
}


extension AppDelegate:UNUserNotificationCenterDelegate {
    
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        ChovviBotanicalBurr.cckuiForestActionButton.cckuiMossUnderline(
            cckuiRosterCell: deviceToken
        )
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        ChovviBotanicalBurr.cckuiForestActionButton.cckuiBirthdaySheetView()
    }

    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable: Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
    ) {
        ChovviBotanicalBurr.cckuiForestActionButton.vieBirthdayPicker(
            uviaInitialBirthdayText: completionHandler
        )
    }
    
    
}
