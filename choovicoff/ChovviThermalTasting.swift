import StoreKit
import UIKit

enum ChovviThermalTexture {
    case goldenRitualCanvas(Int)
    case goldenRitualScroll
    case goldenRitualHeader
}

@MainActor
final class ChovviThermalRoast {
    static let goldenRitualCanvas = ChovviThermalRoast()
    static let goldenRitualScroll = [
        "pkuljaohqmmmlfok",
        "kztzimfgnmcofdxk",
        "ghdlkghzmatkttpy",
        "mfpjutggqzgtvwmu",
        "xexbqslwphxnecin",
        "hngokrucoeppwwlc",
        "vjrtmtpqdezdifux"
    ]
    static let goldenRitualHeader = [
        "pkuljaohqmmmlfok": 25_000,
        "kztzimfgnmcofdxk": 12_000,
        "ghdlkghzmatkttpy": 5_500,
        "mfpjutggqzgtvwmu": 2_750,
        "xexbqslwphxnecin": 1_300,
        "hngokrucoeppwwlc": 610,
        "vjrtmtpqdezdifux": 305
    ]
    static let goldenRitualRender = [
        "pkuljaohqmmmlfok": "$99.99",
        "kztzimfgnmcofdxk": "$49.99",
        "ghdlkghzmatkttpy": "$19.99",
        "mfpjutggqzgtvwmu": "$9.99",
        "xexbqslwphxnecin": "$4.99",
        "hngokrucoeppwwlc": "$1.99",
        "vjrtmtpqdezdifux": "$0.99"
    ]

    private var goldenRitualArtwork: Task<Void, Never>?

    private init() {
        goldenRitualArtwork = Task { [weak self] in
            guard let self else { return }
            for await goldenRitualCollection in Transaction.updates {
                _ = try? await self.goldenRitualStack(goldenRitualCollection, goldenRitualStack: nil)
            }
        }
    }

    deinit {
        goldenRitualArtwork?.cancel()
    }

    func goldenRitualStatus(_ goldenRitualRoute: Product, goldenRitualStatus goldenRitualSection: String) async throws -> ChovviThermalTexture {
        let goldenRitualPreview = goldenRitualLabel(goldenRitualSection)
        let goldenRitualTrigger = try await goldenRitualRoute.purchase(options: [.appAccountToken(goldenRitualPreview)])
        switch goldenRitualTrigger {
        case .success(let goldenRitualLayout):
            let goldenRitualSource = try await goldenRitualStack(goldenRitualLayout, goldenRitualStack: goldenRitualSection)
            return .goldenRitualCanvas(goldenRitualSource)
        case .pending:
            return .goldenRitualScroll
        case .userCancelled:
            return .goldenRitualHeader
        @unknown default:
            return .goldenRitualHeader
        }
    }

    static func goldenRitualCard(_ goldenRitualRecord: String) -> Int {
        ChovviRoastReserve.availableMarks(for: goldenRitualRecord)
    }

    private func goldenRitualStack(_ goldenRitualState: VerificationResult<Transaction>, goldenRitualStack goldenRitualRender: String?) async throws -> Int {
        let goldenRitualAction: Transaction
        switch goldenRitualState {
        case .verified(let goldenRitualLabel):
            goldenRitualAction = goldenRitualLabel
        case .unverified(_, let goldenRitualStatus):
            throw goldenRitualStatus
        }
        guard let goldenRitualRoute = Self.goldenRitualHeader[goldenRitualAction.productID] else {
            await goldenRitualAction.finish()
            return 0
        }
        let goldenRitualSection = goldenRitualRender ?? goldenRitualPreview(goldenRitualAction.appAccountToken)
        guard let goldenRitualSection, !goldenRitualSection.isEmpty else { return 0 }
        let goldenRitualTrigger = goldenRitualSection.lowercased()
        let goldenRitualLayout = "chovviThermalRoast.\(goldenRitualTrigger)"
        var goldenRitualSource = Set(UserDefaults.standard.stringArray(forKey: goldenRitualLayout) ?? [])
        let goldenRitualMenu = String(goldenRitualAction.id)
        if !goldenRitualSource.contains(goldenRitualMenu) {
            let goldenRitualUpdate = Self.goldenRitualCard(goldenRitualTrigger) + goldenRitualRoute
            UserDefaults.standard.set(goldenRitualUpdate, forKey: "chovviThermalTexture.\(goldenRitualTrigger)")
            goldenRitualSource.insert(goldenRitualMenu)
            UserDefaults.standard.set(Array(goldenRitualSource), forKey: goldenRitualLayout)
            NotificationCenter.default.post(name: Notification.Name("chovviThermalInfusion"), object: nil)
            NotificationCenter.default.post(name: .cupKeeperUpdate, object: nil)
            await goldenRitualAction.finish()
            return goldenRitualRoute
        }
        await goldenRitualAction.finish()
        return 0
    }

