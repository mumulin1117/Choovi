//
//  CoffeeBulletinArtwork.swift
//  choovicoff
//
//  Created by choovicoff on 2026/10/21.
//


import Foundation


final class CoffeeBulletinArtwork {
  static let moodGalleryCanvas = CoffeeBulletinArtwork()



  func brewTableLayout() async throws -> MoodPourCanvas? {
    let cupChroniclePreview = try await cupChronicleDestination(
      cupChronicleSection: RoastArchiveRender.roastShelfHeader,
      cupChronicleLayout: cupChronicleSource()
    )
    return try MoodPourCanvas.moodPourDestination(cremaStorySelection: cupChroniclePreview)
  }

  func cupChronicleTrigger() async throws {
    var cupChronicleLayout = cupChronicleSource()
    cupChronicleLayout[RoastArchiveRender.roastShelfCollection.beanPassportCollection] = 2
    _ = try await cupChronicleDestination(cupChronicleSection: RoastArchiveRender.roastShelfHeader, cupChronicleLayout: cupChronicleLayout)
  }

  private func cupChronicleSource() -> [String: Any] {
    let cupChronicleMenu = RoastArchiveRender.roastShelfCollection
    var cupChronicleLayout: [String: Any] = [
        cupChronicleMenu.beanPassportCanvas: RoastShelfLabel.beanPassportRecord(),
      cupChronicleMenu.beanPassportHeader: Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")
        as? String ?? "1.2",
    ]
    if let cremaStoryLabel = RoastArchiveRender.coffeeBulletinImage(
      UserDefaults.standard.string(forKey: CoffeeBulletinState.beanPassportArtwork)
    ) {
      cupChronicleLayout[cupChronicleMenu.beanPassportArtwork] = cremaStoryLabel
    }
    return cupChronicleLayout
  }

  func cupChronicleUpdate(
    cupChronicleItem: String,
    cupChronicleScroll: String,
    moodGallerySection: String
  ) async throws {
    let cupChronicleMenu = RoastArchiveRender.roastShelfCollection
    _ = try await cupChronicleDestination(
      cupChronicleSection: RoastArchiveRender.roastShelfArtwork,
      cupChronicleLayout: [
        cupChronicleMenu.beanPassportStack: cupChronicleItem,
        cupChronicleMenu.beanPassportState: cupChronicleScroll,
        cupChronicleMenu.beanPassportRender: moodGallerySection,
      ],
      cupChronicleSelection: true
    )
  }

  private func cupChronicleDestination(
    cupChronicleSection: String,
    cupChronicleLayout: [String: Any],
    cupChronicleSelection: Bool = false
  ) async throws -> [String: Any] {
    let cupChronicleRoute = RoastArchiveRender.roastShelfCanvas.appendingPathComponent(cupChronicleSection)
    var cupChronicleRecord = URLRequest(
      url: cupChronicleRoute, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 20)
    cupChronicleRecord.httpMethod = "POST"
    cupChronicleRecord.setValue("application/json", forHTTPHeaderField: "Content-Type")
    cupChronicleRecord.httpBody = try JSONSerialization.data(withJSONObject: cupChronicleLayout)
    let (cupChronicleImage, cupChroniclePreview) = try await URLSession.shared.data(for: cupChronicleRecord)
    try Task.checkCancellation()
    guard let cremaStoryHeader = cupChroniclePreview as? HTTPURLResponse,
      (200..<300).contains(cremaStoryHeader.statusCode),
      let cupChronicleCard = try JSONSerialization.jsonObject(with: cupChronicleImage) as? [String: Any]
    else {
      throw MoodPourPreview.moodPourState
    }
    if cupChronicleSelection && !cupChronicleCard.isEmpty {
      throw MoodPourPreview.moodPourPreview
    }
    return cupChronicleCard
  }
}
