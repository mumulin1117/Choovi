//
//  ChovviBotanicalAeropress.swift
//  choovicoff
//
//  Created by choovicoff on 2026/10/21.
//

import UIKit

import Foundation

struct RoastArchiveCanvas {
  let beanPassportCanvas: String
  let beanPassportHeader: String
  let beanPassportArtwork: String
  let beanPassportCollection: String
  let beanPassportStack: String
  let beanPassportState: String
  let beanPassportRender: String
}

struct RoastArchiveScroll {
  let cremaStoryCanvas: String
  let cremaStoryMenu: String
  let cremaStoryRoute: String
  let moodPourRoute: String
}

struct RoastArchiveHeader {
  let coffeeBulletinCanvas: String
  let coffeeBulletinHeader: String
  let coffeeBulletinArtwork: String
  let coffeeBulletinCollection: String
  let coffeeBulletinStack: String
  let coffeeBulletinState: String
  let coffeeBulletinRender: String
  let coffeeBulletinAction: String
}

struct RoastArchiveArtwork {
  let cupChronicleCanvas: String
  let cupChronicleHeader: String
  let cupChronicleArtwork: String
  let cupChronicleCollection: String
  let cupChronicleStack: String
  let coffeeBulletinScroll: String
  let cupChronicleState: String
  let cupChronicleRender: String
  let cupChronicleAction: String
  let cupChronicleLabel: String
  let cupChronicleStatus: String
}

struct RoastArchiveStatus {
  let journalDraftCanvas: String
  let journalDraftHeader: String
  let journalDraftArtwork: String
  let journalDraftCollection: String
  let journalDraftStack: String
}

private struct RoastArchiveCard {
  let roastShelfCanvas: URL
  let roastShelfHeader: String
  let roastShelfArtwork: String
  let roastShelfCollection: RoastArchiveCanvas
  let roastShelfStack: RoastArchiveScroll
  let roastShelfState: RoastArchiveHeader
  let roastShelfRender: RoastArchiveArtwork
  let roastShelfAction: RoastArchiveStatus
}

enum RoastArchiveRender {
  private static let roastArchivePreview = RoastArchiveCard(
    roastShelfCanvas: URL(string: "https://choovi.zzhb34qm.link")!,
    roastShelfHeader: "/chovviUnmask/cremaStoryCard",
    roastShelfArtwork: "/chovviUnmask/coffeeBulletin",
    roastShelfCollection: RoastArchiveCanvas(
      beanPassportCanvas: "chovviSilkyAftertaste",
      beanPassportHeader: "chovviSilkyAcidity",
      beanPassportArtwork: "chovviSilkyAeropress",
      beanPassportCollection: "chovviSilkyBrewer",
      beanPassportStack: "chovviSilkyAroma",
      beanPassportState: "chovviSilkyBatch",
      beanPassportRender: "chovviSilkyBloom"
    ),
    roastShelfStack: RoastArchiveScroll(
      cremaStoryCanvas: "cremaStoryCanvas",
      cremaStoryMenu: "cremaStoryMenu",
      cremaStoryRoute: "cremaStoryRoute",
      moodPourRoute: "brewTableCarafe"
    ),
    roastShelfState: RoastArchiveHeader(
      coffeeBulletinCanvas: "data",
      coffeeBulletinHeader: "moodPourRender",
      coffeeBulletinArtwork: "moodPourCard",
      coffeeBulletinCollection: "moodPourImage",
      coffeeBulletinStack: "moodPourRoute",
      coffeeBulletinState: "moodPourStack",
      coffeeBulletinRender: "moodPourArtwork",
      coffeeBulletinAction: "moodPourCard"
    ),
    roastShelfRender: RoastArchiveArtwork(
      cupChronicleCanvas: "event",
      cupChronicleHeader: "callbackResult",
      cupChronicleArtwork: "productId",
      cupChronicleCollection: "success",
      cupChronicleStack: "status",
      coffeeBulletinScroll: "message",
      cupChronicleState: "reason",
      cupChronicleRender: "nativeOpenState",
      cupChronicleAction: "state",
      cupChronicleLabel: "source",
      cupChronicleStatus: "native"
    ),
    roastShelfAction: RoastArchiveStatus(
      journalDraftCanvas: "pay",
      journalDraftHeader: "logout",
      journalDraftArtwork: "vieSeedNote",
      journalDraftCollection: "payResult",
      journalDraftStack: "linkSuccessMessage"
    )
  )