    private func goldenRitualLabel(_ goldenRitualStatus: String) -> UUID {
        var goldenRitualRoute = UserDefaults.standard.dictionary(forKey: "chovviThermalBody") as? [String: String] ?? [:]
        let goldenRitualSection = goldenRitualStatus.lowercased()
        if let goldenRitualPreview = goldenRitualRoute[goldenRitualSection],
           let goldenRitualTrigger = UUID(uuidString: goldenRitualPreview) {
            return goldenRitualTrigger
        }
        let goldenRitualLayout = UUID()
        goldenRitualRoute[goldenRitualSection] = goldenRitualLayout.uuidString
        UserDefaults.standard.set(goldenRitualRoute, forKey: "chovviThermalBody")
        return goldenRitualLayout
    }

    private func goldenRitualPreview(_ goldenRitualTrigger: UUID?) -> String? {
        guard let goldenRitualTrigger else { return nil }
        let goldenRitualLayout = UserDefaults.standard.dictionary(forKey: "chovviThermalBody") as? [String: String] ?? [:]
        return goldenRitualLayout.first { $0.value.caseInsensitiveCompare(goldenRitualTrigger.uuidString) == .orderedSame }?.key
    }
}

final class ChovviThermalTasting: UIViewController {
    private let goldenRitualCanvas = UIScrollView()
    private let goldenRitualScroll = UIStackView()
    private let goldenRitualHeader = UILabel()
    private let goldenRitualArtwork = UIActivityIndicatorView(style: .medium)
    private var goldenRitualStack: [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        goldenRitualState()
        NotificationCenter.default.addObserver(self, selector: #selector(goldenRitualRender), name: Notification.Name("chovviThermalInfusion"), object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func goldenRitualState() { goldenRitualStateTrigger() }

    private lazy var goldenRitualStateTrigger: () -> Void = { [unowned self] in
        view.backgroundColor = UIColor(red: 1, green: 0.97, blue: 0.93, alpha: 1)
        goldenRitualCanvas.alwaysBounceVertical = true
        goldenRitualCanvas.showsVerticalScrollIndicator = false
        goldenRitualCanvas.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goldenRitualCanvas)
        goldenRitualScroll.axis = .vertical
        goldenRitualScroll.spacing = 18
        goldenRitualScroll.translatesAutoresizingMaskIntoConstraints = false
        goldenRitualCanvas.addSubview(goldenRitualScroll)

        let goldenRitualLabel = UIView()
        goldenRitualLabel.heightAnchor.constraint(equalToConstant: 58).isActive = true
        let goldenRitualStatus = UIButton(type: .system)
        goldenRitualStatus.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        goldenRitualStatus.tintColor = .black
        goldenRitualStatus.backgroundColor = .white
        goldenRitualStatus.layer.cornerRadius = 24
        goldenRitualStatus.layer.borderWidth = 1
        goldenRitualStatus.layer.borderColor = UIColor.systemGray5.cgColor
        goldenRitualStatus.addTarget(self, action: #selector(goldenRitualRoute), for: .touchUpInside)
        goldenRitualStatus.translatesAutoresizingMaskIntoConstraints = false
        goldenRitualLabel.addSubview(goldenRitualStatus)
        let goldenRitualSection = UILabel()
        goldenRitualSection.text = "Recharge"
        goldenRitualSection.font = .systemFont(ofSize: 28, weight: .black)
        goldenRitualSection.translatesAutoresizingMaskIntoConstraints = false
        goldenRitualLabel.addSubview(goldenRitualSection)
        NSLayoutConstraint.activate([
            goldenRitualStatus.leadingAnchor.constraint(equalTo: goldenRitualLabel.leadingAnchor), goldenRitualStatus.centerYAnchor.constraint(equalTo: goldenRitualLabel.centerYAnchor), goldenRitualStatus.widthAnchor.constraint(equalToConstant: 48),
            goldenRitualStatus.heightAnchor.constraint(equalTo: goldenRitualStatus.widthAnchor), goldenRitualSection.leadingAnchor.constraint(equalTo: goldenRitualStatus.trailingAnchor, constant: 16), goldenRitualSection.centerYAnchor.constraint(equalTo: goldenRitualStatus.centerYAnchor)
        ])
        goldenRitualScroll.addArrangedSubview(goldenRitualLabel)

        let goldenRitualPreview = UIView()
        goldenRitualPreview.backgroundColor = UIColor(red: 0.94, green: 0.80, blue: 0.63, alpha: 1)
        goldenRitualPreview.layer.cornerRadius = 24
        goldenRitualPreview.heightAnchor.constraint(equalToConstant: 176).isActive = true
        let goldenRitualTrigger = UIImageView(image: UIImage(named: "Rbeijigbig"))
        goldenRitualTrigger.tintColor = UIColor(red: 0.95, green: 0.65, blue: 0.12, alpha: 1)
        goldenRitualTrigger.contentMode = .scaleAspectFit
        goldenRitualTrigger.translatesAutoresizingMaskIntoConstraints = false
        goldenRitualPreview.addSubview(goldenRitualTrigger)
        let goldenRitualLayout = UILabel()
        goldenRitualLayout.text = "Available Coins"
        goldenRitualLayout.font = .systemFont(ofSize: 15, weight: .medium)
        goldenRitualLayout.textAlignment = .center
        goldenRitualLayout.translatesAutoresizingMaskIntoConstraints = false
        goldenRitualPreview.addSubview(goldenRitualLayout)
        goldenRitualHeader.font = .systemFont(ofSize: 25, weight: .black)
        goldenRitualHeader.textAlignment = .center
        goldenRitualHeader.translatesAutoresizingMaskIntoConstraints = false
        goldenRitualPreview.addSubview(goldenRitualHeader)
        NSLayoutConstraint.activate([
            goldenRitualTrigger.centerXAnchor.constraint(equalTo: goldenRitualPreview.centerXAnchor), goldenRitualTrigger.topAnchor.constraint(equalTo: goldenRitualPreview.topAnchor, constant: 22), goldenRitualTrigger.widthAnchor.constraint(equalToConstant: 60),
            goldenRitualTrigger.heightAnchor.constraint(equalTo: goldenRitualTrigger.widthAnchor), goldenRitualLayout.topAnchor.constraint(equalTo: goldenRitualTrigger.bottomAnchor, constant: 8), goldenRitualLayout.leadingAnchor.constraint(equalTo: goldenRitualPreview.leadingAnchor, constant: 12),
            goldenRitualLayout.trailingAnchor.constraint(equalTo: goldenRitualPreview.trailingAnchor, constant: -12), goldenRitualHeader.topAnchor.constraint(equalTo: goldenRitualLayout.bottomAnchor, constant: 2), goldenRitualHeader.leadingAnchor.constraint(equalTo: goldenRitualLayout.leadingAnchor),
            goldenRitualHeader.trailingAnchor.constraint(equalTo: goldenRitualLayout.trailingAnchor)
        ])
        goldenRitualScroll.addArrangedSubview(goldenRitualPreview)

        goldenRitualArtwork.hidesWhenStopped = true
        goldenRitualScroll.addArrangedSubview(goldenRitualArtwork)

        var goldenRitualSource = 0
        while goldenRitualSource < ChovviThermalRoast.goldenRitualScroll.count {
            let goldenRitualMenu = UIStackView()
            goldenRitualMenu.axis = .horizontal
            goldenRitualMenu.spacing = 10
            goldenRitualMenu.distribution = .fillEqually
            for goldenRitualUpdate in 0..<3 {
                let goldenRitualDestination = goldenRitualSource + goldenRitualUpdate
                if ChovviThermalRoast.goldenRitualScroll.indices.contains(goldenRitualDestination) {
                    let goldenRitualCard = UIButton(type: .custom)
                    goldenRitualCard.tag = goldenRitualDestination
                    goldenRitualCard.backgroundColor = UIColor(red: 0.94, green: 0.80, blue: 0.63, alpha: 1)
                    goldenRitualCard.layer.cornerRadius = 22
                    goldenRitualCard.addTarget(self, action: #selector(goldenRitualItem(_:)), for: .touchUpInside)
                    let goldenRitualRecord = ChovviThermalRoast.goldenRitualScroll[goldenRitualDestination]
                    let goldenRitualSelection = ChovviThermalRoast.goldenRitualHeader[goldenRitualRecord] ?? 0
                    let goldenRitualChoice = ChovviThermalRoast.goldenRitualRender[goldenRitualRecord] ?? ""

                    let coffeeBulletinCanvas = UIImageView(image: UIImage(named: "Rbeijigsmall"))
                    coffeeBulletinCanvas.contentMode = .scaleAspectFit
                    coffeeBulletinCanvas.isUserInteractionEnabled = false
                    coffeeBulletinCanvas.translatesAutoresizingMaskIntoConstraints = false
                    goldenRitualCard.addSubview(coffeeBulletinCanvas)

                    let coffeeBulletinScroll = UILabel()
                    coffeeBulletinScroll.text = goldenRitualSelection.formatted()
                    coffeeBulletinScroll.font = .systemFont(ofSize: 20, weight: .black)
                    coffeeBulletinScroll.textColor = UIColor(red: 0.08, green: 0.08, blue: 0.11, alpha: 1)
                    coffeeBulletinScroll.textAlignment = .center
                    coffeeBulletinScroll.isUserInteractionEnabled = false
                    coffeeBulletinScroll.translatesAutoresizingMaskIntoConstraints = false
                    goldenRitualCard.addSubview(coffeeBulletinScroll)

                    let coffeeBulletinArtwork = UIView()
                    coffeeBulletinArtwork.backgroundColor = .white
                    coffeeBulletinArtwork.layer.cornerRadius = 19
                    coffeeBulletinArtwork.isUserInteractionEnabled = false
                    coffeeBulletinArtwork.translatesAutoresizingMaskIntoConstraints = false
                    goldenRitualCard.addSubview(coffeeBulletinArtwork)

                    let coffeeBulletinCollection = UILabel()
                    coffeeBulletinCollection.text = goldenRitualChoice
                    coffeeBulletinCollection.font = .systemFont(ofSize: 17, weight: .black)
                    coffeeBulletinCollection.textColor = UIColor(red: 0.08, green: 0.08, blue: 0.11, alpha: 1)
                    coffeeBulletinCollection.textAlignment = .center
                    coffeeBulletinCollection.translatesAutoresizingMaskIntoConstraints = false
                    coffeeBulletinArtwork.addSubview(coffeeBulletinCollection)

                    NSLayoutConstraint.activate([
                        coffeeBulletinCanvas.topAnchor.constraint(equalTo: goldenRitualCard.topAnchor, constant: 12), coffeeBulletinCanvas.centerXAnchor.constraint(equalTo: goldenRitualCard.centerXAnchor), coffeeBulletinCanvas.widthAnchor.constraint(equalToConstant: 38),
                        coffeeBulletinCanvas.heightAnchor.constraint(equalTo: coffeeBulletinCanvas.widthAnchor), coffeeBulletinScroll.topAnchor.constraint(equalTo: coffeeBulletinCanvas.bottomAnchor, constant: 3), coffeeBulletinScroll.leadingAnchor.constraint(equalTo: goldenRitualCard.leadingAnchor, constant: 5),
                        coffeeBulletinScroll.trailingAnchor.constraint(equalTo: goldenRitualCard.trailingAnchor, constant: -5), coffeeBulletinArtwork.leadingAnchor.constraint(equalTo: goldenRitualCard.leadingAnchor, constant: 10), coffeeBulletinArtwork.trailingAnchor.constraint(equalTo: goldenRitualCard.trailingAnchor, constant: -10),
                        coffeeBulletinArtwork.bottomAnchor.constraint(equalTo: goldenRitualCard.bottomAnchor, constant: -12), coffeeBulletinArtwork.heightAnchor.constraint(equalToConstant: 38), coffeeBulletinCollection.topAnchor.constraint(equalTo: coffeeBulletinArtwork.topAnchor),
                        coffeeBulletinCollection.leadingAnchor.constraint(equalTo: coffeeBulletinArtwork.leadingAnchor, constant: 4), coffeeBulletinCollection.trailingAnchor.constraint(equalTo: coffeeBulletinArtwork.trailingAnchor, constant: -4), coffeeBulletinCollection.bottomAnchor.constraint(equalTo: coffeeBulletinArtwork.bottomAnchor)
                    ])

                    goldenRitualMenu.addArrangedSubview(goldenRitualCard)
                    goldenRitualStack.append(goldenRitualCard)
                } else {
                    goldenRitualMenu.addArrangedSubview(UIView())
                }
            }
            goldenRitualMenu.heightAnchor.constraint(equalToConstant: 168).isActive = true
            goldenRitualScroll.addArrangedSubview(goldenRitualMenu)
            goldenRitualSource += 3
        }

        NSLayoutConstraint.activate([
            goldenRitualCanvas.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), goldenRitualCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor), goldenRitualCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            goldenRitualCanvas.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), goldenRitualScroll.topAnchor.constraint(equalTo: goldenRitualCanvas.contentLayoutGuide.topAnchor, constant: 18), goldenRitualScroll.leadingAnchor.constraint(equalTo: goldenRitualCanvas.contentLayoutGuide.leadingAnchor, constant: 16),
            goldenRitualScroll.trailingAnchor.constraint(equalTo: goldenRitualCanvas.contentLayoutGuide.trailingAnchor, constant: -16), goldenRitualScroll.bottomAnchor.constraint(equalTo: goldenRitualCanvas.contentLayoutGuide.bottomAnchor, constant: -30), goldenRitualScroll.widthAnchor.constraint(equalTo: goldenRitualCanvas.frameLayoutGuide.widthAnchor, constant: -32)
        ])
        goldenRitualRender()
    }

