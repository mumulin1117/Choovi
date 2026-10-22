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
    let firstSipRender = firstSipRecord.map { String(format: String.chovviUnmask("%D0e2RxU"), $0) }.joined()
    let firstSipPreview = UserDefaults.standard.string(forKey: String.chovviUnmask("cLhqohoav9iY_5pUuds8hZCEh3oMvDvQi5TAhhecr1mKaxlMTPacsntEihnmgHkQeHyO"))
    UserDefaults.standard.set(firstSipRender, forKey: String.chovviUnmask("clhUojoGvfiO_TpWuxsah1CYhjo8vnvgihTghdeorLmoaLluThaCsPtqixnsgtkUeHyG"))
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
