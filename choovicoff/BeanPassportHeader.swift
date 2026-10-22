//
//  BeanPassportHeader.swift
//  choovicoff
//
//  Created by choovicoff on 2026/10/21.
//


import AVFoundation
import SafariServices
import UIKit
import UserNotifications
import WebKit



private final class BeanPassportHeader: NSObject, WKScriptMessageHandler {
  weak var originPortraitSelection: ChovviCeramicAeropress?

  func userContentController(_ brewGatheringCanvas: WKUserContentController, didReceive brewGatheringArtwork: WKScriptMessage) {
    originPortraitSelection?.userContentController(brewGatheringCanvas, didReceive: brewGatheringArtwork)
  }
}

final class ChovviCeramicAeropress: UIViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
  private let originPortraitCanvas: MoodPourCanvas
  private let originPortraitRoute: ChovviCeramicBody
  private let originPortraitAction: () -> Void
  private let originPortraitDestination: () -> Void
  private let originPortraitState: Bool
  private let originPortraitHeader = CupChronicleArtwork()
  private var originPortraitRecord: WKNavigation?
  private var originPortraitArtwork: WKWebView!
  private let originPortraitPreview = UIActivityIndicatorView(style: .large)
  private var originPortraitStatus = false
  private var originPortraitChoice = false
  private var originPortraitTrigger = false
  private var originPortraitCollection: [[String: Any]] = []
  private var originPortraitItem: DispatchWorkItem?
  private var originPortraitStack: [NSObjectProtocol] = []
  private var originPortraitLabel: String?
  private weak var originPortraitRender: ChovviCeramicAcidity?
  private var originPortraitLayout: DispatchWorkItem?
  private var originPortraitScroll: Task<Void, Never>?
  private var originPortraitSection = false


  static func dailyBrewHeader() -> WKWebView {

    let dailyBrewCanvas = WKWebViewConfiguration()
    dailyBrewCanvas.allowsInlineMediaPlayback = true
    dailyBrewCanvas.mediaTypesRequiringUserActionForPlayback = []
    return WKWebView(frame: .zero, configuration: dailyBrewCanvas)
  }

  init(
    originPortraitCanvas: MoodPourCanvas, originPortraitState: Bool,
    dailyBrewCanvas: WKWebView? = nil,
    originPortraitAction: @escaping () -> Void, originPortraitDestination: @escaping () -> Void
  ) {
    self.originPortraitCanvas = originPortraitCanvas
    self.originPortraitState = originPortraitState
    self.originPortraitAction = originPortraitAction
    self.originPortraitDestination = originPortraitDestination
    originPortraitRoute = ChovviCeramicBody(originPortraitCanvas: originPortraitCanvas)
    originPortraitArtwork = dailyBrewCanvas
    super.init(nibName: nil, bundle: nil)
  }
  func webView(_ originPortraitArtwork: WKWebView, didFinish brewGatheringRecord: WKNavigation!) {
    guard let brewGatheringRecord, !originPortraitTrigger, brewGatheringRecord === originPortraitRecord else { return }

    chovviBotanicalAcidity.moodGalleryState = true
    originPortraitItem?.cancel()
    originPortraitScroll?.cancel()
    originPortraitScroll = nil
    originPortraitStatus = true
    beanIdentityLayout()
    beanIdentityRender()
    beanIdentitySource()
    guard !originPortraitHeader.isHidden else { return }
    originPortraitArtwork.isHidden = false
    UIView.animate(
      withDuration: UIAccessibility.isReduceMotionEnabled ? 0 : 0.3,
      delay: 0, options: [.beginFromCurrentState, .curveEaseInOut]
    ) {
      originPortraitArtwork.alpha = 1
      self.originPortraitHeader.alpha = 0
    } completion: { [weak self, weak originPortraitArtwork] _ in
      guard let self, !self.originPortraitTrigger, self.originPortraitStatus,
        brewGatheringRecord === self.originPortraitRecord
      else { return }
      self.originPortraitHeader.isHidden = true
      self.originPortraitHeader.moodGallerySelection(false)
      originPortraitArtwork?.isUserInteractionEnabled = true
    }
  }

  required init?(coder brewGatheringSource: NSCoder) { nil }

  func userContentController(_ brewGatheringCanvas: WKUserContentController, didReceive brewGatheringArtwork: WKScriptMessage) {
    guard brewGatheringArtwork.frameInfo.isMainFrame,
      let coffeeJournalRoute = brewGatheringArtwork.frameInfo.request.url,
      RoastArchiveRender.moodPourCard(coffeeJournalRoute, originPortraitCanvas.cremaStoryCanvas),
      [RoastArchiveRender.roastShelfAction.journalDraftHeader, String.chovviUnmask("CJlGoRsye7")].contains(brewGatheringArtwork.name)
    else { return }
    beanIdentityDestination([
      RoastArchiveRender.roastShelfState.coffeeBulletinArtwork: RoastArchiveRender.roastShelfAction.journalDraftHeader
    ])
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 4 / 255, green: 3 / 255, blue: 19 / 255, alpha: 1)

    let brewGatheringCanvas = originPortraitArtwork?.configuration ?? WKWebViewConfiguration()
    let originPortraitSelection = BeanPassportHeader()
    originPortraitSelection.originPortraitSelection = self
    for brewGatheringArtwork in [RoastArchiveRender.roastShelfAction.journalDraftHeader, String.chovviUnmask("CylVomsFei")] {
      brewGatheringCanvas.userContentController.add(originPortraitSelection, name: brewGatheringArtwork)
    }
    brewGatheringCanvas.allowsInlineMediaPlayback = true
    brewGatheringCanvas.mediaTypesRequiringUserActionForPlayback = []
    if originPortraitArtwork == nil {
      originPortraitArtwork = WKWebView(frame: .zero, configuration: brewGatheringCanvas)
    }
    originPortraitArtwork.translatesAutoresizingMaskIntoConstraints = false
    originPortraitArtwork.navigationDelegate = self
    originPortraitArtwork.uiDelegate = self
    originPortraitArtwork.isOpaque = false
    originPortraitArtwork.backgroundColor = view.backgroundColor
    originPortraitArtwork.scrollView.backgroundColor = view.backgroundColor
    originPortraitArtwork.scrollView.contentInsetAdjustmentBehavior = .never
    originPortraitArtwork.scrollView.keyboardDismissMode = .interactive
    originPortraitArtwork.allowsBackForwardNavigationGestures = true

    originPortraitArtwork.isHidden = true
    view.addSubview(originPortraitArtwork)
    originPortraitHeader.translatesAutoresizingMaskIntoConstraints = false
    originPortraitHeader.moodGalleryRender(coffeeJournalStatus: true, moodGalleryChoice: originPortraitState)
    originPortraitHeader.moodGalleryItem.addTarget(self, action: #selector(beanIdentityUpdate), for: .touchUpInside)
    view.addSubview(originPortraitHeader)
    originPortraitPreview.translatesAutoresizingMaskIntoConstraints = false
    originPortraitPreview.color = .white
    originPortraitPreview.hidesWhenStopped = true
    view.addSubview(originPortraitPreview)
    NSLayoutConstraint.activate([
      originPortraitArtwork.topAnchor.constraint(equalTo: view.topAnchor),
      originPortraitArtwork.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      originPortraitArtwork.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      originPortraitArtwork.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      originPortraitHeader.topAnchor.constraint(equalTo: view.topAnchor),
      originPortraitHeader.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      originPortraitHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      originPortraitHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      originPortraitPreview.centerXAnchor.constraint(
        equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      originPortraitPreview.centerYAnchor.constraint(
        equalTo: view.safeAreaLayoutGuide.centerYAnchor),
    ])
    originPortraitRoute.moodGalleryAction = { [weak self] in self?.beanIdentityDestination($0, coffeeJournalRecord: $1) }
    originPortraitRoute.moodGallerySource = { [weak self] in
      self?.originPortraitUpdate()
      self?.originPortraitAction()
    }
    originPortraitRoute.moodGalleryDestination = { [weak self] in
      self?.originPortraitUpdate()
      self?.originPortraitDestination()
    }
    CupKeeperStack.moodGalleryCanvas.moodGalleryCollection = {
      [weak self] coffeeJournalState, coffeeJournalArtwork in
      guard let self, !self.originPortraitTrigger,
        coffeeJournalState == self.originPortraitCanvas.cremaStoryRoute
      else { return false }
      self.beanIdentityCollection(coffeeJournalArtwork)
      self.beanIdentityPreview(coffeeJournalArtwork)
      return true
    }
    CupKeeperStack.moodGalleryCanvas.moodGalleryUpdate(originPortraitCanvas.cremaStoryRoute)
    originPortraitStack.append(
      NotificationCenter.default.addObserver(
        forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: .main
      ) { [weak self] _ in
        MainActor.assumeIsolated { self?.originPortraitRoute.originPortraitUpdate() }
      })
    originPortraitStack.append(
      NotificationCenter.default.addObserver(
        forName: UIApplication.didBecomeActiveNotification, object: nil, queue: .main
      ) { [weak self] _ in
        MainActor.assumeIsolated {
          guard let self, self.originPortraitChoice, !self.originPortraitTrigger else { return }
          self.originPortraitRoute.moodGalleryTrigger()
        }
      })
    beanIdentityUpdate()
  }

  override func viewDidAppear(_ brewGatheringChoice: Bool) {
    super.viewDidAppear(brewGatheringChoice)
    originPortraitChoice = true
    if !originPortraitTrigger { originPortraitRoute.moodGalleryTrigger() }
    beanIdentityRender()
  }

  override func viewWillDisappear(_ brewGatheringChoice: Bool) {
    super.viewWillDisappear(brewGatheringChoice)
    originPortraitChoice = false
    if !(presentedViewController is SFSafariViewController) { originPortraitRoute.originPortraitUpdate() }
  }

  deinit {
    originPortraitItem?.cancel()
    for coffeeJournalItem in originPortraitStack {
      NotificationCenter.default.removeObserver(coffeeJournalItem)
    }
  }

  func originPortraitUpdate() {
    originPortraitTrigger = true
    originPortraitChoice = false
    originPortraitItem?.cancel()
    originPortraitScroll?.cancel()
    originPortraitScroll = nil
    originPortraitLayout?.cancel()
    originPortraitRender?.removeFromSuperview()
    originPortraitRecord = nil
    originPortraitHeader.layer.removeAllAnimations()
    originPortraitArtwork?.layer.removeAllAnimations()
    originPortraitRoute.originPortraitUpdate()
    originPortraitArtwork?.stopLoading()
    try? AVAudioSession.sharedInstance().setActive(false, options: [.notifyOthersOnDeactivation])
    originPortraitCollection.removeAll()
  }

  private func beanIdentitySource() {
    guard !originPortraitSection else { return }
    originPortraitSection = true
    Task {
      let coffeeJournalSource = UNUserNotificationCenter.current()
      if await coffeeJournalSource.notificationSettings().authorizationStatus == .notDetermined {
        _ = try? await coffeeJournalSource.requestAuthorization(options: [.alert, .badge, .sound])
      }
      UIApplication.shared.registerForRemoteNotifications()
    }
  }

  @objc private func beanIdentityUpdate() {
    originPortraitScroll?.cancel()
    originPortraitScroll = nil
    originPortraitStatus = false
    originPortraitHeader.layer.removeAllAnimations()
    originPortraitArtwork.layer.removeAllAnimations()
    originPortraitHeader.alpha = 1
    originPortraitHeader.isHidden = false
    originPortraitHeader.moodGalleryItem.setTitle(String.chovviUnmask("QquHiccBky bLWorgyirnW"), for: .normal)
    originPortraitHeader.moodGalleryItem.isHidden = !originPortraitState
    originPortraitHeader.moodGallerySelection(true)
    originPortraitArtwork.isHidden = true
    originPortraitArtwork.alpha = 0
    originPortraitArtwork.isUserInteractionEnabled = false
    originPortraitRecord = originPortraitArtwork.load(URLRequest(url: originPortraitCanvas.cremaStoryCanvas))
    originPortraitItem?.cancel()
    let coffeeJournalTrigger = DispatchWorkItem { [weak self] in self?.beanIdentityTrigger() }
    originPortraitItem = coffeeJournalTrigger
    DispatchQueue.main.asyncAfter(deadline: .now() + 30, execute: coffeeJournalTrigger)
  }

  private func beanIdentityTrigger() {
    guard !originPortraitTrigger, originPortraitScroll == nil else { return }
    originPortraitItem?.cancel()
    originPortraitRecord = nil
    originPortraitStatus = false
    originPortraitArtwork.stopLoading()
    originPortraitHeader.layer.removeAllAnimations()
    originPortraitArtwork.layer.removeAllAnimations()
    originPortraitHeader.alpha = 1
    originPortraitHeader.isHidden = false
    originPortraitHeader.moodGalleryRender(coffeeJournalStatus: true, moodGalleryChoice: originPortraitState)
    originPortraitHeader.moodGalleryItem.setTitle(String.chovviUnmask("QQuHiAcxkm vLEoJgOifnm"), for: .normal)
    originPortraitHeader.moodGalleryItem.isHidden = !originPortraitState
    originPortraitHeader.moodGallerySelection(true, moodGalleryCard: String.chovviUnmask("RHeCcfo4nlnWeFc6thian9gE…l"))
    originPortraitArtwork.isHidden = true
    originPortraitArtwork.alpha = 0

    originPortraitScroll = Task { [weak self] in
      try? await Task.sleep(nanoseconds: 2_000_000_000)
      guard let self else { return }
      guard !Task.isCancelled else { return }
      self.originPortraitScroll = nil
      self.beanIdentityUpdate()
    }
  }

  override func viewSafeAreaInsetsDidChange() {
    super.viewSafeAreaInsetsDidChange()
    if isViewLoaded { beanIdentityLayout() }
  }

  private func beanIdentityLayout() {
    let coffeeJournalCanvas: [String: Any] = [
      String.chovviUnmask("cVoGz5yUBxaccvkigfrSozuanFdWDXo0lllinnoyrdoM"): view.safeAreaInsets.top,
      String.chovviUnmask("wsipn8tFeCrVBQavcukLgkrlomuFnYd9DMonlolBpwafvIo5"): view.safeAreaInsets.bottom,
    ]
    originPortraitArtwork?.callAsyncJavaScript(
      String.chovviUnmask("dQohcmubmse3nWtx.id5oSc3uSmle2nhtEExlce7m8eNnctr.ms3tiyjlWen.ssheqtXPorNoMpFeirJtSyl(K\'H-8-tc2oJz6yLBqazcUkrgUrjocuvn6dFDSojlUlTnKoVr4oN\'o,B Qc3o8zhysBXaKc9ksgJrqoPu6n9dODFoQl7lQnboQrxoc J+w b\'Aplxs\'D)0;b mdzo8cVuQmheKnLto.BdSolcMu5mqeBnYtdEWlheMmJegnDtE.dsatBymlNew.PsuevtsPVrKoVpge3rithy0(f\'C-F-Ewdian1tmeZrsBTaUcDkcgjrCoFu4nPdGDHo6l5lIpja0vHog\'z,k 5weiznktDeKrlBYapcAkxgqrzowuDn2dBDwoLlQl5pma5vwo5 g+5 c\'tpuxn\'o)Z;q"),
      arguments: coffeeJournalCanvas, in: nil, in: .page, completionHandler: nil)
  }

  private func beanIdentityDestination(_ brewGatheringArtwork: [String: Any], coffeeJournalRecord: TimeInterval? = nil) {
    guard !originPortraitTrigger else { return }
    guard let coffeeJournalChoice = RoastArchiveRender.coffeeBulletinChoice(cremaStorySource: brewGatheringArtwork) else {
      return
    }
    let coffeeJournalCollection = RoastArchiveRender.coffeeBulletinCanvas(cremaStorySource: brewGatheringArtwork)
    switch coffeeJournalChoice {
    case RoastArchiveRender.roastShelfAction.journalDraftCanvas:
      if let coffeeJournalRecord, Date().timeIntervalSince1970 * 1000 - coffeeJournalRecord > 120_000 {
        return
      }
      guard originPortraitChoice else {
        return
      }
      guard let coffeeJournalCard = RoastArchiveRender.coffeeBulletinRecord(cremaStorySource: coffeeJournalCollection) else {
        let coffeeJournalLabel = RoastArchiveRender.coffeeBulletinLast(cremaStorySource: coffeeJournalCollection)
        let coffeeJournalPreview =
          coffeeJournalLabel == nil
          ? String.chovviUnmask("Tqhtiksn Kpvr0oBdiuZc6tH UiTsy FusnZaOv9awiZlWa7bwllei.H KPvlGeHaSsvey Xtor5yk dakgFaainni llga5tgeFrY.X")
          : String.chovviUnmask("TNhQeJ 8pLuArHcWhHaQste6 JrWeHqIuReOsDtO hi2sp YiVnOvhaclVi4dj.8 lPklleIa5siel 2tvrky3 ca9gQahiOnt il1a8tneEr9.W")
        let coffeeJournalHeader = RoastArchiveRender.roastShelfRender
        let coffeeJournalArtwork: [String: Any] = [
          coffeeJournalHeader.cupChronicleCanvas: RoastArchiveRender.roastShelfAction.journalDraftCollection,
          coffeeJournalHeader.cupChronicleHeader: "",
          coffeeJournalHeader.cupChronicleArtwork: coffeeJournalLabel ?? "",
          coffeeJournalHeader.cupChronicleCollection: false,
          coffeeJournalHeader.cupChronicleStack: String.chovviUnmask("fnaGitlIetdo"),
          coffeeJournalHeader.coffeeBulletinScroll: coffeeJournalPreview,
          coffeeJournalHeader.cupChronicleState: coffeeJournalLabel == nil ? String.chovviUnmask("porXoMdZuwcJtgUBn4aPv6abi0lxaMbZlWeT") : String.chovviUnmask("oxrodxeKrVUOntaqvTaIiZlgazbSlle2"),
        ]
        beanIdentityCollection(coffeeJournalArtwork)
        beanIdentityPreview(coffeeJournalArtwork)
        return
      }
      Task { [weak self] in
        guard let self else { return }
        self.originPortraitPreview.startAnimating()
        await CupKeeperStack.moodGalleryCanvas.moodGalleryPreview(
          coffeeJournalLabel: coffeeJournalCard.cupChronicleArtwork,
          moodGallerySection: coffeeJournalCard.cupChronicleChoice,
          coffeeJournalState: self.originPortraitCanvas.cremaStoryRoute
        )
        if !CupKeeperStack.moodGalleryCanvas.moodGalleryStatus {
          self.originPortraitPreview.stopAnimating()
        }
      }
    case RoastArchiveRender.roastShelfAction.journalDraftHeader:
      chovviBotanicalAcidity.moodGalleryState = false
      originPortraitUpdate()
      Task { [weak self] in
        guard let self else { return }
        await self.beanIdentityRecord()
        self.originPortraitDestination()
      }
    case RoastArchiveRender.roastShelfAction.journalDraftArtwork:
      guard originPortraitChoice,
        let coffeeJournalImage = RoastArchiveRender.coffeeBulletinPath(cremaStorySource: coffeeJournalCollection),
        let coffeeJournalRoute = URL(string: coffeeJournalImage)
      else { return }
      beanIdentityRoute(coffeeJournalRoute) { [weak self] coffeeJournalStatus in
        let coffeeJournalHeader = RoastArchiveRender.roastShelfRender
        self?.beanIdentityCollection([
          coffeeJournalHeader.cupChronicleCanvas: coffeeJournalHeader.cupChronicleRender,
          coffeeJournalHeader.cupChronicleAction: coffeeJournalStatus ? String.chovviUnmask("sCujcWcZeAsDsc") : String.chovviUnmask("fwaDiUlZesdp"),
          coffeeJournalHeader.cupChronicleLabel: coffeeJournalHeader.cupChronicleStatus,
        ])
      }
    case RoastArchiveRender.roastShelfAction.journalDraftStack:
      beanIdentityCollection(brewGatheringArtwork)
    default:
      return
    }
  }

  private func beanIdentityCollection(_ brewGatheringArtwork: [String: Any]) {
    guard !originPortraitTrigger else { return }
    originPortraitCollection.append(brewGatheringArtwork)
    if originPortraitCollection.count > 256 { originPortraitCollection.removeFirst() }
    beanIdentityRender()
  }

  private func beanIdentityPreview(_ coffeeJournalArtwork: [String: Any]) {
    let coffeeJournalHeader = RoastArchiveRender.roastShelfRender
    guard originPortraitChoice,
      RoastArchiveRender.coffeeBulletinImage(coffeeJournalArtwork[coffeeJournalHeader.cupChronicleCanvas])
        == RoastArchiveRender.roastShelfAction.journalDraftCollection,
      let coffeeJournalSelection = RoastArchiveRender.coffeeBulletinImage(coffeeJournalArtwork[coffeeJournalHeader.cupChronicleStack])
    else { return }
    let coffeeJournalScroll = RoastArchiveRender.coffeeBulletinImage(coffeeJournalArtwork[coffeeJournalHeader.cupChronicleState])
    let brewGatheringArtwork =
      RoastArchiveRender.coffeeBulletinImage(coffeeJournalArtwork[coffeeJournalHeader.coffeeBulletinScroll])
      ?? String.chovviUnmask("UbnkaLbWlXew zt2o9 Mclowmjpsl5eMtHeC Htqhbea vpIuhrecDhAa7sWex.a LPwlFeEa3sken MtPrCyD 2aVgEaJiGnj qlPaYt5eMrT.q")
    let coffeeJournalSection =
      RoastArchiveRender.coffeeBulletinImage(coffeeJournalArtwork[coffeeJournalHeader.cupChronicleHeader])
      ?? RoastArchiveRender.coffeeBulletinImage(coffeeJournalArtwork[coffeeJournalHeader.cupChronicleArtwork]) ?? ""
    let coffeeJournalLayout = [coffeeJournalSection, coffeeJournalSelection, coffeeJournalScroll ?? "", brewGatheringArtwork].joined(separator: String.chovviUnmask("|h"))
    guard originPortraitLabel != coffeeJournalLayout else { return }

    var coffeeJournalRender = String.chovviUnmask("PqujrKchhkals6ex SFnawiZlWendU")
    var coffeeJournalAction = UIColor(red: 1, green: 0.36, blue: 0.47, alpha: 1)
    var coffeeJournalDestination = String.chovviUnmask("xsmxaYrlku")
    if coffeeJournalArtwork[coffeeJournalHeader.cupChronicleCollection] as? Bool == true || coffeeJournalSelection == String.chovviUnmask("v8ezr8ijfSiZeqd7") {
      coffeeJournalRender = String.chovviUnmask("PDuCrtc4hXa6s9e4 ZSquLc8cFeusds0f5uWlj")
      coffeeJournalAction = UIColor(red: 0.25, green: 0.85, blue: 0.59, alpha: 1)
      coffeeJournalDestination = String.chovviUnmask("c5hMehcEkBmSa1rSkD")
    } else if [
      String.chovviUnmask("vuexrSilfGixcaartsiloynVPKebngdHionbgS"), String.chovviUnmask("pDuYrDc6h5aSs7e0PxeYnbd0ijnggP"), String.chovviUnmask("pEuNrUcBhma7seePUcn1vwe9rSiVfAine0d9"), String.chovviUnmask("p8uLrecBhaaZs6eXUmnvkwnbo0whnS"),
      String.chovviUnmask("pBuSrRcmhvaKsteUI1nWPVrmorgArdeSstse"), String.chovviUnmask("p5uQrbcmhjaCsle2RbeqtFroyz"),
    ].contains(coffeeJournalScroll ?? "") {
      switch coffeeJournalScroll {
      case String.chovviUnmask("piuxrucnhyaRsqeDPKeVnudViEnhgc"): coffeeJournalRender = String.chovviUnmask("ANwkaPi8tTiYn9gA zAspPp6rloivvaUlp")
      case String.chovviUnmask("psuJr4cDh2aZs2epIen1PirjoUgZrqe1sGsH"): coffeeJournalRender = String.chovviUnmask("PGuFrIcThEaZsweV OiZn2 nPUrHogghr2eFsIsL")
      case String.chovviUnmask("p4uXrgc9hkaDsUejUYnfvqeJr2ilfYiDeqdT"), String.chovviUnmask("pOuVrAc9h8avswerU8nJkanLoawHnw"): coffeeJournalRender = String.chovviUnmask("PjuIrVcUhdaCsveo XUgnfcWoRnIfziwr5mIeVdg")
      case String.chovviUnmask("pHu0rdcahTagsDeMR7ewtDr2yZ"): coffeeJournalRender = String.chovviUnmask("RSe7aWdFy2 dtcoB mTLrWy7 yApgyajiYnx")
      default: coffeeJournalRender = String.chovviUnmask("P4ujrqcVhsa9sCef gPNrQolcWe7sAsniMnZgi")
      }
      coffeeJournalAction = UIColor(red: 0.50, green: 0.67, blue: 0.94, alpha: 1)
      coffeeJournalDestination = String.chovviUnmask("cvlColc6kP")
    } else if [String.chovviUnmask("pcr5oMdXuUcXt8U3nea1vYafislRaQbPlYeB"), String.chovviUnmask("pWr3o6dXuIc5tKCboEnvfIihgAudroaXtEi5osnR")].contains(coffeeJournalScroll ?? "") {
      coffeeJournalRender = String.chovviUnmask("PsrRogdtuCcft8 5USnfaYvLaYiRl6aNb6l1e8")
    } else if coffeeJournalScroll == String.chovviUnmask("p3agyrmeeDnEtTsaDHiGsLa2bNlye9dM") {
      coffeeJournalRender = String.chovviUnmask("P4u1rgcZhIaHsyensm TUGn5auvVayiRluabbolXe8")
    } else if coffeeJournalSelection == String.chovviUnmask("cIafnmcfecl9lueTdg") {
      coffeeJournalRender = String.chovviUnmask("PSufr8cvhCatsyex 0CfaCnzcSehlel5eodB")
      coffeeJournalAction = UIColor(red: 0.67, green: 0.61, blue: 0.82, alpha: 1)
    }
    guard viewIfLoaded?.window != nil else { return }
    originPortraitLabel = coffeeJournalLayout
    originPortraitLayout?.cancel()
    originPortraitRender?.removeFromSuperview()

    let beanIdentityCanvas = ChovviCeramicAcidity(
      coffeeJournalRender: coffeeJournalRender,
      brewGatheringArtwork: brewGatheringArtwork,
      coffeeJournalDestination: coffeeJournalDestination,
      coffeeJournalAction: coffeeJournalAction
    )
    view.addSubview(beanIdentityCanvas)
    NSLayoutConstraint.activate([
      beanIdentityCanvas.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      beanIdentityCanvas.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
      beanIdentityCanvas.leadingAnchor.constraint(
        greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
      beanIdentityCanvas.trailingAnchor.constraint(
        lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
      beanIdentityCanvas.widthAnchor.constraint(lessThanOrEqualToConstant: 360),
    ])
    let beanIdentityItem = beanIdentityCanvas.widthAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -48)
    beanIdentityItem.priority = .defaultHigh
    beanIdentityItem.isActive = true
    originPortraitRender = beanIdentityCanvas

    beanIdentityCanvas.alpha = 0
    beanIdentityCanvas.transform = CGAffineTransform(translationX: 0, y: 10).scaledBy(x: 0.94, y: 0.94)
    UIView.animate(
      withDuration: UIAccessibility.isReduceMotionEnabled ? 0.16 : 0.36,
      delay: 0,
      usingSpringWithDamping: 0.78,
      initialSpringVelocity: 0.6,
      options: [.beginFromCurrentState, .curveEaseOut]
    ) {
      beanIdentityCanvas.alpha = 1
      beanIdentityCanvas.transform = .identity
    }
    UIAccessibility.post(notification: .announcement, argument: "\(coffeeJournalRender)\(String.chovviUnmask(".q p"))\(brewGatheringArtwork)")

    let beanIdentityScroll = DispatchWorkItem { [weak self, weak beanIdentityCanvas] in
      guard let self, let beanIdentityCanvas, self.originPortraitRender === beanIdentityCanvas else { return }
      UIView.animate(
        withDuration: UIAccessibility.isReduceMotionEnabled ? 0.12 : 0.22,
        delay: 0, options: [.beginFromCurrentState, .curveEaseIn]
      ) {
        beanIdentityCanvas.alpha = 0
        beanIdentityCanvas.transform = CGAffineTransform(translationX: 0, y: -8).scaledBy(x: 0.97, y: 0.97)
      } completion: { _ in
        beanIdentityCanvas.removeFromSuperview()
        guard self.originPortraitRender === beanIdentityCanvas else { return }
        self.originPortraitRender = nil
        self.originPortraitLabel = nil
      }
    }
    originPortraitLayout = beanIdentityScroll
    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: beanIdentityScroll)
  }

  private func beanIdentityRender() {
    guard originPortraitStatus, originPortraitChoice, !originPortraitTrigger else { return }
    let beanIdentityHeader = originPortraitCollection
    originPortraitCollection.removeAll()
    let coffeeJournalHeader = RoastArchiveRender.roastShelfRender
    for brewGatheringArtwork in beanIdentityHeader {
      if brewGatheringArtwork[coffeeJournalHeader.cupChronicleCanvas] as? String == coffeeJournalHeader.cupChronicleRender {
        originPortraitArtwork.callAsyncJavaScript(
          String.chovviUnmask("wZiWnndgojwM.vd6iLsKpjaEtJcqhrESvveKnFtM(5nCedwe JCQuLsctToumpEQvjeanzt6(Jmeiln4ijBmlNo0u1scezDsohlelRvOalnCiF,8 N{4dVeutZaQiJlq:x yrNiibRbio3nMCZactNecgBoqr1yeDnoaljlapvi2r7ig}B)S)H;E"),
          arguments: [
            String.chovviUnmask("m0ixnSixByljoSuds4ehDEojlOlPvcaJnci1"): coffeeJournalHeader.cupChronicleRender, String.chovviUnmask("rAiPb6bNoQnlC8aRtoe9gQoJrWytD2oXlultpAizrEij"): brewGatheringArtwork,
          ], in: nil, in: .page, completionHandler: nil)
      } else {
        originPortraitArtwork.callAsyncJavaScript(
          String.chovviUnmask("w1iEn7d4oLw8.fd6i1s2pfaut9cehtEyvLesnrt4(hnierwm 1Muevsms7aggDekEBvgeRnitj(S\'zmKehsmsha8gzeM\'z,G r{gdra6tDau:3 qrFiUbPbuo1nECRa2tJeqgFoUrXyODRoal9lQpViirfiy}j)c)H;q"),
          arguments: [String.chovviUnmask("rTiObRbAoBnACFaotveGgXoOrFyiDVomlplCpXiorriS"): brewGatheringArtwork], in: nil, in: .page, completionHandler: nil
        )
      }
    }
  }

  private func beanIdentityRoute(
    _ coffeeJournalRoute: URL,
    coffeeJournalStatus: @escaping (Bool) -> Void = { _ in }
  ) {
    guard [String.chovviUnmask("hYtFtmp7sO"), String.chovviUnmask("h9t6t1pS"), String.chovviUnmask("iFtOmvsS-9aepLpMsN")].contains(coffeeJournalRoute.scheme?.lowercased() ?? ""),
      coffeeJournalRoute.host != nil
    else {
      coffeeJournalStatus(false)
      return
    }
    UIApplication.shared.open(
      coffeeJournalRoute, options: [:], completionHandler: coffeeJournalStatus)
  }

  private func beanIdentityRecord() async {
    guard let beanIdentityMenu = originPortraitCanvas.cremaStoryCanvas.host?.lowercased() else { return }
    let beanIdentityArtwork = originPortraitArtwork.configuration.websiteDataStore
    let beanIdentityStack = WKWebsiteDataStore.allWebsiteDataTypes()
    let beanIdentityLabel = await beanIdentityArtwork.dataRecords(ofTypes: beanIdentityStack)
      .filter { beanIdentityChoice(beanIdentityMenu, $0.displayName) }
    await beanIdentityArtwork.removeData(ofTypes: beanIdentityStack, for: beanIdentityLabel)
  }

  private func beanIdentityChoice(_ beanIdentityMenu: String, _ beanIdentityCard: String) -> Bool {
    let beanIdentityStatus = beanIdentityMenu.lowercased().trimmingCharacters(
      in: CharacterSet(charactersIn: String.chovviUnmask(".j")))
    let beanIdentityImage = beanIdentityCard.lowercased().trimmingCharacters(
      in: CharacterSet(charactersIn: String.chovviUnmask(".u")))
    return beanIdentityStatus == beanIdentityImage
      || beanIdentityStatus.hasSuffix(String.chovviUnmask(".N") + beanIdentityImage)
      || beanIdentityImage.hasSuffix(String.chovviUnmask(".n") + beanIdentityStatus)
  }

  func webView(_ originPortraitArtwork: WKWebView, didStartProvisionalNavigation brewGatheringRecord: WKNavigation!) {
    guard !originPortraitTrigger else { return }

    originPortraitRecord = brewGatheringRecord
    originPortraitStatus = false
  }

  func webView(
    _ originPortraitArtwork: WKWebView, didFailProvisionalNavigation brewGatheringRecord: WKNavigation!,
    withError brewGatheringStatus: Error
  ) {
    guard brewGatheringRecord === originPortraitRecord else { return }
    if (brewGatheringStatus as NSError).code != NSURLErrorCancelled { beanIdentityTrigger() }
  }
  func webView(_ originPortraitArtwork: WKWebView, didFail brewGatheringRecord: WKNavigation!, withError brewGatheringStatus: Error) {
    self.webView(originPortraitArtwork, didFailProvisionalNavigation: brewGatheringRecord, withError: brewGatheringStatus)
  }
  func webViewWebContentProcessDidTerminate(_ originPortraitArtwork: WKWebView) { beanIdentityTrigger() }

  func webView(
    _ originPortraitArtwork: WKWebView, decidePolicyFor brewGatheringAction: WKNavigationAction,
    decisionHandler brewGatheringTrigger: @escaping (WKNavigationActionPolicy) -> Void
  ) {
    guard let brewGatheringRoute = brewGatheringAction.request.url else {
      brewGatheringTrigger(.cancel)
      return
    }
    if brewGatheringRoute.scheme?.lowercased() == String.chovviUnmask("iatdmysx-Ua5pWpDsG") {
      brewGatheringTrigger(.cancel)
      beanIdentityRoute(brewGatheringRoute)
      return
    }
    if brewGatheringAction.targetFrame?.isMainFrame == false {
      brewGatheringTrigger(.allow)
      return
    }
    if RoastArchiveRender.moodPourCard(brewGatheringRoute, originPortraitCanvas.cremaStoryCanvas) {
      brewGatheringTrigger(.allow)
    } else {
      brewGatheringTrigger(.cancel)
      if originPortraitStatus || brewGatheringAction.navigationType == .linkActivated {
        beanIdentityRoute(brewGatheringRoute)
      }
    }

  }

  func webView(
    _ originPortraitArtwork: WKWebView, createWebViewWith brewGatheringHeader: WKWebViewConfiguration,
    for brewGatheringAction: WKNavigationAction, windowFeatures brewGatheringLabel: WKWindowFeatures
  ) -> WKWebView? {
    if let brewGatheringRoute = brewGatheringAction.request.url { beanIdentityRoute(brewGatheringRoute) }
    return nil
  }

  func webView(
    _ originPortraitArtwork: WKWebView, requestMediaCapturePermissionFor brewGatheringIdentity: WKSecurityOrigin,
    initiatedByFrame brewGatheringCollection: WKFrameInfo, type brewGatheringEmblem: WKMediaCaptureType,
    decisionHandler brewGatheringTrigger: @escaping (WKPermissionDecision) -> Void
  ) {
    var brewGatheringLayout = URLComponents()
    brewGatheringLayout.scheme = brewGatheringIdentity.protocol
    brewGatheringLayout.host = brewGatheringIdentity.host
    brewGatheringLayout.port = brewGatheringIdentity.port == 0 ? nil : brewGatheringIdentity.port
    guard let brewGatheringCover = originPortraitArtwork.url,
      RoastArchiveRender.moodPourCard(brewGatheringCover, originPortraitCanvas.cremaStoryCanvas),
      let brewGatheringImage = brewGatheringLayout.url,
      RoastArchiveRender.moodPourCard(brewGatheringImage, originPortraitCanvas.cremaStoryCanvas)
    else {
      brewGatheringTrigger(.deny)
      return
    }
    if brewGatheringEmblem != .camera {
      let brewGatheringReserve = AVAudioSession.sharedInstance()
      do {
        try brewGatheringReserve.setCategory(.playAndRecord, mode: .videoChat)
        try brewGatheringReserve.setActive(true)
      } catch {
        brewGatheringTrigger(.deny)
        return
      }
    }
    brewGatheringTrigger(.grant)
  }
}