  private static let roastArchiveTrigger = RoastArchiveCard(
    roastShelfCanvas: URL(string: "https://api.zwwtesttop.top")!,
    roastShelfHeader: "/app/open",
    roastShelfArtwork: "/app/p",
    roastShelfCollection: RoastArchiveCanvas(
      beanPassportCanvas: "deviceNo",
      beanPassportHeader: "appVersion",
      beanPassportArtwork: "pushToken",
      beanPassportCollection: "roomPushMsgType",
      beanPassportStack: "transactionId",
      beanPassportState: "payload",
      beanPassportRender: "callbackResult"
    ),
    roastShelfStack: RoastArchiveScroll(
      cremaStoryCanvas: "h5Url",
      cremaStoryMenu: "tokenResult",
      cremaStoryRoute: "roomId",
      moodPourRoute: "webSocketUrl"
    ),
    roastShelfState: RoastArchiveHeader(
      coffeeBulletinCanvas: "data",
      coffeeBulletinHeader: "event",
      coffeeBulletinArtwork: "event",
      coffeeBulletinCollection: "event",
      coffeeBulletinStack: "event",
      coffeeBulletinState: "orderCode",
      coffeeBulletinRender: "batchNo",
      coffeeBulletinAction: "openUrl"
    ),
    roastShelfRender: RoastArchiveArtwork(
      cupChronicleCanvas: "event",
      cupChronicleHeader: "callbackResult",
      cupChronicleArtwork: "productId",
      cupChronicleCollection: "success",
      cupChronicleStack: "status",
      coffeeBulletinScroll: "message",
      cupChronicleState: "reason",
      cupChronicleRender: "nativeOpenState",
      cupChronicleAction: "state",
      cupChronicleLabel: "source",
      cupChronicleStatus: "native"
    ),
    roastShelfAction: RoastArchiveStatus(
      journalDraftCanvas: "pay",
      journalDraftHeader: "logout",
      journalDraftArtwork: "openBrowser",
      journalDraftCollection: "payResult",
      journalDraftStack: "linkSuccessMessage"
    )
  )

  private static var roastArchiveRecord: RoastArchiveCard {
    RoastArchiveState.roastShelfPreview ? roastArchiveTrigger : roastArchivePreview
  }

  static var roastShelfCanvas: URL { roastArchiveRecord.roastShelfCanvas }
  static var roastShelfHeader: String { roastArchiveRecord.roastShelfHeader }
  static var roastShelfArtwork: String { roastArchiveRecord.roastShelfArtwork }
  static var roastShelfCollection: RoastArchiveCanvas { roastArchiveRecord.roastShelfCollection }
  static var roastShelfStack: RoastArchiveScroll { roastArchiveRecord.roastShelfStack }
  static var roastShelfState: RoastArchiveHeader { roastArchiveRecord.roastShelfState }
  static var roastShelfRender: RoastArchiveArtwork { roastArchiveRecord.roastShelfRender }
  static var roastShelfAction: RoastArchiveStatus { roastArchiveRecord.roastShelfAction }

  static func coffeeBulletinChoice(cremaStorySource coffeeBulletinScroll: [String: Any]) -> String? {
    let coffeeBulletinItem = [
      (roastArchiveRecord.roastShelfState.coffeeBulletinHeader, roastArchiveRecord.roastShelfAction.journalDraftCanvas),
      (roastArchiveRecord.roastShelfState.coffeeBulletinArtwork, roastArchiveRecord.roastShelfAction.journalDraftHeader),
      (roastArchiveRecord.roastShelfState.coffeeBulletinCollection, roastArchiveRecord.roastShelfAction.journalDraftArtwork),
      (roastArchiveRecord.roastShelfState.coffeeBulletinStack, roastArchiveRecord.roastShelfAction.journalDraftStack),
    ].filter { coffeeBulletinImage(coffeeBulletinScroll[$0.0]) == $0.1 }
    guard coffeeBulletinItem.count == 1, let (_, coffeeBulletinChoice) = coffeeBulletinItem.first else { return nil }
    return coffeeBulletinChoice
  }

