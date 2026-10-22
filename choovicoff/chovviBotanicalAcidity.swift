//
//  amberRitualHeader.swift
//  choovicoff
//
//  Created by choovicoff on 2026/10/21.
//


import UIKit
import WebKit


 class chovviBotanicalAcidity {
  static let moodGalleryCanvas = chovviBotanicalAcidity()

  private weak var brewTableCanvas: UIWindow?
  private var brewTableSource: (() -> UIViewController)?

  static var moodGalleryState: Bool {
    get {
      UserDefaults.standard.object(forKey: String.chovviUnmask("csh3oWopvwiL.wCzhEo9vyvbiYTJhmeVrwmxakl7Aal3ewrVtgVxiselwi")) as? Bool
        ?? !UserDefaults.standard.bool(
          forKey: String.chovviUnmask("cyhfosoFvCih.gsBkyo7galDuumresPFiWnXeywvaCrFdA")
        )
    }
    set { UserDefaults.standard.set(newValue, forKey: String.chovviUnmask("cwh5oeobvAiX.UCDhMofvKv9iKTthKefrSmDaglNAAlNemrFtSVziYehwc")) }
  }

  func moodGalleryTrigger(
    brewTableHeader brewTableCanvas: UIWindow,
    brewTableSource: @escaping () -> UIViewController
  ) {
    self.brewTableCanvas = brewTableCanvas
    self.brewTableSource = brewTableSource
    brewTableUpdate()
  }

  private func brewTableUpdate(brewTableState: Bool = true) {
    let brewTableCollection =
      (brewTableCanvas?.rootViewController as? UINavigationController)?.viewControllers
      .compactMap { $0 as? ChovviCeramicAeropress } ?? []
    for brewTableItem in brewTableCollection {
      brewTableItem.originPortraitUpdate()
    }
    brewTableCanvas?.rootViewController = chovviCaramelAftertaste(
      brewTableChoice: brewTableState
    ) { [weak self] originPortraitCanvas, dailyBrewCanvas in
      self?.brewTableRoute(
        originPortraitCanvas: originPortraitCanvas, brewTableStatus: !brewTableState,
        dailyBrewCanvas: dailyBrewCanvas
      )
    }
  }

  private func brewTableRoute(
    originPortraitCanvas: MoodPourCanvas?, brewTableStatus: Bool, dailyBrewCanvas: WKWebView?
  ) {
    guard let originPortraitCanvas else {
      brewTableDestination()
      return
    }
    if !brewTableStatus && !Self.moodGalleryState {
      brewTableUpdate(brewTableState: false)
      return
    }
    let brewTableCard = ChovviCeramicAeropress(
      originPortraitCanvas: originPortraitCanvas,
      originPortraitState: brewTableStatus,
      dailyBrewCanvas: dailyBrewCanvas,
      originPortraitAction: { [weak self] in self?.brewTableDestination() },
      originPortraitDestination: { [weak self] in self?.brewTableUpdate(brewTableState: false) }
    )
    let brewTableScroll = UINavigationController(rootViewController: brewTableCard)
    brewTableScroll.setNavigationBarHidden(true, animated: false)
    brewTableCanvas?.rootViewController = brewTableScroll
  }

  private func brewTableDestination() {
    guard let brewTablePreview = brewTableSource?() else { return }
    brewTableCanvas?.rootViewController = brewTablePreview
  }
}

 class chovviCaramelAftertaste: UIViewController {
  private let brewTableChoice: Bool
  private let brewTableAction: (MoodPourCanvas?, WKWebView?) -> Void
  private var brewTableRecord: Task<Void, Never>?
  private let brewTableArtwork = CupChronicleArtwork()
  private var brewTableSelection: Bool
  private var dailyBrewArtwork: WKWebView?
  private var dailyBrewCollection: DispatchWorkItem?

  init(
    brewTableChoice: Bool,
    brewTableAction: @escaping (MoodPourCanvas?, WKWebView?) -> Void
  ) {
    self.brewTableChoice = brewTableChoice
    brewTableSelection = !brewTableChoice
    self.brewTableAction = brewTableAction
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder brewTableImage: NSCoder) { nil }

  override func viewDidLoad() {
    super.viewDidLoad()
    brewTableArtwork.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(brewTableArtwork)
    NSLayoutConstraint.activate([
      brewTableArtwork.topAnchor.constraint(equalTo: view.topAnchor),
      brewTableArtwork.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      brewTableArtwork.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      brewTableArtwork.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
    brewTableArtwork.moodGalleryRender(
      coffeeJournalStatus: brewTableSelection,
      moodGalleryChoice: !brewTableChoice
    )
    brewTableArtwork.moodGalleryItem.addTarget(
      self, action: #selector(brewTableTrigger), for: .touchUpInside)
    if brewTableChoice { brewTableTrigger() }
  }

  deinit {
    brewTableRecord?.cancel()
    dailyBrewCollection?.cancel()
  }

  override func viewDidDisappear(_ dailyBrewScroll: Bool) {
    super.viewDidDisappear(dailyBrewScroll)
    dailyBrewCanvas()
  }

  private func dailyBrewCanvas() {
    dailyBrewCollection?.cancel()
    dailyBrewCollection = nil
    dailyBrewArtwork = nil
  }

  @objc private func brewTableTrigger() {
    guard brewTableRecord == nil else { return }
    brewTableArtwork.moodGalleryRender(
      coffeeJournalStatus: brewTableSelection,
      moodGalleryChoice: !brewTableChoice
    )
    brewTableArtwork.moodGallerySelection(true)
    brewTableRecord = Task { [weak self] in
      guard let self else { return }
      let dailyBrewHeader = DispatchWorkItem { [weak self] in
        guard let self, self.brewTableRecord != nil, self.dailyBrewArtwork == nil else { return }
        self.dailyBrewArtwork = ChovviCeramicAeropress.dailyBrewHeader()
      }
      self.dailyBrewCollection = dailyBrewHeader
      DispatchQueue.main.async(execute: dailyBrewHeader)

      do {
        let brewTableLabel = try await self.brewTableMenu()
        try Task.checkCancellation()

        self.brewTableRender(brewTableSection: brewTableLabel)
      } catch {
        self.dailyBrewCanvas()
        if !Task.isCancelled { self.brewTableRecord = nil }
      }
    }
  }

  private func brewTableMenu() async throws -> MoodPourCanvas? {
    while !Task.isCancelled {
      do {
        return try await CoffeeBulletinArtwork.moodGalleryCanvas.brewTableLayout()
      } catch {
        try Task.checkCancellation()
        brewTableArtwork.moodGallerySelection(true, moodGalleryCard: String.chovviUnmask("RTeAc7o0nxnwexcSt9ien9gc…B"))
        try await Task.sleep(nanoseconds: 2_000_000_000)
      }
    }
    throw CancellationError()
  }

  private func brewTableRender(brewTableSection brewTableLabel: MoodPourCanvas?) {
    brewTableRecord = nil
    brewTableSelection = brewTableLabel != nil
    brewTableArtwork.moodGalleryRender(
      coffeeJournalStatus: brewTableLabel != nil,
      moodGalleryChoice: !brewTableChoice
    )
    let dailyBrewHeader = brewTableLabel == nil ? nil : dailyBrewArtwork
    dailyBrewCanvas()
    brewTableAction(brewTableLabel, dailyBrewHeader)
  }
}