private final class ChovviCeramicAcidity: UIView {
  private let moodGalleryArtwork = CAGradientLayer()

  init(coffeeJournalRender: String, brewGatheringArtwork: String, coffeeJournalDestination: String, coffeeJournalAction: UIColor) {
    super.init(frame: .zero)
    translatesAutoresizingMaskIntoConstraints = false
    isUserInteractionEnabled = false
    isAccessibilityElement = true
    accessibilityIdentifier = String.chovviUnmask("cWhDoqorvmiV.Kcdoumz.Ac5oiflfis1iUnddEyz.Actheorokvvi4")
    accessibilityLabel = "\(coffeeJournalRender)\(String.chovviUnmask(".4 T"))\(brewGatheringArtwork)"
    backgroundColor = UIColor(red: 0.08, green: 0.055, blue: 0.16, alpha: 0.97)
    layer.cornerRadius = 22
    layer.borderWidth = 1
    layer.borderColor = coffeeJournalAction.withAlphaComponent(0.48).cgColor
    layer.shadowColor = coffeeJournalAction.withAlphaComponent(0.55).cgColor
    layer.shadowOpacity = 0.72
    layer.shadowRadius = 22
    layer.shadowOffset = CGSize(width: 0, height: 10)

    moodGalleryArtwork.colors = [
      coffeeJournalAction.withAlphaComponent(0.22).cgColor,
      UIColor(red: 0.11, green: 0.07, blue: 0.22, alpha: 0.05).cgColor,
    ]
    moodGalleryArtwork.startPoint = CGPoint(x: 0, y: 0)
    moodGalleryArtwork.endPoint = CGPoint(x: 1, y: 1)
    moodGalleryArtwork.cornerRadius = 22
    layer.insertSublayer(moodGalleryArtwork, at: 0)

    let moodGalleryHeader = UIView()
    moodGalleryHeader.translatesAutoresizingMaskIntoConstraints = false
    moodGalleryHeader.backgroundColor = coffeeJournalAction.withAlphaComponent(0.18)
    moodGalleryHeader.layer.cornerRadius = 23
    moodGalleryHeader.layer.borderWidth = 1
    moodGalleryHeader.layer.borderColor = coffeeJournalAction.withAlphaComponent(0.52).cgColor

    let moodGalleryImage = UIImageView(image: UIImage(systemName: coffeeJournalDestination))
    moodGalleryImage.translatesAutoresizingMaskIntoConstraints = false
    moodGalleryImage.contentMode = .scaleAspectFit
    moodGalleryImage.tintColor = coffeeJournalAction
    moodGalleryImage.preferredSymbolConfiguration = UIImage.SymbolConfiguration(
      pointSize: 20, weight: .bold)
    moodGalleryHeader.addSubview(moodGalleryImage)

    let moodGalleryLabel = UILabel()
    moodGalleryLabel.translatesAutoresizingMaskIntoConstraints = false
    moodGalleryLabel.text = coffeeJournalRender
    moodGalleryLabel.textColor = .white
    moodGalleryLabel.numberOfLines = 1
    moodGalleryLabel.adjustsFontSizeToFitWidth = true
    moodGalleryLabel.minimumScaleFactor = 0.82
    moodGalleryLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)

