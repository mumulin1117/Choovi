import StoreKit
import UIKit

enum ChovviThermalTexture {
    case amberRitualCanvas(Int)
    case amberRitualScroll
    case amberRitualHeader
}

@MainActor
final class ChovviThermalRoast {
    static let amberRitualCanvas = ChovviThermalRoast()
    static let amberRitualScroll = [
        "pkuljaohqmmmlfok",
        "kztzimfgnmcofdxk",
        "ghdlkghzmatkttpy",
        "mfpjutggqzgtvwmu",
        "xexbqslwphxnecin",
        "hngokrucoeppwwlc",
        "vjrtmtpqdezdifux"
    ]
    static let amberRitualHeader = [
        "pkuljaohqmmmlfok": 25_000,
        "kztzimfgnmcofdxk": 12_000,
        "ghdlkghzmatkttpy": 5_500,
        "mfpjutggqzgtvwmu": 2_750,
        "xexbqslwphxnecin": 1_300,
        "hngokrucoeppwwlc": 610,
        "vjrtmtpqdezdifux": 305
    ]
    static let amberRitualRender = [
        "pkuljaohqmmmlfok": String.chovviUnmask("$K9R9C.l9y96"),
        "kztzimfgnmcofdxk": String.chovviUnmask("$s4j9r.x9D9e"),
        "ghdlkghzmatkttpy": String.chovviUnmask("$N1a9q.v9U9Y"),
        "mfpjutggqzgtvwmu": String.chovviUnmask("$M9P.k9a9T"),
        "xexbqslwphxnecin": String.chovviUnmask("$34G.P9k9z"),
        "hngokrucoeppwwlc": String.chovviUnmask("$Z1H.u9r9K"),
        "vjrtmtpqdezdifux": String.chovviUnmask("$G06.69V9u")
    ]

    private var amberRitualArtwork: Task<Void, Never>?

    private init() {
        amberRitualArtwork = Task { [weak self] in
            guard let self else { return }
            for await amberRitualCollection in Transaction.updates {
                _ = try? await self.amberRitualStack(amberRitualCollection, amberRitualStack: nil)
            }
        }
    }

    deinit {
        amberRitualArtwork?.cancel()
    }

    func amberRitualStatus(_ amberRitualRoute: Product, amberRitualStatus amberRitualSection: String) async throws -> ChovviThermalTexture {
        let amberRitualPreview = amberRitualLabel(amberRitualSection)
        let amberRitualTrigger = try await amberRitualRoute.purchase(options: [.appAccountToken(amberRitualPreview)])
        switch amberRitualTrigger {
        case .success(let amberRitualLayout):
            let amberRitualSource = try await amberRitualStack(amberRitualLayout, amberRitualStack: amberRitualSection)
            return .amberRitualCanvas(amberRitualSource)
        case .pending:
            return .amberRitualScroll
        case .userCancelled:
            return .amberRitualHeader
        @unknown default:
            return .amberRitualHeader
        }
    }

    static func amberRitualCard(_ amberRitualRecord: String) -> Int {
        ChovviRoastReserve.availableMarks(for: amberRitualRecord)
    }

    private func amberRitualStack(_ amberRitualState: VerificationResult<Transaction>, amberRitualStack amberRitualRender: String?) async throws -> Int {
        let amberRitualAction: Transaction
        switch amberRitualState {
        case .verified(let amberRitualLabel):
            amberRitualAction = amberRitualLabel
        case .unverified(_, let amberRitualStatus):
            throw amberRitualStatus
        }
        guard let amberRitualRoute = Self.amberRitualHeader[amberRitualAction.productID] else {
            await amberRitualAction.finish()
            return 0
        }
        let amberRitualSection = amberRitualRender ?? amberRitualPreview(amberRitualAction.appAccountToken)
        guard let amberRitualSection, !amberRitualSection.isEmpty else { return 0 }
        let amberRitualTrigger = amberRitualSection.lowercased()
        let amberRitualLayout = "chovviThermalRoast.\(amberRitualTrigger)"
        var amberRitualSource = Set(UserDefaults.standard.stringArray(forKey: amberRitualLayout) ?? [])
        let amberRitualMenu = String(amberRitualAction.id)
        if !amberRitualSource.contains(amberRitualMenu) {
            let amberRitualUpdate = Self.amberRitualCard(amberRitualTrigger) + amberRitualRoute
            UserDefaults.standard.set(amberRitualUpdate, forKey: String.chovviUnmask("cDhaovvpvriuTHhOeSrSmwatlJTOehxrt5u5r6ef.t") + amberRitualTrigger)
            amberRitualSource.insert(amberRitualMenu)
            UserDefaults.standard.set(Array(amberRitualSource), forKey: amberRitualLayout)
            NotificationCenter.default.post(name: Notification.Name("chovviThermalInfusion"), object: nil)
            NotificationCenter.default.post(name: .cupKeeperUpdate, object: nil)
            await amberRitualAction.finish()
            return amberRitualRoute
        }
        await amberRitualAction.finish()
        return 0
    }