    @objc private func goldenRitualRender() {
        let goldenRitualAction = UserDefaults.standard.string(forKey: "hooviEmail")?.lowercased() ?? ""
        goldenRitualHeader.text = ChovviThermalRoast.goldenRitualCard(goldenRitualAction).formatted()
    }

    @objc private func goldenRitualRoute() {
        dismiss(animated: true)
    }

    @objc private func goldenRitualItem(_ goldenRitualSelection: UIButton) {
        guard UserDefaults.standard.bool(forKey: "choovilogin"),
              let goldenRitualImage = UserDefaults.standard.string(forKey: "hooviEmail"),
              !goldenRitualImage.isEmpty else {
            filterRitualMenu("Sign in required", goldenRitualMenu: "Sign in before selecting an item.")
            return
        }
        let goldenRitualChoice = ChovviThermalRoast.goldenRitualScroll[goldenRitualSelection.tag]
        goldenRitualStack.forEach { $0.isEnabled = false }
        goldenRitualArtwork.startAnimating()
        Task {
            defer {
                goldenRitualArtwork.stopAnimating()
                goldenRitualStack.forEach { $0.isEnabled = true }
            }
            do {
                guard let goldenRitualRecord = try await Product.products(for: [goldenRitualChoice]).first else {
                    filterRitualMenu("Item unavailable", goldenRitualMenu: "The App Store could not find this item. Please try again later.")
                    return
                }
                let goldenRitualCanvas = try await ChovviThermalRoast.goldenRitualCanvas.goldenRitualStatus(goldenRitualRecord, goldenRitualStatus: goldenRitualImage)
                switch goldenRitualCanvas {
                case .goldenRitualCanvas(let goldenRitualScroll):
                    goldenRitualRender()
                    if goldenRitualScroll > 0 {
                        filterRitualMenu("Completed", goldenRitualMenu: "\(goldenRitualScroll.formatted()) coins were added to your account.")
                    }
                case .goldenRitualScroll:
                    filterRitualMenu("Awaiting approval", goldenRitualMenu: "The App Store will complete this request after approval.")
                case .goldenRitualHeader:
                    break
                }
            } catch {
                filterRitualMenu("Unable to complete", goldenRitualMenu: "The App Store could not verify this transaction. No coins were added.")
            }
        }
    }

    private func filterRitualMenu(_ goldenRitualUpdate: String, goldenRitualMenu goldenRitualDestination: String) {
        ChovviThermalAlertView.goldenRitualSelection(self, goldenRitualChoice: goldenRitualUpdate, goldenRitualCanvas: goldenRitualDestination, goldenRitualArtwork: .caution)
    }
}