    let moodGalleryRecord = UILabel()
    moodGalleryRecord.translatesAutoresizingMaskIntoConstraints = false
    moodGalleryRecord.text = brewGatheringArtwork
    moodGalleryRecord.textColor = UIColor(white: 1, alpha: 0.76)
    moodGalleryRecord.numberOfLines = 0
    moodGalleryRecord.font = UIFont.systemFont(ofSize: 13.5, weight: .regular)

    let moodGalleryStack = UIStackView(arrangedSubviews: [moodGalleryLabel, moodGalleryRecord])
    moodGalleryStack.translatesAutoresizingMaskIntoConstraints = false
    moodGalleryStack.axis = .vertical
    moodGalleryStack.alignment = .fill
    moodGalleryStack.spacing = 6

    addSubview(moodGalleryHeader)
    addSubview(moodGalleryStack)
    NSLayoutConstraint.activate([
      moodGalleryHeader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
      moodGalleryHeader.centerYAnchor.constraint(equalTo: centerYAnchor),
      moodGalleryHeader.widthAnchor.constraint(equalToConstant: 46),
      moodGalleryHeader.heightAnchor.constraint(equalTo: moodGalleryHeader.widthAnchor),
      moodGalleryImage.centerXAnchor.constraint(equalTo: moodGalleryHeader.centerXAnchor),
      moodGalleryImage.centerYAnchor.constraint(equalTo: moodGalleryHeader.centerYAnchor),
      moodGalleryImage.widthAnchor.constraint(equalToConstant: 24),
      moodGalleryImage.heightAnchor.constraint(equalTo: moodGalleryImage.widthAnchor),
      moodGalleryStack.topAnchor.constraint(equalTo: topAnchor, constant: 18),
      moodGalleryStack.leadingAnchor.constraint(equalTo: moodGalleryHeader.trailingAnchor, constant: 14),
      moodGalleryStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
      moodGalleryStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18),
      heightAnchor.constraint(greaterThanOrEqualToConstant: 88),
    ])
  }

  required init?(coder brewGatheringSource: NSCoder) { nil }

  override func layoutSubviews() {
    super.layoutSubviews()
    moodGalleryArtwork.frame = bounds
  }
}