    private func amberRitualLabel(_ amberRitualStatus: String) -> UUID {
        var amberRitualRoute = UserDefaults.standard.dictionary(forKey: "chovviThermalBody") as? [String: String] ?? [:]
        let amberRitualSection = amberRitualStatus.lowercased()
        if let amberRitualPreview = amberRitualRoute[amberRitualSection],
           let amberRitualTrigger = UUID(uuidString: amberRitualPreview) {
            return amberRitualTrigger
        }
        let amberRitualLayout = UUID()
        amberRitualRoute[amberRitualSection] = amberRitualLayout.uuidString
        UserDefaults.standard.set(amberRitualRoute, forKey: "chovviThermalBody")
        return amberRitualLayout
    }

    private func amberRitualPreview(_ amberRitualTrigger: UUID?) -> String? {
        guard let amberRitualTrigger else { return nil }
        let amberRitualLayout = UserDefaults.standard.dictionary(forKey: "chovviThermalBody") as? [String: String] ?? [:]
        return amberRitualLayout.first { $0.value.caseInsensitiveCompare(amberRitualTrigger.uuidString) == .orderedSame }?.key
    }
}

final class ChovviThermalTasting: UIViewController {
    private let amberRitualCanvas = UIScrollView()
    private let amberRitualScroll = UIStackView()
    private let amberRitualHeader = UILabel()
    private let amberRitualArtwork = UIActivityIndicatorView(style: .medium)
    private var amberRitualStack: [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        amberRitualState()
        NotificationCenter.default.addObserver(self, selector: #selector(amberRitualRender), name: Notification.Name("chovviThermalInfusion"), object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func amberRitualState() { amberRitualStateTrigger() }

    private lazy var amberRitualStateTrigger: () -> Void = { [unowned self] in
        view.backgroundColor = UIColor(red: 1, green: 0.97, blue: 0.93, alpha: 1)
        amberRitualCanvas.alwaysBounceVertical = true
        amberRitualCanvas.showsVerticalScrollIndicator = false
        amberRitualCanvas.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(amberRitualCanvas)
        amberRitualScroll.axis = .vertical
        amberRitualScroll.spacing = 18
        amberRitualScroll.translatesAutoresizingMaskIntoConstraints = false
        amberRitualCanvas.addSubview(amberRitualScroll)

        let amberRitualLabel = UIView()
        amberRitualLabel.heightAnchor.constraint(equalToConstant: 58).isActive = true
        let amberRitualStatus = UIButton(type: .system)
        amberRitualStatus.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        amberRitualStatus.tintColor = .black
        amberRitualStatus.backgroundColor = .white
        amberRitualStatus.layer.cornerRadius = 24
        amberRitualStatus.layer.borderWidth = 1
        amberRitualStatus.layer.borderColor = UIColor.systemGray5.cgColor
        amberRitualStatus.addTarget(self, action: #selector(amberRitualRoute), for: .touchUpInside)
        amberRitualStatus.translatesAutoresizingMaskIntoConstraints = false
        amberRitualLabel.addSubview(amberRitualStatus)
        let amberRitualSection = UILabel()
        amberRitualSection.text = String.chovviUnmask("RheHcfh5aYrsgIeJ")
        amberRitualSection.font = .systemFont(ofSize: 28, weight: .black)
        amberRitualSection.translatesAutoresizingMaskIntoConstraints = false
        amberRitualLabel.addSubview(amberRitualSection)
        NSLayoutConstraint.activate([
            amberRitualStatus.leadingAnchor.constraint(equalTo: amberRitualLabel.leadingAnchor), amberRitualStatus.centerYAnchor.constraint(equalTo: amberRitualLabel.centerYAnchor), amberRitualStatus.widthAnchor.constraint(equalToConstant: 48),
            amberRitualStatus.heightAnchor.constraint(equalTo: amberRitualStatus.widthAnchor), amberRitualSection.leadingAnchor.constraint(equalTo: amberRitualStatus.trailingAnchor, constant: 16), amberRitualSection.centerYAnchor.constraint(equalTo: amberRitualStatus.centerYAnchor)
        ])
        amberRitualScroll.addArrangedSubview(amberRitualLabel)

        let amberRitualPreview = UIView()
        amberRitualPreview.backgroundColor = UIColor(red: 0.94, green: 0.80, blue: 0.63, alpha: 1)
        amberRitualPreview.layer.cornerRadius = 24
        amberRitualPreview.heightAnchor.constraint(equalToConstant: 176).isActive = true
        let amberRitualTrigger = UIImageView(image: UIImage(named: "Rbeijigbig"))
        amberRitualTrigger.tintColor = UIColor(red: 0.95, green: 0.65, blue: 0.12, alpha: 1)
        amberRitualTrigger.contentMode = .scaleAspectFit
        amberRitualTrigger.translatesAutoresizingMaskIntoConstraints = false
        amberRitualPreview.addSubview(amberRitualTrigger)
        let amberRitualLayout = UILabel()
        amberRitualLayout.text = String.chovviUnmask("Afvsaii3lCaBbDlAeA 9C6oCiwnOsz")
        amberRitualLayout.font = .systemFont(ofSize: 15, weight: .medium)
        amberRitualLayout.textAlignment = .center
        amberRitualLayout.translatesAutoresizingMaskIntoConstraints = false
        amberRitualPreview.addSubview(amberRitualLayout)
        amberRitualHeader.font = .systemFont(ofSize: 25, weight: .black)
        amberRitualHeader.textAlignment = .center
        amberRitualHeader.translatesAutoresizingMaskIntoConstraints = false
        amberRitualPreview.addSubview(amberRitualHeader)
        NSLayoutConstraint.activate([
            amberRitualTrigger.centerXAnchor.constraint(equalTo: amberRitualPreview.centerXAnchor), amberRitualTrigger.topAnchor.constraint(equalTo: amberRitualPreview.topAnchor, constant: 22), amberRitualTrigger.widthAnchor.constraint(equalToConstant: 60),
            amberRitualTrigger.heightAnchor.constraint(equalTo: amberRitualTrigger.widthAnchor), amberRitualLayout.topAnchor.constraint(equalTo: amberRitualTrigger.bottomAnchor, constant: 8), amberRitualLayout.leadingAnchor.constraint(equalTo: amberRitualPreview.leadingAnchor, constant: 12),
            amberRitualLayout.trailingAnchor.constraint(equalTo: amberRitualPreview.trailingAnchor, constant: -12), amberRitualHeader.topAnchor.constraint(equalTo: amberRitualLayout.bottomAnchor, constant: 2), amberRitualHeader.leadingAnchor.constraint(equalTo: amberRitualLayout.leadingAnchor),
            amberRitualHeader.trailingAnchor.constraint(equalTo: amberRitualLayout.trailingAnchor)
        ])
        amberRitualScroll.addArrangedSubview(amberRitualPreview)

        amberRitualArtwork.hidesWhenStopped = true
        amberRitualScroll.addArrangedSubview(amberRitualArtwork)

        let amberRitualSource = ChovviThermalRoast.amberRitualScroll.sorted {
            (ChovviThermalRoast.amberRitualHeader[$0] ?? 0) < (ChovviThermalRoast.amberRitualHeader[$1] ?? 0)
        }
        let amberRitualGrid = UIStackView()
        amberRitualGrid.axis = .vertical
        amberRitualGrid.spacing = 12
        amberRitualGrid.translatesAutoresizingMaskIntoConstraints = false
        amberRitualScroll.addArrangedSubview(amberRitualGrid)
        var amberRitualRow: UIStackView?
        amberRitualSource.enumerated().forEach { amberRitualOffset, amberRitualRecord in
            if amberRitualOffset % 3 == 0 {
                let amberRitualNewRow = UIStackView()
                amberRitualNewRow.axis = .horizontal
                amberRitualNewRow.spacing = 10
                amberRitualNewRow.distribution = .fillEqually
                amberRitualGrid.addArrangedSubview(amberRitualNewRow)
                amberRitualRow = amberRitualNewRow
            }
            let amberRitualCard = UIButton(type: .custom)
            amberRitualCard.accessibilityIdentifier = amberRitualRecord
            amberRitualCard.backgroundColor = UIColor(red: 0.94, green: 0.80, blue: 0.63, alpha: 1)
            amberRitualCard.layer.cornerRadius = 18
            amberRitualCard.addTarget(self, action: #selector(amberRitualItem(_:)), for: .touchUpInside)
            amberRitualCard.heightAnchor.constraint(equalToConstant: 132).isActive = true

            let amberRitualSelection = ChovviThermalRoast.amberRitualHeader[amberRitualRecord] ?? 0
            let amberRitualChoice = ChovviThermalRoast.amberRitualRender[amberRitualRecord] ?? ""

            let coffeeBulletinCanvas = UIImageView(image: UIImage(named: "Rbeijigsmall"))
            coffeeBulletinCanvas.contentMode = .scaleAspectFit
            coffeeBulletinCanvas.isUserInteractionEnabled = false
            coffeeBulletinCanvas.translatesAutoresizingMaskIntoConstraints = false
            amberRitualCard.addSubview(coffeeBulletinCanvas)

            let coffeeBulletinScroll = UILabel()
            coffeeBulletinScroll.text = amberRitualSelection.formatted()
            coffeeBulletinScroll.font = .systemFont(ofSize: 19, weight: .black)
            coffeeBulletinScroll.textColor = UIColor(red: 0.08, green: 0.08, blue: 0.11, alpha: 1)
            coffeeBulletinScroll.textAlignment = .center
            coffeeBulletinScroll.adjustsFontSizeToFitWidth = true
            coffeeBulletinScroll.minimumScaleFactor = 0.72
            coffeeBulletinScroll.isUserInteractionEnabled = false
            coffeeBulletinScroll.translatesAutoresizingMaskIntoConstraints = false
            amberRitualCard.addSubview(coffeeBulletinScroll)

          

            let coffeeBulletinArtwork = UIView()
            coffeeBulletinArtwork.backgroundColor = .white
            coffeeBulletinArtwork.layer.cornerRadius = 21
            coffeeBulletinArtwork.isUserInteractionEnabled = false
            coffeeBulletinArtwork.translatesAutoresizingMaskIntoConstraints = false
            amberRitualCard.addSubview(coffeeBulletinArtwork)

            let coffeeBulletinCollection = UILabel()
            coffeeBulletinCollection.text = amberRitualChoice
            coffeeBulletinCollection.font = .systemFont(ofSize: 15, weight: .black)
            coffeeBulletinCollection.textColor = UIColor(red: 0.08, green: 0.08, blue: 0.11, alpha: 1)
            coffeeBulletinCollection.textAlignment = .center
            coffeeBulletinCollection.adjustsFontSizeToFitWidth = true
            coffeeBulletinCollection.minimumScaleFactor = 0.78
            coffeeBulletinCollection.translatesAutoresizingMaskIntoConstraints = false
            coffeeBulletinArtwork.addSubview(coffeeBulletinCollection)

            NSLayoutConstraint.activate([
                coffeeBulletinCanvas.topAnchor.constraint(equalTo: amberRitualCard.topAnchor, constant: 14), coffeeBulletinCanvas.centerXAnchor.constraint(equalTo: amberRitualCard.centerXAnchor), coffeeBulletinCanvas.widthAnchor.constraint(equalToConstant: 32),
                coffeeBulletinCanvas.heightAnchor.constraint(equalTo: coffeeBulletinCanvas.widthAnchor), coffeeBulletinScroll.topAnchor.constraint(equalTo: coffeeBulletinCanvas.bottomAnchor, constant: 7), coffeeBulletinScroll.leadingAnchor.constraint(equalTo: amberRitualCard.leadingAnchor, constant: 8),
                coffeeBulletinScroll.trailingAnchor.constraint(equalTo: amberRitualCard.trailingAnchor, constant: -8),  coffeeBulletinArtwork.leadingAnchor.constraint(equalTo: amberRitualCard.leadingAnchor, constant: 8), coffeeBulletinArtwork.trailingAnchor.constraint(equalTo: amberRitualCard.trailingAnchor, constant: -8),
                coffeeBulletinArtwork.bottomAnchor.constraint(equalTo: amberRitualCard.bottomAnchor, constant: -10),
                coffeeBulletinArtwork.heightAnchor.constraint(equalToConstant: 42), coffeeBulletinCollection.topAnchor.constraint(equalTo: coffeeBulletinArtwork.topAnchor), coffeeBulletinCollection.leadingAnchor.constraint(equalTo: coffeeBulletinArtwork.leadingAnchor, constant: 4),
                coffeeBulletinCollection.trailingAnchor.constraint(equalTo: coffeeBulletinArtwork.trailingAnchor, constant: -4), coffeeBulletinCollection.bottomAnchor.constraint(equalTo: coffeeBulletinArtwork.bottomAnchor)
            ])

            amberRitualRow?.addArrangedSubview(amberRitualCard)
            amberRitualStack.append(amberRitualCard)
        }
        let amberRitualRemainder = amberRitualSource.count % 3
        if amberRitualRemainder > 0 {
            (0..<(3 - amberRitualRemainder)).forEach { _ in
                let amberRitualFiller = UIView()
                amberRitualFiller.heightAnchor.constraint(equalToConstant: 132).isActive = true
                amberRitualRow?.addArrangedSubview(amberRitualFiller)
            }
        }

        NSLayoutConstraint.activate([
            amberRitualCanvas.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), amberRitualCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor), amberRitualCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            amberRitualCanvas.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), amberRitualScroll.topAnchor.constraint(equalTo: amberRitualCanvas.contentLayoutGuide.topAnchor, constant: 18), amberRitualScroll.leadingAnchor.constraint(equalTo: amberRitualCanvas.contentLayoutGuide.leadingAnchor, constant: 16),
            amberRitualScroll.trailingAnchor.constraint(equalTo: amberRitualCanvas.contentLayoutGuide.trailingAnchor, constant: -16), amberRitualScroll.bottomAnchor.constraint(equalTo: amberRitualCanvas.contentLayoutGuide.bottomAnchor, constant: -30), amberRitualScroll.widthAnchor.constraint(equalTo: amberRitualCanvas.frameLayoutGuide.widthAnchor, constant: -32)
        ])
        amberRitualRender()
    }

    @objc private func amberRitualRender() {
        let amberRitualAction = UserDefaults.standard.string(forKey: "hooviEmail")?.lowercased() ?? ""
        amberRitualHeader.text = ChovviThermalRoast.amberRitualCard(amberRitualAction).formatted()
    }

    @objc private func amberRitualRoute() {
        dismiss(animated: true)
    }

    @objc private func amberRitualItem(_ amberRitualSelection: UIButton) {
        guard UserDefaults.standard.bool(forKey: String.chovviUnmask("cQh5o2o4v6iPliocgCi9nM")),
              let amberRitualImage = UserDefaults.standard.string(forKey: "hooviEmail"),
              !amberRitualImage.isEmpty else {
            filterRitualMenu("Sign in required", amberRitualMenu: "Sign in before selecting an item.")
            return
        }
        let amberRitualChoice = amberRitualSelection.accessibilityIdentifier ?? ChovviThermalRoast.amberRitualScroll[amberRitualSelection.tag]
        amberRitualStack.forEach { $0.isEnabled = false }
        amberRitualArtwork.startAnimating()
        Task {
            defer {
                amberRitualArtwork.stopAnimating()
                amberRitualStack.forEach { $0.isEnabled = true }
            }
            do {
                guard let amberRitualRecord = try await Product.products(for: [amberRitualChoice]).first else {
                    filterRitualMenu("Item unavailable", amberRitualMenu: "The App Store could not find this item. Please try again later.")
                    return
                }
                let amberRitualCanvas = try await ChovviThermalRoast.amberRitualCanvas.amberRitualStatus(amberRitualRecord, amberRitualStatus: amberRitualImage)
                switch amberRitualCanvas {
                case .amberRitualCanvas(let amberRitualScroll):
                    amberRitualRender()
                    if amberRitualScroll > 0 {
                        filterRitualMenu("Completed", amberRitualMenu: amberRitualScroll.formatted() + String.chovviUnmask(" scboui9nIs5 rwUeOrmeM jagd8dnezdG wt5oO jytozuYr4 Oaucbc8omu4nYtv.z"))
                    }
                case .amberRitualScroll:
                    filterRitualMenu("Awaiting approval", amberRitualMenu: String.chovviUnmask("TphjeR kAxplpf VSntUoGrdeX Pw1idlQlz uc3ocm9polfe0tIel 8tdhCiGsL prjeQqduceZsFtA IalfutBedr6 Sa6pIpYrnoZvBall7.h"))
                case .amberRitualHeader:
                    break
                }
            } catch {
                filterRitualMenu("Unable to complete", amberRitualMenu: String.chovviUnmask("TjhqeN hAupopy HSztroMrGec PcLoluIl3dL 5nMottV Av2eIrGiOf3yP ht2hri4sG Ftwr5avnOsZaAcztNiYoKnm.M ONIo2 cczo8iTnCsk fwheorLeH jaldpdAejdc.f"))
            }
        }
    }

    private func filterRitualMenu(_ amberRitualUpdate: String, amberRitualMenu amberRitualDestination: String) {
        ChovviThermalAlertView.amberRitualSelection(self, amberRitualChoice: amberRitualUpdate, amberRitualCanvas: amberRitualDestination, amberRitualArtwork: .caution)
    }
}