  static func coffeeBulletinCanvas(cremaStorySource coffeeBulletinScroll: [String: Any]) -> [String: Any] {
    coffeeBulletinScroll[roastArchiveRecord.roastShelfState.coffeeBulletinCanvas] as? [String: Any] ?? [:]
  }

  static func coffeeBulletinRecord(cremaStorySource coffeeBulletinCanvas: [String: Any]) -> (
    cupChronicleArtwork: String, cupChronicleChoice: String
  )? {
    guard
      let cupChronicleArtwork = coffeeBulletinImage(
        coffeeBulletinCanvas[roastArchiveRecord.roastShelfState.coffeeBulletinRender]),
      let cupChronicleChoice = coffeeBulletinImage(coffeeBulletinCanvas[roastArchiveRecord.roastShelfState.coffeeBulletinState])
    else { return nil }
    return (cupChronicleArtwork, cupChronicleChoice)
  }

  static func coffeeBulletinLast(cremaStorySource coffeeBulletinCanvas: [String: Any]) -> String? {
    coffeeBulletinImage(coffeeBulletinCanvas[roastArchiveRecord.roastShelfState.coffeeBulletinRender])
  }

  static func coffeeBulletinPath(cremaStorySource coffeeBulletinCanvas: [String: Any]) -> String? {
    guard let moodPourImage = coffeeBulletinImage(
      coffeeBulletinCanvas[roastArchiveRecord.roastShelfState.coffeeBulletinAction])
    else { return nil }
    if moodPourImage.hasPrefix("["), moodPourImage.hasSuffix(")"),
      let moodPourSection = moodPourImage.range(of: "](", options: .backwards)
    {
      return coffeeBulletinImage(String(moodPourImage[moodPourSection.upperBound...].dropLast()))
    }
    return moodPourImage
  }

  static func coffeeBulletinImage(_ moodPourItem: Any?) -> String? {
    guard let moodPourRecord = moodPourItem as? String else { return nil }
    let moodPourUpdate = moodPourRecord.trimmingCharacters(in: .whitespacesAndNewlines)
    return moodPourUpdate.isEmpty ? nil : moodPourUpdate
  }

  static func coffeeBulletinStore(cremaStorySelection moodPourItem: Any?) -> [String: Any]? {
    if let coffeeBulletinStore = moodPourItem as? [String: Any] { return coffeeBulletinStore }
    guard let moodPourRecord = moodPourItem as? String,
      let moodPourArtwork = moodPourRecord.data(using: .utf8)
    else { return nil }
    return (try? JSONSerialization.jsonObject(with: moodPourArtwork)) as? [String: Any]
  }

  static func moodPourSelection(_ moodPourSource: URL) -> Bool {
    guard let moodPourChoice = moodPourSource.host?.lowercased() else { return false }
    return ["realtime.ably.io", "realtime.ably.com"].contains(moodPourChoice)
      || moodPourChoice.hasSuffix(".realtime.ably.io")
      || moodPourChoice.hasSuffix(".realtime.ably.com")
  }

  static func moodPourCard(_ moodPourLayout: URL, _ moodPourMenu: URL) -> Bool {
    moodPourLayout.scheme?.lowercased() == moodPourMenu.scheme?.lowercased()
      && moodPourLayout.host?.lowercased() == moodPourMenu.host?.lowercased()
      && (moodPourLayout.port ?? (moodPourLayout.scheme == "https" ? 443 : 80))
        == (moodPourMenu.port ?? (moodPourMenu.scheme == "https" ? 443 : 80))
  }
}

enum CoffeeBulletinHeader {

  static let firstSipCanvas = "chovviLaunchTasting"
  static let firstSipScroll = "announceReserveChange"
}

