import UIKit

struct ChovviHarvestProfile: Codable, Hashable {
    let tastingReplyCanvas: String
    let tastingReplyScroll: String
    let tastingReplyHeader: String

    private enum CodingKeys: String, CodingKey {
        case tastingReplyCanvas = "chovviHarvestAcidity"
        case tastingReplyScroll = "chovviHarvestAeropress"
        case tastingReplyHeader = "chovviHarvestAftertaste"
    }
}

final class ChovviOriginProfile: UIViewController, UITextFieldDelegate {
    private let cupChronicleCanvas: ChovviSilkyProfile
    private let cupChronicleScroll: ChovviBotanicalProfile?
    private let cupChronicleHeader = UIScrollView()
    private let cupChronicleArtwork = UIStackView()
    private let cupChronicleCollection = UIStackView()
    private let cupChronicleStack = UIView()
    private let cupChronicleState = UITextField()
    private let cupChronicleRender = UIButton(type: .system)
    private let cupChronicleAction = UIButton(type: .system)
    private let cupChronicleLabel = UIButton(type: .system)
    private let cupChronicleStatus = UILabel()
    private var cupChronicleRoute: NSLayoutConstraint?
    private var cupChronicleSection: [ChovviHarvestProfile] = []

    private lazy var cupChroniclePreview: ChovviThermalProfile = {
        let cupChronicleTrigger = cupChronicleCanvas.chovviSilkyAftertaste.hasPrefix("/")
            ? URL(fileURLWithPath: cupChronicleCanvas.chovviSilkyAftertaste)
            : Bundle.main.url(forResource: cupChronicleCanvas.chovviSilkyAftertaste, withExtension: "mp4")
        return ChovviThermalProfile(goldenRitualArtwork: cupChronicleTrigger)
    }()

    init(cupChronicleCanvas: ChovviSilkyProfile) {
        self.cupChronicleCanvas = cupChronicleCanvas
        cupChronicleScroll = ChovviCitrusProfile.roastArchiveCanvas.first { cupChronicleHeader in
            cupChronicleHeader.chovviBotanicalAcidity == cupChronicleCanvas.chovviSilkyAeropress
        }
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        cupChronicleLayout()
        cupChronicleSource()
        cupChronicleMenu()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(cupChronicleUpdate),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(cupChronicleDestination),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        cupChroniclePreview.goldenRitualStack()
    }

    private func cupChronicleLayout() { cupChronicleLayoutTrigger() }

