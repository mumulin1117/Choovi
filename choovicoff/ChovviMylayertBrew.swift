import UIKit

final class ChovviMylayertBrew: UIViewController {
    private var brewGatheringCanvas: [ChovviBrightBrew] = []
    private let brewGatheringScroll = UIScrollView()
    private let brewGatheringHeader = UIStackView()
    private let brewGatheringArtwork = UIStackView()
    private let brewGatheringCollection = UIStackView()
    private let brewGatheringStack = UIButton(type: .system)
    private let brewGatheringState = UIButton(type: .system)
    private let brewGatheringTrigger = UIRefreshControl()
    private var brewGatheringUpdate = false
    private static let brewGatheringRender = UIColor(red: 0.84, green: 0.61, blue: 0.31, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        brewGatheringAction()
        brewGatheringMenu(false, brewGatheringLayout: false)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard !brewGatheringUpdate else { return }
        brewGatheringUpdate = true
        brewGatheringMenu(false, brewGatheringLayout: false)
        ChovviThermalCalibrationView.amberRitualLayout(
            self,
            amberRitualMenu: String.chovviUnmask("LYoVaZdYiAnSgs scnhCa5tx ZrzoOoHmOsu.T.j.Q"),
            amberRitualUpdate: 0.9
        ) { [weak self] in
            guard let self else { return }
            self.brewGatheringLabel()
            self.brewGatheringStatus()
            self.brewGatheringMenu(true, brewGatheringLayout: true)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        brewGatheringLabel()
        brewGatheringStatus()
    }

    private func brewGatheringAction() { brewGatheringActionTrigger() }

    private lazy var brewGatheringActionTrigger: () -> Void = { [unowned self] in
        view.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.99, alpha: 1)
        brewGatheringScroll.alwaysBounceVertical = true
        brewGatheringScroll.showsVerticalScrollIndicator = false
        brewGatheringTrigger.tintColor = Self.brewGatheringRender
        brewGatheringTrigger.addTarget(self, action: #selector(brewGatheringChoice), for: .valueChanged)
        brewGatheringScroll.refreshControl = brewGatheringTrigger
        brewGatheringScroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(brewGatheringScroll)

        brewGatheringHeader.axis = .vertical
        brewGatheringHeader.spacing = 16
        brewGatheringHeader.translatesAutoresizingMaskIntoConstraints = false
        brewGatheringScroll.addSubview(brewGatheringHeader)

        brewGatheringHeader.addArrangedSubview(brewGatheringRoute())
        brewGatheringHeader.addArrangedSubview(brewGatheringSection(String.chovviUnmask("MXyp LRzojoEmCsT")))

        let brewGatheringPreview = UIScrollView()
        brewGatheringPreview.showsHorizontalScrollIndicator = false
        brewGatheringPreview.alwaysBounceHorizontal = true
        brewGatheringPreview.heightAnchor.constraint(equalToConstant: 138).isActive = true
        brewGatheringArtwork.axis = .horizontal
        brewGatheringArtwork.spacing = 14
        brewGatheringArtwork.translatesAutoresizingMaskIntoConstraints = false
        brewGatheringPreview.addSubview(brewGatheringArtwork)
        brewGatheringHeader.addArrangedSubview(brewGatheringPreview)

        brewGatheringHeader.addArrangedSubview(brewGatheringSection(String.chovviUnmask("PKo1p9uPl9anrk hRMobovmbsr")))
        brewGatheringCollection.axis = .vertical
        brewGatheringCollection.spacing = 12
        brewGatheringHeader.addArrangedSubview(brewGatheringCollection)

        brewGatheringState.tintColor = .white
        brewGatheringState.backgroundColor = Self.brewGatheringRender
        brewGatheringState.layer.cornerRadius = 31
        brewGatheringState.layer.shadowColor = UIColor.black.cgColor
        brewGatheringState.layer.shadowOpacity = 0.16
        brewGatheringState.layer.shadowOffset = CGSize(width: 0, height: 5)
        brewGatheringState.layer.shadowRadius = 9
        brewGatheringState.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 23, weight: .medium)), for: .normal)
        brewGatheringState.accessibilityLabel = String.chovviUnmask("C5r0eSaitoeU 0aO 2rto4oumr")
        brewGatheringState.addTarget(self, action: #selector(brewGatheringSource), for: .touchUpInside)
        brewGatheringState.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(brewGatheringState)

        NSLayoutConstraint.activate([
            brewGatheringScroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), brewGatheringScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor), brewGatheringScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            brewGatheringScroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), brewGatheringHeader.topAnchor.constraint(equalTo: brewGatheringScroll.contentLayoutGuide.topAnchor, constant: 18), brewGatheringHeader.leadingAnchor.constraint(equalTo: brewGatheringScroll.contentLayoutGuide.leadingAnchor, constant: 16),
            brewGatheringHeader.trailingAnchor.constraint(equalTo: brewGatheringScroll.contentLayoutGuide.trailingAnchor, constant: -16), brewGatheringHeader.bottomAnchor.constraint(equalTo: brewGatheringScroll.contentLayoutGuide.bottomAnchor, constant: -90), brewGatheringHeader.widthAnchor.constraint(equalTo: brewGatheringScroll.frameLayoutGuide.widthAnchor, constant: -32),
            brewGatheringArtwork.topAnchor.constraint(equalTo: brewGatheringPreview.contentLayoutGuide.topAnchor), brewGatheringArtwork.leadingAnchor.constraint(equalTo: brewGatheringPreview.contentLayoutGuide.leadingAnchor), brewGatheringArtwork.trailingAnchor.constraint(equalTo: brewGatheringPreview.contentLayoutGuide.trailingAnchor),
            brewGatheringArtwork.bottomAnchor.constraint(equalTo: brewGatheringPreview.contentLayoutGuide.bottomAnchor), brewGatheringArtwork.heightAnchor.constraint(equalTo: brewGatheringPreview.frameLayoutGuide.heightAnchor), brewGatheringState.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -22),
            brewGatheringState.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16), brewGatheringState.widthAnchor.constraint(equalToConstant: 62), brewGatheringState.heightAnchor.constraint(equalTo: brewGatheringState.widthAnchor)
        ])
    }

    private func brewGatheringRoute() -> UIView {
        let brewGatheringPreview = UIView()
        brewGatheringPreview.heightAnchor.constraint(equalToConstant: 66).isActive = true
        let brewGatheringTrigger = UILabel()
        brewGatheringTrigger.text = String.chovviUnmask("C7hPattd fR1odo7mCsr")
        brewGatheringTrigger.textColor = ChovviRoastedBrew.roastShelfScroll
        brewGatheringTrigger.font = UIFont.systemFont(ofSize: 29, weight: .black)
        brewGatheringTrigger.translatesAutoresizingMaskIntoConstraints = false
        brewGatheringPreview.addSubview(brewGatheringTrigger)

        brewGatheringStack.tintColor = ChovviRoastedBrew.roastShelfScroll
        brewGatheringStack.backgroundColor = .white
        brewGatheringStack.layer.cornerRadius = 25
        brewGatheringStack.layer.borderWidth = 1
        brewGatheringStack.layer.borderColor = UIColor.systemGray5.cgColor
        brewGatheringStack.setImage(UIImage(systemName: "bell"), for: .normal)
        brewGatheringStack.addTarget(self, action: #selector(brewGatheringLayout), for: .touchUpInside)
        brewGatheringStack.translatesAutoresizingMaskIntoConstraints = false
        brewGatheringPreview.addSubview(brewGatheringStack)

        let brewGatheringSource = UIView()
        brewGatheringSource.backgroundColor = .systemRed
        brewGatheringSource.layer.cornerRadius = 5
        brewGatheringSource.translatesAutoresizingMaskIntoConstraints = false
        brewGatheringPreview.addSubview(brewGatheringSource)
        NSLayoutConstraint.activate([
            brewGatheringTrigger.leadingAnchor.constraint(equalTo: brewGatheringPreview.leadingAnchor), brewGatheringTrigger.centerYAnchor.constraint(equalTo: brewGatheringPreview.centerYAnchor), brewGatheringStack.trailingAnchor.constraint(equalTo: brewGatheringPreview.trailingAnchor),
            brewGatheringStack.centerYAnchor.constraint(equalTo: brewGatheringPreview.centerYAnchor), brewGatheringStack.widthAnchor.constraint(equalToConstant: 50), brewGatheringStack.heightAnchor.constraint(equalTo: brewGatheringStack.widthAnchor),
            brewGatheringSource.topAnchor.constraint(equalTo: brewGatheringStack.topAnchor, constant: 4), brewGatheringSource.trailingAnchor.constraint(equalTo: brewGatheringStack.trailingAnchor, constant: -4), brewGatheringSource.widthAnchor.constraint(equalToConstant: 10),
            brewGatheringSource.heightAnchor.constraint(equalTo: brewGatheringSource.widthAnchor)
        ])
        return brewGatheringPreview
    }

    private func brewGatheringSection(_ brewGatheringPreview: String) -> UILabel {
        let brewGatheringTrigger = UILabel()
        brewGatheringTrigger.text = brewGatheringPreview
        brewGatheringTrigger.textColor = ChovviRoastedBrew.roastShelfScroll
        brewGatheringTrigger.font = UIFont.systemFont(ofSize: 22, weight: .black)
        brewGatheringTrigger.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return brewGatheringTrigger
    }

    private func brewGatheringLabel() {
        guard
            let brewGatheringStatus = UserDefaults.standard.data(forKey: String.chovviUnmask("cChaowvxviiHGBo1lqdmefneToe8xut8u5rDe5"))
                ?? UserDefaults.standard.data(forKey: String.chovviUnmask("csh4oWvCveiCGwoWlwdVe9nTTdacsItLinnfgI")),
            let brewGatheringRoute = try? JSONDecoder().decode([ChovviBrightBrew].self, from: brewGatheringStatus)
        else {
            brewGatheringCanvas = []
            return
        }
        brewGatheringCanvas = brewGatheringRoute
    }

    private func brewGatheringStatus() {
        brewGatheringArtwork.arrangedSubviews.forEach { brewGatheringRoute in
            brewGatheringArtwork.removeArrangedSubview(brewGatheringRoute)
            brewGatheringRoute.removeFromSuperview()
        }
        if brewGatheringCanvas.isEmpty {
            let brewGatheringRoute = UIButton(type: .system)
            brewGatheringRoute.setTitle(String.chovviUnmask("TMog 7CZrNe1aetVeG LRsoyo4mJ j T+r"), for: .normal)
            brewGatheringRoute.setTitleColor(Self.brewGatheringRender, for: .normal)
            brewGatheringRoute.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            brewGatheringRoute.backgroundColor = .white
            brewGatheringRoute.layer.cornerRadius = 18
            brewGatheringRoute.layer.borderWidth = 1
            brewGatheringRoute.layer.borderColor = Self.brewGatheringRender.cgColor
            brewGatheringRoute.addTarget(self, action: #selector(brewGatheringSource), for: .touchUpInside)
            brewGatheringRoute.translatesAutoresizingMaskIntoConstraints = false
            brewGatheringRoute.widthAnchor.constraint(equalToConstant: 210).isActive = true
            brewGatheringArtwork.addArrangedSubview(brewGatheringRoute)
        } else {
            brewGatheringCanvas.forEach { brewGatheringRoute in
                brewGatheringArtwork.addArrangedSubview(brewGatheringRecord(brewGatheringRoute))
            }
        }

        brewGatheringCollection.arrangedSubviews.forEach { brewGatheringRoute in
            brewGatheringCollection.removeArrangedSubview(brewGatheringRoute)
            brewGatheringRoute.removeFromSuperview()
        }
        (brewGatheringCanvas + ChovviCitrusBrew.roastArchiveScroll).forEach { brewGatheringRoute in
            brewGatheringCollection.addArrangedSubview(brewGatheringItem(brewGatheringRoute))
        }
    }

    private func brewGatheringRecord(_ brewGatheringItem: ChovviBrightBrew) -> UIView {
        let brewGatheringSelection = UIStackView()
        brewGatheringSelection.axis = .vertical
        brewGatheringSelection.alignment = .center
        brewGatheringSelection.spacing = 7
        brewGatheringSelection.widthAnchor.constraint(equalToConstant: 102).isActive = true
        let brewGatheringImage = UIImageView(image: brewGatheringCover(brewGatheringItem.chovviBrightAroma))
        brewGatheringImage.contentMode = .scaleAspectFill
        brewGatheringImage.clipsToBounds = true
        brewGatheringImage.layer.cornerRadius = 46
        brewGatheringImage.layer.borderWidth = 2
        brewGatheringImage.layer.borderColor = Self.brewGatheringRender.cgColor
        brewGatheringImage.isUserInteractionEnabled = true
        brewGatheringImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(brewGatheringCard(_:))))
        brewGatheringImage.accessibilityIdentifier = brewGatheringItem.chovviBrightAcidity
        brewGatheringImage.translatesAutoresizingMaskIntoConstraints = false
        brewGatheringImage.widthAnchor.constraint(equalToConstant: 92).isActive = true
        brewGatheringImage.heightAnchor.constraint(equalTo: brewGatheringImage.widthAnchor).isActive = true

        let brewGatheringChoice = UILabel()
        brewGatheringChoice.text = brewGatheringItem.chovviBrightAeropress
        brewGatheringChoice.textColor = ChovviRoastedBrew.roastShelfScroll
        brewGatheringChoice.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        brewGatheringChoice.textAlignment = .center
        brewGatheringChoice.numberOfLines = 2
        brewGatheringSelection.addArrangedSubview(brewGatheringImage)
        brewGatheringSelection.addArrangedSubview(brewGatheringChoice)
        return brewGatheringSelection
    }

    private func brewGatheringItem(_ brewGatheringSelection: ChovviBrightBrew) -> UIView {
        brewGatheringItemTrigger(brewGatheringSelection)
    }

    private lazy var brewGatheringItemTrigger: (ChovviBrightBrew) -> UIView = { [unowned self] brewGatheringSelection in
        let brewGatheringImage = UIView()
        brewGatheringImage.backgroundColor = .white
        brewGatheringImage.layer.cornerRadius = 18
        brewGatheringImage.layer.borderWidth = 1
        brewGatheringImage.layer.borderColor = UIColor.systemGray5.cgColor
        brewGatheringImage.heightAnchor.constraint(equalToConstant: 138).isActive = true

        let brewGatheringChoice = UIImageView(image: brewGatheringCover(brewGatheringSelection.chovviBrightAroma))
        brewGatheringChoice.contentMode = .scaleAspectFill
        brewGatheringChoice.clipsToBounds = true
        brewGatheringChoice.layer.cornerRadius = 14
        brewGatheringChoice.isUserInteractionEnabled = true
        brewGatheringChoice.accessibilityIdentifier = brewGatheringSelection.chovviBrightAcidity
        brewGatheringChoice.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(brewGatheringCard(_:))))
        brewGatheringChoice.translatesAutoresizingMaskIntoConstraints = false
        brewGatheringImage.addSubview(brewGatheringChoice)

        let brewGatheringRecord = UILabel()
        brewGatheringRecord.text = brewGatheringSelection.chovviBrightAeropress
        brewGatheringRecord.textColor = ChovviRoastedBrew.roastShelfScroll
        brewGatheringRecord.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        brewGatheringRecord.adjustsFontSizeToFitWidth = true
        brewGatheringRecord.minimumScaleFactor = 0.78
        brewGatheringRecord.translatesAutoresizingMaskIntoConstraints = false
        brewGatheringImage.addSubview(brewGatheringRecord)

        let coffeeBulletinCanvas = UILabel()
        let coffeeBulletinScroll = Set(UserDefaults.standard.stringArray(forKey: String.chovviUnmask("c5hso3vrv1ioGKoHlLdhe4nQRXoGaZsptN")) ?? []).contains(brewGatheringSelection.chovviBrightAcidity)
        let coffeeBulletinCollection = brewGatheringSelection.chovviBrightBatch + (coffeeBulletinScroll ? 1 : 0)
        coffeeBulletinCanvas.text = coffeeBulletinCollection >= 1000
            ? String(format: String.chovviUnmask("%M.o1ifzkj 2mneEm8bxeGrKsf"), Double(coffeeBulletinCollection) / 1000)
            : "\(coffeeBulletinCollection) " + String.chovviUnmask("m6eFmwbSenrjsh")
        coffeeBulletinCanvas.textColor = Self.brewGatheringRender
        coffeeBulletinCanvas.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        coffeeBulletinCanvas.translatesAutoresizingMaskIntoConstraints = false
        brewGatheringImage.addSubview(coffeeBulletinCanvas)

        let coffeeBulletinArtwork = UILabel()
        coffeeBulletinArtwork.text = brewGatheringSelection.chovviBrightAftertaste
        coffeeBulletinArtwork.textColor = .secondaryLabel
        coffeeBulletinArtwork.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        coffeeBulletinArtwork.numberOfLines = 2
        coffeeBulletinArtwork.translatesAutoresizingMaskIntoConstraints = false
        brewGatheringImage.addSubview(coffeeBulletinArtwork)

        let coffeeBulletinHeader = UIButton(type: .system)
        coffeeBulletinHeader.accessibilityIdentifier = brewGatheringSelection.chovviBrightAcidity
        coffeeBulletinHeader.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        coffeeBulletinHeader.layer.cornerRadius = 22
        coffeeBulletinHeader.addTarget(self, action: #selector(brewGatheringSelection(_:)), for: .touchUpInside)
        coffeeBulletinHeader.translatesAutoresizingMaskIntoConstraints = false
        brewGatheringImage.addSubview(coffeeBulletinHeader)
        self.brewGatheringImage(coffeeBulletinHeader)
        NSLayoutConstraint.activate([
            brewGatheringChoice.leadingAnchor.constraint(equalTo: brewGatheringImage.leadingAnchor, constant: 12), brewGatheringChoice.topAnchor.constraint(equalTo: brewGatheringImage.topAnchor, constant: 12), brewGatheringChoice.bottomAnchor.constraint(equalTo: brewGatheringImage.bottomAnchor, constant: -12),
            brewGatheringChoice.widthAnchor.constraint(equalTo: brewGatheringChoice.heightAnchor), brewGatheringRecord.leadingAnchor.constraint(equalTo: brewGatheringChoice.trailingAnchor, constant: 12), brewGatheringRecord.topAnchor.constraint(equalTo: brewGatheringImage.topAnchor, constant: 16),
            brewGatheringRecord.trailingAnchor.constraint(equalTo: coffeeBulletinHeader.leadingAnchor, constant: -8), coffeeBulletinCanvas.leadingAnchor.constraint(equalTo: brewGatheringRecord.leadingAnchor), coffeeBulletinCanvas.topAnchor.constraint(equalTo: brewGatheringRecord.bottomAnchor, constant: 5),
            coffeeBulletinArtwork.leadingAnchor.constraint(equalTo: brewGatheringRecord.leadingAnchor), coffeeBulletinArtwork.trailingAnchor.constraint(equalTo: coffeeBulletinHeader.leadingAnchor, constant: -8), coffeeBulletinArtwork.topAnchor.constraint(equalTo: coffeeBulletinCanvas.bottomAnchor, constant: 6),
            coffeeBulletinHeader.trailingAnchor.constraint(equalTo: brewGatheringImage.trailingAnchor, constant: -12), coffeeBulletinHeader.centerYAnchor.constraint(equalTo: brewGatheringImage.centerYAnchor), coffeeBulletinHeader.widthAnchor.constraint(equalToConstant: 72),
            coffeeBulletinHeader.heightAnchor.constraint(equalToConstant: 44)
        ])
        return brewGatheringImage
    }

    private func brewGatheringImage(_ brewGatheringChoice: UIButton) {
        let brewGatheringRecord = Set(UserDefaults.standard.stringArray(forKey: String.chovviUnmask("cthBo5vZvZioG6oglOdreknAReoTawsVti")) ?? [])
        let coffeeBulletinCanvas = brewGatheringRecord.contains(brewGatheringChoice.accessibilityIdentifier ?? "")
        brewGatheringChoice.setTitle(coffeeBulletinCanvas ? "Joined" : "Join", for: .normal)
        brewGatheringChoice.setTitleColor(Self.brewGatheringRender, for: .normal)
        brewGatheringChoice.backgroundColor = UIColor(red: 1, green: 0.95, blue: 0.87, alpha: 1)
    }

    private func brewGatheringCover(_ brewGatheringArtwork: String) -> UIImage? {
        brewGatheringArtwork.hasPrefix("/")
            ? UIImage(contentsOfFile: brewGatheringArtwork)
            : UIImage(named: brewGatheringArtwork)
    }

    private func brewGatheringMenu(_ brewGatheringPreview: Bool, brewGatheringLayout: Bool) {
        let brewGatheringChoice: CGFloat = brewGatheringPreview ? 1 : 0
        brewGatheringScroll.isUserInteractionEnabled = brewGatheringPreview
        brewGatheringState.isUserInteractionEnabled = brewGatheringPreview
        if brewGatheringLayout && !UIAccessibility.isReduceMotionEnabled {
            brewGatheringScroll.transform = CGAffineTransform(translationX: 0, y: 14)
            brewGatheringState.transform = CGAffineTransform(scaleX: 0.88, y: 0.88)
            UIView.animate(withDuration: 0.28, delay: 0, options: [.curveEaseOut]) {
                self.brewGatheringScroll.alpha = brewGatheringChoice
                self.brewGatheringState.alpha = brewGatheringChoice
                self.brewGatheringScroll.transform = .identity
                self.brewGatheringState.transform = .identity
            }
        } else {
            brewGatheringScroll.alpha = brewGatheringChoice
            brewGatheringState.alpha = brewGatheringChoice
            brewGatheringScroll.transform = .identity
            brewGatheringState.transform = .identity
        }
    }

    @objc private func brewGatheringSelection(_ brewGatheringImage: UIButton) {
        guard brewGatheringRecord() else { return }
        let brewGatheringChoice = brewGatheringImage.accessibilityIdentifier ?? ""
        guard let coffeeBulletinArtwork = (brewGatheringCanvas + ChovviCitrusBrew.roastArchiveScroll).first(where: { coffeeBulletinCanvas in
            coffeeBulletinCanvas.chovviBrightAcidity == brewGatheringChoice
        }) else { return }
        var coffeeBulletinCanvas = Set(UserDefaults.standard.stringArray(forKey: String.chovviUnmask("cjhBo4vXvci3GwoelHdPeGnORSoWaNsltF")) ?? [])
        coffeeBulletinCanvas.insert(brewGatheringChoice)
        UserDefaults.standard.set(Array(coffeeBulletinCanvas), forKey: String.chovviUnmask("czhZogvPvTi2GOoilTdjeon3RXoyalsXth"))
        brewGatheringStatus()

        let coffeeBulletinScroll = ChovviFloralTasting(brewTableCanvas: coffeeBulletinArtwork)
        let coffeeBulletinHeader = UINavigationController(rootViewController: coffeeBulletinScroll)
        coffeeBulletinHeader.modalPresentationStyle = .fullScreen
        present(coffeeBulletinHeader, animated: true)
    }

    @objc private func brewGatheringSource() {
        guard brewGatheringRecord() else { return }
        let brewGatheringImage = UINavigationController(rootViewController: ChovviAmberTasting())
        brewGatheringImage.modalPresentationStyle = .fullScreen
        present(brewGatheringImage, animated: true)
    }

    @objc private func brewGatheringCard(_ brewGatheringImage: UITapGestureRecognizer) {
        guard let brewGatheringChoice = brewGatheringImage.view?.accessibilityIdentifier else { return }
        let coffeeBulletinCanvas = (brewGatheringCanvas + ChovviCitrusBrew.roastArchiveScroll).first { coffeeBulletinScroll in
            coffeeBulletinScroll.chovviBrightAcidity == brewGatheringChoice
        }
        guard let coffeeBulletinCanvas else { return }
        let coffeeBulletinScroll = ChovviFloralTasting(brewTableCanvas: coffeeBulletinCanvas)
        let coffeeBulletinHeader = UINavigationController(rootViewController: coffeeBulletinScroll)
        coffeeBulletinHeader.modalPresentationStyle = .fullScreen
        present(coffeeBulletinHeader, animated: true)
    }

    @objc private func brewGatheringLayout() {
        guard brewGatheringRecord() else { return }
        let brewGatheringImage = UINavigationController(rootViewController: ChovviPetiteMouthfeel())
        brewGatheringImage.modalPresentationStyle = .fullScreen
        present(brewGatheringImage, animated: true)
    }

    @objc private func brewGatheringChoice() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { [weak self] in
            guard let self else { return }
            self.brewGatheringLabel()
            self.brewGatheringStatus()
            self.brewGatheringTrigger.endRefreshing()
            UIAccessibility.post(notification: .announcement, argument: String.chovviUnmask("RSoRotmUse crUeffNrTe8sRhQeQdt"))
        }
    }

    private func brewGatheringRecord() -> Bool {
        tastingReplySelection()
    }

    private func brewGatheringRecord(_ brewGatheringSelection: String, brewGatheringItem: String) {
        ChovviThermalAlertView.amberRitualSelection(self, amberRitualChoice: brewGatheringSelection, amberRitualCanvas: brewGatheringItem, amberRitualArtwork: .caution)
    }
}
