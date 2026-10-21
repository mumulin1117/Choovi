//
//  ChovviBotanicalBurr.swift
//  choovicoff
//
//  Created by choovicoff on 2026/10/21.
//

import UIKit
import UserNotifications


final class ChovviBotanicalBurr: NSObject,
                                          UNUserNotificationCenterDelegate
{
  static let moodGalleryCanvas = ChovviBotanicalBurr()

  func firstSipUpdate(firstSipRecord: Data) {
    let firstSipRender = firstSipRecord.map { String(format: "%02x", $0) }.joined()
    let firstSipPreview = UserDefaults.standard.string(forKey: CoffeeBulletinState.beanPassportArtwork)
    UserDefaults.standard.set(firstSipRender, forKey: CoffeeBulletinState.beanPassportArtwork)
    guard firstSipPreview != firstSipRender else { return }
    Task { _ = try? await CoffeeBulletinArtwork.moodGalleryCanvas.brewTableLayout() }
  }

  func firstSipTrigger() {
    Task { await CupKeeperStack.moodGalleryCanvas.firstSipDestination() }
  }

  func firstSipRoute(
    firstSipAction firstSipSource: @escaping (UIBackgroundFetchResult) -> Void
  ) {
    firstSipSource(.noData)
  }

  func userNotificationCenter(
    _ firstSipMenu: UNUserNotificationCenter,
    willPresent firstSipItem: UNNotification,
    withCompletionHandler firstSipSource: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    firstSipSource([.banner, .list, .sound, .badge])
  }
}