    private lazy var cupChronicleLayoutTrigger: () -> Void = { [unowned self] in
        view.backgroundColor = UIColor(red: 248 / 255, green: 250 / 255, blue: 252 / 255, alpha: 1)
        title = "Moment Details"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left")?.withTintColor(.black, renderingMode: .alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(cupChronicleCard)
        )
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "ellipsis")?.withTintColor(.black, renderingMode: .alwaysOriginal),
            primaryAction: nil,
            menu: cupChronicleRecord()
        )
        navigationItem.rightBarButtonItem?.tintColor = .black

        cupChronicleHeader.translatesAutoresizingMaskIntoConstraints = false
        cupChronicleHeader.alwaysBounceVertical = true
        cupChronicleHeader.showsVerticalScrollIndicator = false
        view.addSubview(cupChronicleHeader)

        cupChronicleArtwork.axis = .vertical
        cupChronicleArtwork.spacing = 14
        cupChronicleArtwork.translatesAutoresizingMaskIntoConstraints = false
        cupChronicleHeader.addSubview(cupChronicleArtwork)

        cupChronicleStack.backgroundColor = .systemBackground
        cupChronicleStack.layer.cornerRadius = 24
        cupChronicleStack.layer.shadowColor = UIColor.black.cgColor
        cupChronicleStack.layer.shadowOpacity = 0.06
        cupChronicleStack.layer.shadowRadius = 12
        cupChronicleStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cupChronicleStack)

        cupChronicleState.placeholder = "Add a comment..."
        cupChronicleState.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        cupChronicleState.returnKeyType = .send
        cupChronicleState.delegate = self
        cupChronicleState.translatesAutoresizingMaskIntoConstraints = false
        cupChronicleStack.addSubview(cupChronicleState)

        cupChronicleRender.tintColor = .white
        cupChronicleRender.backgroundColor = ChovviRoastedProfile.discoveryShelfCanvas
        cupChronicleRender.layer.cornerRadius = 20
        cupChronicleRender.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        cupChronicleRender.accessibilityLabel = "Publish comment"
        cupChronicleRender.addTarget(self, action: #selector(cupChronicleItem), for: .touchUpInside)
        cupChronicleRender.translatesAutoresizingMaskIntoConstraints = false
        cupChronicleStack.addSubview(cupChronicleRender)

        cupChronicleRoute = cupChronicleStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        cupChronicleRoute?.isActive = true

        NSLayoutConstraint.activate([
            cupChronicleStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14), cupChronicleStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14), cupChronicleStack.heightAnchor.constraint(equalToConstant: 54),
            cupChronicleState.leadingAnchor.constraint(equalTo: cupChronicleStack.leadingAnchor, constant: 16), cupChronicleState.centerYAnchor.constraint(equalTo: cupChronicleStack.centerYAnchor), cupChronicleState.trailingAnchor.constraint(equalTo: cupChronicleRender.leadingAnchor, constant: -10),
            cupChronicleRender.trailingAnchor.constraint(equalTo: cupChronicleStack.trailingAnchor, constant: -7), cupChronicleRender.centerYAnchor.constraint(equalTo: cupChronicleStack.centerYAnchor), cupChronicleRender.widthAnchor.constraint(equalToConstant: 40),
            cupChronicleRender.heightAnchor.constraint(equalTo: cupChronicleRender.widthAnchor), cupChronicleHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), cupChronicleHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cupChronicleHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor), cupChronicleHeader.bottomAnchor.constraint(equalTo: cupChronicleStack.topAnchor, constant: -8), cupChronicleArtwork.topAnchor.constraint(equalTo: cupChronicleHeader.contentLayoutGuide.topAnchor, constant: 16),
            cupChronicleArtwork.leadingAnchor.constraint(equalTo: cupChronicleHeader.contentLayoutGuide.leadingAnchor, constant: 15), cupChronicleArtwork.trailingAnchor.constraint(equalTo: cupChronicleHeader.contentLayoutGuide.trailingAnchor, constant: -15), cupChronicleArtwork.bottomAnchor.constraint(equalTo: cupChronicleHeader.contentLayoutGuide.bottomAnchor, constant: -24),
            cupChronicleArtwork.widthAnchor.constraint(equalTo: cupChronicleHeader.frameLayoutGuide.widthAnchor, constant: -30)
        ])

        let cupChronicleSelection = UITapGestureRecognizer(target: self, action: #selector(cupChronicleImage))
        cupChronicleSelection.cancelsTouchesInView = false
        cupChronicleHeader.addGestureRecognizer(cupChronicleSelection)
    }

    private func cupChronicleSource() {
        cupChronicleArtwork.addArrangedSubview(cupChronicleChoice())

        cupChroniclePreview.layer.cornerRadius = 18
        cupChroniclePreview.translatesAutoresizingMaskIntoConstraints = false
        cupChroniclePreview.heightAnchor.constraint(equalTo: cupChroniclePreview.widthAnchor, multiplier: 0.66).isActive = true
        cupChronicleArtwork.addArrangedSubview(cupChroniclePreview)

        let journalDraftCanvas = UILabel()
        journalDraftCanvas.text = cupChronicleCanvas.chovviSilkyAroma
        journalDraftCanvas.textColor = ChovviRoastedProfile.discoveryShelfScroll
        journalDraftCanvas.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        journalDraftCanvas.numberOfLines = 0
        cupChronicleArtwork.addArrangedSubview(journalDraftCanvas)

        let journalDraftScroll = UIView()
        journalDraftScroll.backgroundColor = UIColor.separator.withAlphaComponent(0.4)
        journalDraftScroll.heightAnchor.constraint(equalToConstant: 1).isActive = true
        cupChronicleArtwork.addArrangedSubview(journalDraftScroll)

        cupChronicleArtwork.addArrangedSubview(journalDraftHeader())

        let journalDraftArtwork = UILabel()
        journalDraftArtwork.text = "Comments"
        journalDraftArtwork.textColor = ChovviRoastedProfile.discoveryShelfScroll
        journalDraftArtwork.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        cupChronicleArtwork.addArrangedSubview(journalDraftArtwork)

        cupChronicleCollection.axis = .vertical
        cupChronicleCollection.spacing = 12
        cupChronicleArtwork.addArrangedSubview(cupChronicleCollection)
    }

    private func cupChronicleChoice() -> UIView { cupChronicleChoiceTrigger() }

    private lazy var cupChronicleChoiceTrigger: () -> UIView = { [unowned self] in
        let journalDraftCanvas = UIView()
        journalDraftCanvas.heightAnchor.constraint(equalToConstant: 62).isActive = true

        let journalDraftScroll = UIImageView(image: UIImage(named: cupChronicleScroll?.chovviBotanicalAroma ?? ""))
        journalDraftScroll.contentMode = .scaleAspectFill
        journalDraftScroll.clipsToBounds = true
        journalDraftScroll.layer.cornerRadius = 24
        journalDraftScroll.isUserInteractionEnabled = true
        journalDraftScroll.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(journalDraftState)))
        journalDraftScroll.translatesAutoresizingMaskIntoConstraints = false
        journalDraftCanvas.addSubview(journalDraftScroll)

        let journalDraftHeader = UILabel()
        journalDraftHeader.text = cupChronicleScroll?.chovviBotanicalAeropress ?? "Choovi Creator"
        journalDraftHeader.textColor = ChovviRoastedProfile.discoveryShelfScroll
        journalDraftHeader.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        journalDraftHeader.isUserInteractionEnabled = true
        journalDraftHeader.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(journalDraftState)))
        journalDraftHeader.translatesAutoresizingMaskIntoConstraints = false
        journalDraftCanvas.addSubview(journalDraftHeader)

        let journalDraftArtwork = UILabel()
        journalDraftArtwork.text = cupChronicleCanvas.chovviSilkyBrewer
        journalDraftArtwork.textColor = .secondaryLabel
        journalDraftArtwork.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        journalDraftArtwork.translatesAutoresizingMaskIntoConstraints = false
        journalDraftCanvas.addSubview(journalDraftArtwork)

        let journalDraftCollection = UIImageView(image: UIImage(named: ChovviCitrusProfile.roastArchiveCard(cupChronicleCanvas.chovviSilkyBurr)))
        journalDraftCollection.contentMode = .scaleAspectFit
        journalDraftCollection.backgroundColor = UIColor.white
        journalDraftCollection.layer.cornerRadius = 12
        journalDraftCollection.layer.borderWidth = 1
        journalDraftCollection.layer.borderColor = ChovviRoastedProfile.discoveryShelfCanvas.cgColor
        journalDraftCollection.clipsToBounds = true
        journalDraftCollection.translatesAutoresizingMaskIntoConstraints = false
        journalDraftCanvas.addSubview(journalDraftCollection)

        cupChronicleAction.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        cupChronicleAction.layer.cornerRadius = 16
        cupChronicleAction.layer.borderWidth = 1
        cupChronicleAction.layer.borderColor = ChovviRoastedProfile.discoveryShelfCanvas.cgColor
        cupChronicleAction.addTarget(self, action: #selector(journalDraftStack), for: .touchUpInside)
        cupChronicleAction.translatesAutoresizingMaskIntoConstraints = false
        journalDraftCanvas.addSubview(cupChronicleAction)
        journalDraftRender()

        NSLayoutConstraint.activate([
            journalDraftScroll.leadingAnchor.constraint(equalTo: journalDraftCanvas.leadingAnchor), journalDraftScroll.centerYAnchor.constraint(equalTo: journalDraftCanvas.centerYAnchor), journalDraftScroll.widthAnchor.constraint(equalToConstant: 48),
            journalDraftScroll.heightAnchor.constraint(equalTo: journalDraftScroll.widthAnchor), journalDraftHeader.leadingAnchor.constraint(equalTo: journalDraftScroll.trailingAnchor, constant: 10), journalDraftHeader.topAnchor.constraint(equalTo: journalDraftScroll.topAnchor, constant: 4),
            journalDraftArtwork.leadingAnchor.constraint(equalTo: journalDraftHeader.leadingAnchor), journalDraftArtwork.topAnchor.constraint(equalTo: journalDraftHeader.bottomAnchor, constant: 3), journalDraftCollection.leadingAnchor.constraint(equalTo: journalDraftArtwork.trailingAnchor, constant: 9),
            journalDraftCollection.centerYAnchor.constraint(equalTo: journalDraftCanvas.centerYAnchor), journalDraftCollection.widthAnchor.constraint(equalToConstant: 42), journalDraftCollection.heightAnchor.constraint(equalToConstant: 42),
            cupChronicleAction.trailingAnchor.constraint(equalTo: journalDraftCanvas.trailingAnchor), cupChronicleAction.centerYAnchor.constraint(equalTo: journalDraftCanvas.centerYAnchor), cupChronicleAction.widthAnchor.constraint(equalToConstant: 76),
            cupChronicleAction.heightAnchor.constraint(equalToConstant: 32), journalDraftHeader.trailingAnchor.constraint(lessThanOrEqualTo: journalDraftCollection.leadingAnchor, constant: -6), journalDraftCollection.trailingAnchor.constraint(lessThanOrEqualTo: cupChronicleAction.leadingAnchor, constant: -8)
        ])
        return journalDraftCanvas
    }

    private func journalDraftHeader() -> UIView {
        let journalDraftState = UIStackView()
        journalDraftState.axis = .horizontal
        journalDraftState.distribution = .equalSpacing

        cupChronicleLabel.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        cupChronicleLabel.tintColor = ChovviRoastedProfile.discoveryShelfCanvas
        cupChronicleLabel.addTarget(self, action: #selector(journalDraftLabel), for: .touchUpInside)
        journalDraftState.addArrangedSubview(cupChronicleLabel)

        cupChronicleStatus.textColor = ChovviRoastedProfile.discoveryShelfScroll
        cupChronicleStatus.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        journalDraftState.addArrangedSubview(cupChronicleStatus)

        journalDraftStatus()
        journalDraftRoute()
        return journalDraftState
    }

    private func cupChronicleMenu() {
        let journalDraftSection = ChovviCitrusProfile.roastArchiveCanvas
        let journalDraftPreview = cupChronicleCanvas.chovviSilkyBatch % max(1, journalDraftSection.count)
        let journalDraftTrigger = journalDraftSection[journalDraftPreview].chovviBotanicalAcidity
        let journalDraftLayout = journalDraftSection[(journalDraftPreview + 3) % journalDraftSection.count].chovviBotanicalAcidity
        let journalDraftSource = String(cupChronicleCanvas.chovviSilkyAroma.prefix(56))
        cupChronicleSection = [
            ChovviHarvestProfile(
                tastingReplyCanvas: journalDraftTrigger,
                tastingReplyScroll: "Your “\(journalDraftSource)” moment feels personal and thoughtfully captured.",
                tastingReplyHeader: "2m ago"
            ),
            ChovviHarvestProfile(
                tastingReplyCanvas: journalDraftLayout,
                tastingReplyScroll: "The selected coffee mood fits the colors and brewing details beautifully.",
                tastingReplyHeader: "5m ago"
            )
        ]

        let journalDraftMenu = UserDefaults.standard.stringArray(forKey: "chovviOriginTexture.\(cupChronicleCanvas.chovviSilkyAcidity)") ?? []
        journalDraftMenu.forEach { journalDraftUpdate in
            cupChronicleSection.append(
                ChovviHarvestProfile(tastingReplyCanvas: "chovvi-user-20", tastingReplyScroll: journalDraftUpdate, tastingReplyHeader: "Just now")
            )
        }
        journalDraftUpdate()
    }

    private func journalDraftUpdate() {
        cupChronicleCollection.arrangedSubviews.forEach { journalDraftDestination in
            cupChronicleCollection.removeArrangedSubview(journalDraftDestination)
            journalDraftDestination.removeFromSuperview()
        }
        cupChronicleSection.forEach { journalDraftCard in
            cupChronicleCollection.addArrangedSubview(journalDraftRecord(journalDraftCard))
        }
        journalDraftRoute()
    }

    private func journalDraftRecord(_ journalDraftItem: ChovviHarvestProfile) -> UIView {
        let journalDraftSelection = UIView()
        journalDraftSelection.heightAnchor.constraint(greaterThanOrEqualToConstant: 54).isActive = true
        let journalDraftImage = ChovviCitrusProfile.roastArchiveCanvas.first { journalDraftChoice in
            journalDraftChoice.chovviBotanicalAcidity == journalDraftItem.tastingReplyCanvas
        }

        let tastingReplyCanvas = UIImageView(image: UIImage(named: journalDraftImage?.chovviBotanicalAroma ?? ""))
        tastingReplyCanvas.contentMode = .scaleAspectFill
        tastingReplyCanvas.clipsToBounds = true
        tastingReplyCanvas.layer.cornerRadius = 17
        tastingReplyCanvas.translatesAutoresizingMaskIntoConstraints = false
        journalDraftSelection.addSubview(tastingReplyCanvas)

        let tastingReplyScroll = UILabel()
        tastingReplyScroll.text = journalDraftImage?.chovviBotanicalAeropress ?? "Choovi Member"
        tastingReplyScroll.textColor = ChovviRoastedProfile.discoveryShelfScroll
        tastingReplyScroll.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        tastingReplyScroll.translatesAutoresizingMaskIntoConstraints = false
        journalDraftSelection.addSubview(tastingReplyScroll)

        let tastingReplyHeader = UILabel()
        tastingReplyHeader.text = journalDraftItem.tastingReplyHeader
        tastingReplyHeader.textColor = .secondaryLabel
        tastingReplyHeader.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        tastingReplyHeader.translatesAutoresizingMaskIntoConstraints = false
        journalDraftSelection.addSubview(tastingReplyHeader)

        let tastingReplyArtwork = UILabel()
        tastingReplyArtwork.text = journalDraftItem.tastingReplyScroll
        tastingReplyArtwork.textColor = ChovviRoastedProfile.discoveryShelfScroll
        tastingReplyArtwork.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        tastingReplyArtwork.numberOfLines = 0
        tastingReplyArtwork.translatesAutoresizingMaskIntoConstraints = false
        journalDraftSelection.addSubview(tastingReplyArtwork)

        NSLayoutConstraint.activate([
            tastingReplyCanvas.leadingAnchor.constraint(equalTo: journalDraftSelection.leadingAnchor), tastingReplyCanvas.topAnchor.constraint(equalTo: journalDraftSelection.topAnchor, constant: 2), tastingReplyCanvas.widthAnchor.constraint(equalToConstant: 34),
            tastingReplyCanvas.heightAnchor.constraint(equalTo: tastingReplyCanvas.widthAnchor), tastingReplyScroll.leadingAnchor.constraint(equalTo: tastingReplyCanvas.trailingAnchor, constant: 9), tastingReplyScroll.topAnchor.constraint(equalTo: journalDraftSelection.topAnchor),
            tastingReplyHeader.trailingAnchor.constraint(equalTo: journalDraftSelection.trailingAnchor), tastingReplyHeader.centerYAnchor.constraint(equalTo: tastingReplyScroll.centerYAnchor), tastingReplyArtwork.leadingAnchor.constraint(equalTo: tastingReplyScroll.leadingAnchor),
            tastingReplyArtwork.trailingAnchor.constraint(equalTo: journalDraftSelection.trailingAnchor), tastingReplyArtwork.topAnchor.constraint(equalTo: tastingReplyScroll.bottomAnchor, constant: 4), tastingReplyArtwork.bottomAnchor.constraint(equalTo: journalDraftSelection.bottomAnchor, constant: -4)
        ])
        return journalDraftSelection
    }

    private func journalDraftRender() {
        let journalDraftAction = Set(UserDefaults.standard.stringArray(forKey: "chovviOriginRoast") ?? [])
        let journalDraftLabel = journalDraftAction.contains(cupChronicleCanvas.chovviSilkyAeropress)
        cupChronicleAction.setTitle(journalDraftLabel ? "Following" : "Follow", for: .normal)
        cupChronicleAction.backgroundColor = journalDraftLabel ? UIColor.clear : ChovviRoastedProfile.discoveryShelfCanvas
        cupChronicleAction.setTitleColor(journalDraftLabel ? ChovviRoastedProfile.discoveryShelfCanvas : .white, for: .normal)
    }

    private func journalDraftStatus() {
        let journalDraftRoute = Set(UserDefaults.standard.stringArray(forKey: "chovviOriginTasting") ?? [])
        let journalDraftSection = journalDraftRoute.contains(cupChronicleCanvas.chovviSilkyAcidity)
        let journalDraftPreview = cupChronicleCanvas.chovviSilkyBatch + (journalDraftSection ? 1 : 0)
        cupChronicleLabel.setImage(UIImage(systemName: journalDraftSection ? "heart.fill" : "heart"), for: .normal)
        cupChronicleLabel.setTitle("  \(journalDraftPreview) Likes", for: .normal)
    }

    private func journalDraftRoute() {
        cupChronicleStatus.text = "bubble.left  \(cupChronicleSection.count) Comments"
    }

    private func cupChronicleRecord() -> UIMenu {
        let journalDraftTrigger = UIAction(title: "Report", image: UIImage(systemName: "flag")) { [weak self] journalDraftLayout in
            _ = journalDraftLayout
            self?.journalDraftSource(journalDraftMenu: false)
        }
        let journalDraftUpdate = UIAction(title: "Block Creator", image: UIImage(systemName: "hand.raised"), attributes: .destructive) { [weak self] journalDraftDestination in
            _ = journalDraftDestination
            self?.journalDraftSource(journalDraftMenu: true)
        }
        return UIMenu(children: [journalDraftTrigger, journalDraftUpdate])
    }

    private func journalDraftSource(journalDraftMenu: Bool) {
        guard journalDraftCard() else { return }
        if !journalDraftMenu {
            let journalDraftRecord = ChovviCuppingReportProfile(
                cupKeeperCanvas: "this Coffee Moment",
                cupKeeperScroll: cupChronicleCanvas.chovviSilkyAcidity,
                cupKeeperHeader: "moment"
            ) { [weak self] in
                guard let self else { return }
                var journalDraftItem = Set(UserDefaults.standard.stringArray(forKey: "chovviCraftedTasting") ?? [])
                journalDraftItem.insert(self.cupChronicleCanvas.chovviSilkyAcidity)
                UserDefaults.standard.set(Array(journalDraftItem), forKey: "chovviCraftedTasting")
            }
            present(journalDraftRecord, animated: true)
            return
        }
        let journalDraftRecord = journalDraftMenu ? "chovviCraftedRoast" : "chovviCraftedTasting"
        var journalDraftItem = Set(UserDefaults.standard.stringArray(forKey: journalDraftRecord) ?? [])
        journalDraftItem.insert(journalDraftMenu ? cupChronicleCanvas.chovviSilkyAeropress : cupChronicleCanvas.chovviSilkyAcidity)
        UserDefaults.standard.set(Array(journalDraftItem), forKey: journalDraftRecord)

        ChovviThermalAlertView.goldenRitualSelection(self, goldenRitualChoice: journalDraftMenu ? "Creator Blocked" : "Report Received", goldenRitualCanvas: journalDraftMenu ? "This creator has been added to your blocked list." : "This item has been submitted for safety review.", goldenRitualArtwork: .success, goldenRitualStack: { [weak self] in
            if journalDraftMenu { self?.dismiss(animated: true) }
        })
    }

    private func journalDraftCard() -> Bool {
        tastingReplySelection()
    }

    @objc private func journalDraftStack() {
        guard journalDraftCard() else { return }
        var journalDraftRecord = Set(UserDefaults.standard.stringArray(forKey: "chovviOriginRoast") ?? [])
        if journalDraftRecord.contains(cupChronicleCanvas.chovviSilkyAeropress) {
            journalDraftRecord.remove(cupChronicleCanvas.chovviSilkyAeropress)
        } else {
            journalDraftRecord.insert(cupChronicleCanvas.chovviSilkyAeropress)
        }
        UserDefaults.standard.set(Array(journalDraftRecord), forKey: "chovviOriginRoast")
        journalDraftRender()
    }

    @objc private func journalDraftLabel() {
        guard journalDraftCard() else { return }
        var journalDraftRecord = Set(UserDefaults.standard.stringArray(forKey: "chovviOriginTasting") ?? [])
        if journalDraftRecord.contains(cupChronicleCanvas.chovviSilkyAcidity) {
            journalDraftRecord.remove(cupChronicleCanvas.chovviSilkyAcidity)
        } else {
            journalDraftRecord.insert(cupChronicleCanvas.chovviSilkyAcidity)
        }
        UserDefaults.standard.set(Array(journalDraftRecord), forKey: "chovviOriginTasting")
        journalDraftStatus()
    }

    @objc private func cupChronicleItem() {
        let cupChronicleSelection = cupChronicleState.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        guard journalDraftCard() else { return }
        guard !cupChronicleSelection.isEmpty else {
            ChovviThermalAlertView.goldenRitualSelection(self, goldenRitualChoice: "Comment Required", goldenRitualCanvas: "Please enter a comment before sending.", goldenRitualHeader: "Add Comment", goldenRitualArtwork: .caution)
            return
        }

        cupChronicleState.resignFirstResponder()
        cupChronicleRender.isEnabled = false
        ChovviThermalCalibrationView.goldenRitualLayout(self, goldenRitualMenu: "Posting your comment...", goldenRitualUpdate: 0.65) { [weak self] in
            guard let self else { return }
            var cupChronicleImage = UserDefaults.standard.stringArray(forKey: "chovviOriginTexture.\(self.cupChronicleCanvas.chovviSilkyAcidity)") ?? []
            cupChronicleImage.append(cupChronicleSelection)
            UserDefaults.standard.set(cupChronicleImage, forKey: "chovviOriginTexture.\(self.cupChronicleCanvas.chovviSilkyAcidity)")
            self.cupChronicleSection.append(
                ChovviHarvestProfile(tastingReplyCanvas: "chovvi-user-20", tastingReplyScroll: cupChronicleSelection, tastingReplyHeader: "Just now")
            )
            self.cupChronicleState.text = ""
            self.cupChronicleRender.isEnabled = true
            self.journalDraftUpdate()
            self.cupChronicleHeader.setContentOffset(
                CGPoint(x: 0, y: max(0, self.cupChronicleHeader.contentSize.height - self.cupChronicleHeader.bounds.height)),
                animated: true
            )
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cupChronicleItem()
        return true
    }

    @objc private func journalDraftState() {
        guard let cupChronicleScroll else { return }
        let journalDraftRender = ChovviAromaticProfile(originPortraitCanvas: cupChronicleScroll)
        let journalDraftAction = UINavigationController(rootViewController: journalDraftRender)
        journalDraftAction.modalPresentationStyle = .fullScreen
        present(journalDraftAction, animated: true)
    }

    @objc private func cupChronicleCard() {
        navigationController?.dismiss(animated: true)
    }

    @objc private func cupChronicleImage() {
        view.endEditing(true)
    }

    @objc private func cupChronicleUpdate(_ cupChronicleDestination: Notification) {
        guard
            let cupChronicleCard = cupChronicleDestination.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
            let cupChronicleRecord = cupChronicleDestination.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        else { return }
        let cupChronicleItem = view.convert(cupChronicleCard, from: nil)
        let cupChronicleSelection = max(0, view.bounds.maxY - cupChronicleItem.minY - view.safeAreaInsets.bottom)
        cupChronicleRoute?.constant = -cupChronicleSelection - 8
        cupChronicleHeader.contentInset.bottom = cupChronicleSelection
        cupChronicleHeader.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: cupChronicleSelection, right: 0)
        UIView.animate(withDuration: cupChronicleRecord) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }

    @objc private func cupChronicleDestination(_ cupChronicleCard: Notification) {
        let cupChronicleRecord = (cupChronicleCard.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0.25
        cupChronicleRoute?.constant = -8
        cupChronicleHeader.contentInset.bottom = 0
        cupChronicleHeader.verticalScrollIndicatorInsets = .zero
        UIView.animate(withDuration: cupChronicleRecord) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
}