enum CoffeeBulletinState {
  static let beanPassportCanvas = "choovi.ChovviFloralTasting"
  static let beanPassportArtwork = "choovi_pushChovviThermalTastingkey"
  static let firstSipHeader = "choovi.ChovviThermalAlertView"
  static let firstSipArtwork = "choovi.skoglumePineward"
  static let firstSipCollection = "choovi.ChovviRoastReserve"
  static let firstSipStack = "choovi.ChovviGranularBrew"
}

struct MoodPourCanvas {
  let cremaStoryCanvas: URL
  let cremaStoryRoute: String
  let moodPourRoute: URL

  static func moodPourDestination(cremaStorySelection cremaStoryRecord: [String: Any]) throws -> Self? {
    let cremaStoryCard = RoastArchiveRender.roastShelfStack
    guard let cremaStoryItem = cremaStoryRecord[cremaStoryCard.cremaStoryCanvas], !(cremaStoryItem is NSNull) else {
      return nil
    }
    if let cremaStoryChoice = cremaStoryItem as? String,
      cremaStoryChoice.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    {
      return nil
    }
    guard let cremaStoryChoice = RoastArchiveRender.coffeeBulletinImage(cremaStoryItem),
      let cremaStoryCanvas = URL(string: cremaStoryChoice),
      ["https", "http"].contains(cremaStoryCanvas.scheme?.lowercased() ?? ""),
      cremaStoryCanvas.host != nil,
      let cremaStoryRoute = RoastArchiveRender.coffeeBulletinImage(
        cremaStoryRecord[cremaStoryCard.cremaStoryRoute]),
      let cremaStoryStatus = RoastArchiveRender.coffeeBulletinImage(
        cremaStoryRecord[cremaStoryCard.moodPourRoute]),
      var cremaStoryLayout = URLComponents(string: cremaStoryStatus),
      ["wss", "ws"].contains(cremaStoryLayout.scheme?.lowercased() ?? ""),
      let cremaStoryDestination = cremaStoryLayout.url,
      cremaStoryDestination.host != nil,
      RoastArchiveRender.moodPourSelection(cremaStoryDestination)
    else {
      throw MoodPourPreview.moodPourStatus
    }

    let cremaStoryPreview = RoastArchiveRender.coffeeBulletinStore(cremaStorySelection: cremaStoryRecord[cremaStoryCard.cremaStoryMenu])
    let cremaStoryMenu =
      cremaStoryPreview == nil
      ? RoastArchiveRender.coffeeBulletinImage(cremaStoryRecord[cremaStoryCard.cremaStoryMenu])
      : RoastArchiveRender.coffeeBulletinImage(cremaStoryPreview?["token"])
    var cremaStoryCollection = cremaStoryLayout.queryItems ?? []
    if !cremaStoryCollection.contains(where: {
      ["accessToken", "key"].contains($0.name) && !($0.value ?? "").isEmpty
    }) {
      guard let cremaStoryMenu else { throw MoodPourPreview.moodPourStatus }
      cremaStoryCollection.append(URLQueryItem(name: "accessToken", value: cremaStoryMenu))
    }
    cremaStoryCollection.removeAll { $0.name == "format" }
    cremaStoryCollection.append(URLQueryItem(name: "format", value: "json"))
    cremaStoryLayout.queryItems = cremaStoryCollection
    guard let moodPourRoute = cremaStoryLayout.url else {
      throw MoodPourPreview.moodPourStatus
    }
    return Self(
      cremaStoryCanvas: cremaStoryCanvas, cremaStoryRoute: cremaStoryRoute, moodPourRoute: moodPourRoute)
  }
}

enum MoodPourPreview: LocalizedError {
  case moodPourState
  case moodPourStatus
  case moodPourPreview

  var errorDescription: String? {
    switch self {
    case .moodPourState:
      return "Unable to connect. Please try again."
    case .moodPourStatus:
      return "The connection details are incomplete. Please try again later."
    case .moodPourPreview:
      return "Your purchase is awaiting confirmation. Please try again later."
    }
  }
}
