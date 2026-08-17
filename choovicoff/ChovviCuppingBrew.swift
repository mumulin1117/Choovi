import PhotosUI
import UIKit

extension Notification.Name {
    static let cupKeeperUpdate = Notification.Name("chovviCuppingInfusion")
}

final class ChovviCuppingBrew: UIViewController {
    private let cupKeeperCanvas = UIScrollView()
    private let cupKeeperScroll = UIStackView()
    private var cupKeeperHeader = 0
    private var cupKeeperArtwork: [ChovviCaramelBrew] = []
    private var cupKeeperCollection: [ChovviSilkyBrew] = []
    private let cupKeeperLabel = UIRefreshControl()
    static let cupKeeperStack = UIColor(red: 0.84, green: 0.61, blue: 0.31, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        cupKeeperState()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(cupKeeperRender),
            name: .cupKeeperUpdate,
            object: nil
        )
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cupKeeperRender()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func cupKeeperState() {
        view.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.99, alpha: 1)
        cupKeeperCanvas.alwaysBounceVertical = true
        cupKeeperCanvas.showsVerticalScrollIndicator = false
        cupKeeperLabel.tintColor = Self.cupKeeperStack
        cupKeeperLabel.addTarget(self, action: #selector(cupKeeperRoute(_:)), for: .valueChanged)
        cupKeeperCanvas.refreshControl = cupKeeperLabel
        cupKeeperCanvas.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cupKeeperCanvas)

        cupKeeperScroll.axis = .vertical
        cupKeeperScroll.spacing = 0
        cupKeeperScroll.translatesAutoresizingMaskIntoConstraints = false
        cupKeeperCanvas.addSubview(cupKeeperScroll)

        NSLayoutConstraint.activate([
            cupKeeperCanvas.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), cupKeeperCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor), cupKeeperCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cupKeeperCanvas.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), cupKeeperScroll.topAnchor.constraint(equalTo: cupKeeperCanvas.contentLayoutGuide.topAnchor), cupKeeperScroll.leadingAnchor.constraint(equalTo: cupKeeperCanvas.contentLayoutGuide.leadingAnchor),
            cupKeeperScroll.trailingAnchor.constraint(equalTo: cupKeeperCanvas.contentLayoutGuide.trailingAnchor), cupKeeperScroll.bottomAnchor.constraint(equalTo: cupKeeperCanvas.contentLayoutGuide.bottomAnchor, constant: -24), cupKeeperScroll.widthAnchor.constraint(equalTo: cupKeeperCanvas.frameLayoutGuide.widthAnchor)
        ])
    }

    @objc private func cupKeeperRender() {
        cupKeeperScroll.arrangedSubviews.forEach { cupKeeperAction in
            cupKeeperScroll.removeArrangedSubview(cupKeeperAction)
            cupKeeperAction.removeFromSuperview()
        }
        let cupKeeperLabel = UserDefaults.standard.bool(forKey: "choovilogin")
        cupKeeperStatus()
        let cupKeeperRoute = ChovviCitrusBrew.roastArchiveCanvas.first { $0.chovviBotanicalAcidity == "chovvi-user-20" }
            ?? ChovviCitrusBrew.roastArchiveCanvas.last!
        cupKeeperSection(cupKeeperRoute, cupKeeperPreview: cupKeeperLabel)
        cupKeeperTrigger(cupKeeperRoute, cupKeeperLayout: cupKeeperLabel)
        cupKeeperSource(cupKeeperLabel)
        cupKeeperMenu(cupKeeperLabel)
    }

    @objc private func cupKeeperRoute(_ cupKeeperSection: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { [weak self] in
            guard let self else { return }
            self.cupKeeperRender()
            cupKeeperSection.endRefreshing()
            UIAccessibility.post(notification: .announcement, argument: "Profile refreshed")
        }
    }

    private func cupKeeperStatus() {
        var cupKeeperRoute: [String: ChovviCaramelBrew] = [:]
        (ChovviCitrusBrew.roastArchivePreview + ChovviCitrusBrew.roastArchiveHeader).forEach { cupKeeperSection in
            cupKeeperRoute[cupKeeperSection.chovviCaramelAcidity] = cupKeeperSection
        }
        cupKeeperArtwork = Array(cupKeeperRoute.values)
            .filter { $0.chovviCaramelAeropress == "chovvi-user-20" }
            .sorted { $0.chovviCaramelBody > $1.chovviCaramelBody }

        var cupKeeperPreview: [String: ChovviSilkyBrew] = [:]
        (ChovviCitrusBrew.roastArchiveSection + ChovviCitrusBrew.roastArchiveStatus).forEach { cupKeeperTrigger in
            cupKeeperPreview[cupKeeperTrigger.chovviSilkyAcidity] = cupKeeperTrigger
        }
        cupKeeperCollection = Array(cupKeeperPreview.values)
            .filter { $0.chovviSilkyAeropress == "chovvi-user-20" }
            .sorted { $0.chovviSilkyBrewer > $1.chovviSilkyBrewer }
    }

    private func cupKeeperSection(_ cupKeeperPreview: ChovviBotanicalBrew, cupKeeperPreview cupKeeperTrigger: Bool) {
        cupKeeperSectionTrigger(cupKeeperPreview, cupKeeperTrigger)
    }

    private lazy var cupKeeperSectionTrigger: (ChovviBotanicalBrew, Bool) -> Void = { [unowned self] cupKeeperPreview, cupKeeperTrigger in
        let cupKeeperLayout = UIView()
        cupKeeperLayout.clipsToBounds = false
        cupKeeperScroll.addArrangedSubview(cupKeeperLayout)

        let cupKeeperSource = cupKeeperArtwork.first?.chovviCaramelAftertaste.last
        let cupKeeperMenu = cupKeeperTrigger
            ? (cupKeeperSource
                ?? UserDefaults.standard.string(forKey: "chovviCuppingRoast")
                ?? cupKeeperPreview.chovviBotanicalAroma)
            : "chovviCuppingBloom"
        let cupKeeperUpdate = UIImageView(image: cupKeeperDestination(cupKeeperMenu))
        cupKeeperUpdate.contentMode = .scaleAspectFill
        cupKeeperUpdate.clipsToBounds = true
        cupKeeperUpdate.translatesAutoresizingMaskIntoConstraints = false
        cupKeeperLayout.addSubview(cupKeeperUpdate)

        let cupKeeperCard = UIButton(type: .system)
        cupKeeperCard.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        cupKeeperCard.tintColor = UIColor(red: 0.16, green: 0.17, blue: 0.22, alpha: 1)
        cupKeeperCard.backgroundColor = .white
        cupKeeperCard.layer.cornerRadius = 25
        cupKeeperCard.addTarget(self, action: #selector(cupKeeperRecord), for: .touchUpInside)
        cupKeeperCard.translatesAutoresizingMaskIntoConstraints = false
        cupKeeperLayout.addSubview(cupKeeperCard)

        let cupKeeperItem = UIView()
        cupKeeperItem.translatesAutoresizingMaskIntoConstraints = false
        cupKeeperLayout.addSubview(cupKeeperItem)

        let cupKeeperSelection = UIImageView(image: cupKeeperDestination(cupKeeperTrigger ? (UserDefaults.standard.string(forKey: "chovviCuppingRoast") ?? cupKeeperPreview.chovviBotanicalAroma) : "chovviCuppingBody"))
        cupKeeperSelection.contentMode = .scaleAspectFill
        cupKeeperSelection.clipsToBounds = true
        cupKeeperSelection.layer.cornerRadius = 55
        cupKeeperSelection.layer.borderWidth = 4
        cupKeeperSelection.layer.borderColor = UIColor.white.cgColor
        cupKeeperSelection.translatesAutoresizingMaskIntoConstraints = false
        cupKeeperItem.addSubview(cupKeeperSelection)

        let cupKeeperImage = UIButton(type: .system)
        cupKeeperImage.setImage(UIImage(systemName: "pencil"), for: .normal)
        cupKeeperImage.tintColor = .white
        cupKeeperImage.backgroundColor = Self.cupKeeperStack
        cupKeeperImage.layer.cornerRadius = 18
        cupKeeperImage.addTarget(self, action: #selector(cupKeeperChoice), for: .touchUpInside)
        cupKeeperImage.translatesAutoresizingMaskIntoConstraints = false
        cupKeeperItem.addSubview(cupKeeperImage)

        let cupKeeperAction = UIButton(type: .system)
        cupKeeperAction.setTitle(cupKeeperTrigger ? "Edit Profile" : "Sign In", for: .normal)
        cupKeeperAction.setTitleColor(Self.cupKeeperStack, for: .normal)
        cupKeeperAction.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        cupKeeperAction.layer.cornerRadius = 25
        cupKeeperAction.layer.borderWidth = 2
        cupKeeperAction.layer.borderColor = Self.cupKeeperStack.cgColor
        cupKeeperAction.addTarget(self, action: #selector(cupKeeperChoice), for: .touchUpInside)
        cupKeeperAction.translatesAutoresizingMaskIntoConstraints = false
        cupKeeperLayout.addSubview(cupKeeperAction)

        let cupKeeperLabel = UILabel()
        cupKeeperLabel.text = cupKeeperTrigger
            ? (UserDefaults.standard.string(forKey: "chovviCuppingTexture") ?? cupKeeperPreview.chovviBotanicalAeropress)
            : "Not signed in"
        cupKeeperLabel.font = .systemFont(ofSize: 27, weight: .black)
        cupKeeperLabel.textColor = UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1)
        cupKeeperLabel.translatesAutoresizingMaskIntoConstraints = false
        cupKeeperLayout.addSubview(cupKeeperLabel)

        let cupKeeperStatus = UILabel()
        cupKeeperStatus.text = cupKeeperTrigger
            ? (UserDefaults.standard.string(forKey: "chovviCuppingVarietal") ?? cupKeeperPreview.chovviBotanicalBatch)
            : "Sign in to view and manage your Choovi profile."
        cupKeeperStatus.font = .systemFont(ofSize: 16, weight: .medium)
        cupKeeperStatus.textColor = UIColor(red: 0.27, green: 0.28, blue: 0.35, alpha: 1)
        cupKeeperStatus.numberOfLines = 0
        cupKeeperStatus.translatesAutoresizingMaskIntoConstraints = false
        cupKeeperLayout.addSubview(cupKeeperStatus)

        NSLayoutConstraint.activate([
            cupKeeperLayout.heightAnchor.constraint(equalToConstant: 338), cupKeeperUpdate.topAnchor.constraint(equalTo: cupKeeperLayout.topAnchor), cupKeeperUpdate.leadingAnchor.constraint(equalTo: cupKeeperLayout.leadingAnchor),
            cupKeeperUpdate.trailingAnchor.constraint(equalTo: cupKeeperLayout.trailingAnchor), cupKeeperUpdate.heightAnchor.constraint(equalTo: cupKeeperLayout.widthAnchor, multiplier: 0.42), cupKeeperCard.topAnchor.constraint(equalTo: cupKeeperLayout.topAnchor, constant: 18),
            cupKeeperCard.trailingAnchor.constraint(equalTo: cupKeeperLayout.trailingAnchor, constant: -16), cupKeeperCard.widthAnchor.constraint(equalToConstant: 50), cupKeeperCard.heightAnchor.constraint(equalTo: cupKeeperCard.widthAnchor),
            cupKeeperItem.leadingAnchor.constraint(equalTo: cupKeeperLayout.leadingAnchor, constant: 24), cupKeeperItem.topAnchor.constraint(equalTo: cupKeeperUpdate.bottomAnchor, constant: -55), cupKeeperItem.widthAnchor.constraint(equalToConstant: 124),
            cupKeeperItem.heightAnchor.constraint(equalToConstant: 124), cupKeeperSelection.topAnchor.constraint(equalTo: cupKeeperItem.topAnchor), cupKeeperSelection.leadingAnchor.constraint(equalTo: cupKeeperItem.leadingAnchor),
            cupKeeperSelection.widthAnchor.constraint(equalToConstant: 110), cupKeeperSelection.heightAnchor.constraint(equalTo: cupKeeperSelection.widthAnchor), cupKeeperImage.trailingAnchor.constraint(equalTo: cupKeeperItem.trailingAnchor),
            cupKeeperImage.bottomAnchor.constraint(equalTo: cupKeeperItem.bottomAnchor, constant: -5), cupKeeperImage.widthAnchor.constraint(equalToConstant: 36), cupKeeperImage.heightAnchor.constraint(equalTo: cupKeeperImage.widthAnchor),
            cupKeeperAction.trailingAnchor.constraint(equalTo: cupKeeperLayout.trailingAnchor, constant: -18), cupKeeperAction.topAnchor.constraint(equalTo: cupKeeperUpdate.bottomAnchor, constant: 38), cupKeeperAction.widthAnchor.constraint(equalToConstant: 142),
            cupKeeperAction.heightAnchor.constraint(equalToConstant: 50), cupKeeperLabel.leadingAnchor.constraint(equalTo: cupKeeperLayout.leadingAnchor, constant: 18), cupKeeperLabel.topAnchor.constraint(equalTo: cupKeeperItem.bottomAnchor, constant: 12),
            cupKeeperLabel.trailingAnchor.constraint(equalTo: cupKeeperLayout.trailingAnchor, constant: -18), cupKeeperStatus.leadingAnchor.constraint(equalTo: cupKeeperLabel.leadingAnchor), cupKeeperStatus.trailingAnchor.constraint(equalTo: cupKeeperLabel.trailingAnchor),
            cupKeeperStatus.topAnchor.constraint(equalTo: cupKeeperLabel.bottomAnchor, constant: 8), cupKeeperStatus.bottomAnchor.constraint(lessThanOrEqualTo: cupKeeperLayout.bottomAnchor, constant: -12)
        ])
    }

    private func cupKeeperTrigger(_ cupKeeperLayout: ChovviBotanicalBrew, cupKeeperLayout cupKeeperSource: Bool) {
        cupKeeperTriggerArtwork(cupKeeperLayout, cupKeeperSource)
    }

    private lazy var cupKeeperTriggerArtwork: (ChovviBotanicalBrew, Bool) -> Void = { [unowned self] cupKeeperLayout, cupKeeperSource in
        let cupKeeperMenu = UIStackView()
        cupKeeperMenu.axis = .horizontal
        cupKeeperMenu.distribution = .fillEqually
        cupKeeperMenu.heightAnchor.constraint(equalToConstant: 74).isActive = true
        let cupKeeperUpdate = ChovviCitrusBrew.roastArchiveCanvas.filter { $0.chovviBotanicalBurr.contains("chovvi-user-20") }.count
        let cupKeeperDestination = Set(UserDefaults.standard.stringArray(forKey: "chovviCremaRoast") ?? []).count
        let cupKeeperCard = [
            (cupKeeperSource ? "\(cupKeeperArtwork.count)" : "--", "Posts"),
            (cupKeeperSource ? "\(cupKeeperUpdate)" : "--", "Followers"),
            (cupKeeperSource ? "\(cupKeeperDestination)" : "--", "Following")
        ]
        cupKeeperCard.forEach { cupKeeperChoice in
            let cupKeeperItem = UIButton(type: .system)
            cupKeeperItem.setTitle("\(cupKeeperChoice.0)  \(cupKeeperChoice.1)", for: .normal)
            cupKeeperItem.setTitleColor(UIColor(red: 0.18, green: 0.18, blue: 0.24, alpha: 1), for: .normal)
            cupKeeperItem.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            if !cupKeeperSource {
                cupKeeperItem.addTarget(self, action: #selector(cupKeeperRecord), for: .touchUpInside)
            }
            cupKeeperMenu.addArrangedSubview(cupKeeperItem)
        }
        cupKeeperScroll.addArrangedSubview(cupKeeperMenu)
        if cupKeeperSource {
            let cupKeeperRecord = UIButton(type: .custom)
            cupKeeperRecord.backgroundColor = UIColor(red: 1, green: 0.94, blue: 0.84, alpha: 1)
            cupKeeperRecord.layer.cornerRadius = 18
            cupKeeperRecord.layer.borderWidth = 1
            cupKeeperRecord.layer.borderColor = Self.cupKeeperStack.cgColor
            cupKeeperRecord.heightAnchor.constraint(equalToConstant: 108).isActive = true
            cupKeeperRecord.addAction(UIAction { [weak self] cupKeeperLabel in
                _ = cupKeeperLabel
                guard UserDefaults.standard.bool(forKey: "choovilogin") else {
                    self?.cupKeeperRecord()
                    return
                }
                let cupKeeperStatus = UINavigationController(rootViewController: ChovviThermalTasting())
                cupKeeperStatus.setNavigationBarHidden(true, animated: false)
                cupKeeperStatus.modalPresentationStyle = .fullScreen
                self?.present(cupKeeperStatus, animated: true)
            }, for: .touchUpInside)
            let cupKeeperRoute = UIImageView(image: UIImage(named: "Rbeijigsmall"))
            cupKeeperRoute.tintColor = Self.cupKeeperStack
            cupKeeperRoute.contentMode = .scaleAspectFit
            cupKeeperRoute.translatesAutoresizingMaskIntoConstraints = false
            cupKeeperRecord.addSubview(cupKeeperRoute)
            let cupKeeperSection = UILabel()
            let cupKeeperPreview = UserDefaults.standard.string(forKey: "hooviEmail")?.lowercased() ?? ""
            cupKeeperSection.text = ChovviThermalRoast.amberRitualCard(cupKeeperPreview).formatted()
            cupKeeperSection.font = .systemFont(ofSize: 22, weight: .black)
            cupKeeperSection.textColor = Self.cupKeeperStack
            cupKeeperSection.translatesAutoresizingMaskIntoConstraints = false
            cupKeeperRecord.addSubview(cupKeeperSection)
            let cupKeeperTrigger = UILabel()
            cupKeeperTrigger.text = "Available Coins"
            cupKeeperTrigger.font = .systemFont(ofSize: 13, weight: .bold)
            cupKeeperTrigger.textColor = Self.cupKeeperStack
            cupKeeperTrigger.translatesAutoresizingMaskIntoConstraints = false
            cupKeeperRecord.addSubview(cupKeeperTrigger)
            let cupKeeperLayout = UILabel()
            cupKeeperLayout.text = "Recharge"
            cupKeeperLayout.font = .systemFont(ofSize: 16, weight: .bold)
            cupKeeperLayout.textAlignment = .center
            cupKeeperLayout.textColor = UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1)
            cupKeeperLayout.backgroundColor = Self.cupKeeperStack
            cupKeeperLayout.layer.cornerRadius = 12
            cupKeeperLayout.clipsToBounds = true
            cupKeeperLayout.translatesAutoresizingMaskIntoConstraints = false
            cupKeeperRecord.addSubview(cupKeeperLayout)
            NSLayoutConstraint.activate([
                cupKeeperRoute.leadingAnchor.constraint(equalTo: cupKeeperRecord.leadingAnchor, constant: 18), cupKeeperRoute.centerYAnchor.constraint(equalTo: cupKeeperRecord.centerYAnchor), cupKeeperRoute.widthAnchor.constraint(equalToConstant: 52),
                cupKeeperRoute.heightAnchor.constraint(equalTo: cupKeeperRoute.widthAnchor), cupKeeperSection.leadingAnchor.constraint(equalTo: cupKeeperRoute.trailingAnchor, constant: 14), cupKeeperSection.topAnchor.constraint(equalTo: cupKeeperRecord.topAnchor, constant: 25),
                cupKeeperTrigger.leadingAnchor.constraint(equalTo: cupKeeperSection.leadingAnchor), cupKeeperTrigger.topAnchor.constraint(equalTo: cupKeeperSection.bottomAnchor, constant: 3), cupKeeperLayout.trailingAnchor.constraint(equalTo: cupKeeperRecord.trailingAnchor, constant: -16),
                cupKeeperLayout.centerYAnchor.constraint(equalTo: cupKeeperRecord.centerYAnchor), cupKeeperLayout.widthAnchor.constraint(equalToConstant: 104), cupKeeperLayout.heightAnchor.constraint(equalToConstant: 48)
            ])
            cupKeeperScroll.addArrangedSubview(cupKeeperRecord)
            cupKeeperScroll.setCustomSpacing(10, after: cupKeeperRecord)
        }
        _ = cupKeeperLayout
    }

    private func cupKeeperSource(_ cupKeeperMenu: Bool) {
        let cupKeeperUpdate = UIStackView()
        cupKeeperUpdate.axis = .horizontal
        cupKeeperUpdate.distribution = .fillEqually
        cupKeeperUpdate.heightAnchor.constraint(equalToConstant: 54).isActive = true
        ["Posts", "Diary"].enumerated().forEach { cupKeeperDestination, cupKeeperCard in
            let cupKeeperRecord = UIButton(type: .system)
            cupKeeperRecord.tag = cupKeeperDestination
            cupKeeperRecord.setTitle(cupKeeperCard, for: .normal)
            cupKeeperRecord.setTitleColor(cupKeeperHeader == cupKeeperDestination ? Self.cupKeeperStack : .secondaryLabel, for: .normal)
            cupKeeperRecord.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
            cupKeeperRecord.addTarget(self, action: #selector(cupKeeperItem(_:)), for: .touchUpInside)
            cupKeeperUpdate.addArrangedSubview(cupKeeperRecord)
        }
        cupKeeperScroll.addArrangedSubview(cupKeeperUpdate)
        let cupKeeperDestination = UIView()
        cupKeeperDestination.backgroundColor = Self.cupKeeperStack
        cupKeeperDestination.translatesAutoresizingMaskIntoConstraints = false
        cupKeeperUpdate.addSubview(cupKeeperDestination)
        NSLayoutConstraint.activate([
            cupKeeperDestination.bottomAnchor.constraint(equalTo: cupKeeperUpdate.bottomAnchor), cupKeeperDestination.heightAnchor.constraint(equalToConstant: 3), cupKeeperDestination.widthAnchor.constraint(equalTo: cupKeeperUpdate.widthAnchor, multiplier: 0.5),
            cupKeeperDestination.leadingAnchor.constraint(equalTo: cupKeeperUpdate.leadingAnchor, constant: cupKeeperHeader == 0 ? 0 : view.bounds.width / 2)
        ])
        _ = cupKeeperMenu
    }

    private func cupKeeperMenu(_ cupKeeperUpdate: Bool) {
        if !cupKeeperUpdate {
            let cupKeeperDestination = UIButton(type: .system)
            cupKeeperDestination.setTitle(cupKeeperHeader == 0 ? "Sign in to view your posts" : "Sign in to view your diary", for: .normal)
            cupKeeperDestination.setTitleColor(Self.cupKeeperStack, for: .normal)
            cupKeeperDestination.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            cupKeeperDestination.backgroundColor = .white
            cupKeeperDestination.layer.cornerRadius = 16
            cupKeeperDestination.layer.borderWidth = 1
            cupKeeperDestination.layer.borderColor = UIColor.systemGray5.cgColor
            cupKeeperDestination.addTarget(self, action: #selector(cupKeeperRecord), for: .touchUpInside)
            cupKeeperDestination.heightAnchor.constraint(equalToConstant: 112).isActive = true
            cupKeeperScroll.addArrangedSubview(cupKeeperDestination)
            cupKeeperScroll.setCustomSpacing(16, after: cupKeeperDestination)
            return
        }

        if cupKeeperHeader == 0 {
            cupKeeperScroll.addArrangedSubview(cupKeeperDestination(cupKeeperArtwork))
        } else {
            cupKeeperScroll.addArrangedSubview(cupKeeperCard(cupKeeperCollection))
        }
    }

    private func cupKeeperDestination(_ cupKeeperCard: [ChovviCaramelBrew]) -> UIView {
        guard !cupKeeperCard.isEmpty else { return cupKeeperImage("No posts yet. Share your first coffee moment when you’re ready.") }
        let cupKeeperRecord = UIStackView()
        cupKeeperRecord.axis = .vertical
        cupKeeperRecord.spacing = 8
        cupKeeperRecord.isLayoutMarginsRelativeArrangement = true
        cupKeeperRecord.layoutMargins = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        var cupKeeperItem = 0
        while cupKeeperItem < cupKeeperCard.count {
            let cupKeeperSelection = UIStackView()
            cupKeeperSelection.axis = .horizontal
            cupKeeperSelection.distribution = .fillEqually
            cupKeeperSelection.spacing = 8
            for cupKeeperImage in 0..<3 {
                let cupKeeperChoice = cupKeeperItem + cupKeeperImage
                if cupKeeperCard.indices.contains(cupKeeperChoice) {
                    let cupKeeperLabel = cupKeeperCard[cupKeeperChoice]
                    let cupKeeperStatus = UIButton(type: .custom)
                    cupKeeperStatus.tag = cupKeeperChoice
                    cupKeeperStatus.setImage(cupKeeperDestination(cupKeeperLabel.chovviCaramelAftertaste.first ?? ""), for: .normal)
                    cupKeeperStatus.imageView?.contentMode = .scaleAspectFill
                    cupKeeperStatus.contentHorizontalAlignment = .fill
                    cupKeeperStatus.contentVerticalAlignment = .fill
                    cupKeeperStatus.clipsToBounds = true
                    cupKeeperStatus.layer.cornerRadius = 12
                    cupKeeperStatus.addTarget(self, action: #selector(cupKeeperSelection(_:)), for: .touchUpInside)
                    cupKeeperSelection.addArrangedSubview(cupKeeperStatus)
                } else {
                    cupKeeperSelection.addArrangedSubview(UIView())
                }
            }
            cupKeeperSelection.heightAnchor.constraint(equalTo: cupKeeperSelection.widthAnchor, multiplier: 0.32).isActive = true
            cupKeeperRecord.addArrangedSubview(cupKeeperSelection)
            cupKeeperItem += 3
        }
        return cupKeeperRecord
    }

    private func cupKeeperCard(_ cupKeeperRecord: [ChovviSilkyBrew]) -> UIView {
        cupKeeperCardTrigger(cupKeeperRecord)
    }

    private lazy var cupKeeperCardTrigger: ([ChovviSilkyBrew]) -> UIView = { [unowned self] cupKeeperRecord in
        guard !cupKeeperRecord.isEmpty else { return cupKeeperImage("No diary entries yet. Your published coffee clips will appear here.") }
        let cupKeeperItem = UIStackView()
        cupKeeperItem.axis = .vertical
        cupKeeperItem.spacing = 10
        cupKeeperItem.isLayoutMarginsRelativeArrangement = true
        cupKeeperItem.layoutMargins = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        cupKeeperRecord.enumerated().forEach { cupKeeperSelection, cupKeeperImage in
            let cupKeeperChoice = UIButton(type: .custom)
            cupKeeperChoice.tag = cupKeeperSelection
            cupKeeperChoice.backgroundColor = .white
            cupKeeperChoice.layer.cornerRadius = 15
            cupKeeperChoice.layer.borderWidth = 1
            cupKeeperChoice.layer.borderColor = UIColor.systemGray5.cgColor
            cupKeeperChoice.addAction(UIAction { [weak self, weak cupKeeperChoice] cupKeeperLabel in
                _ = cupKeeperLabel
                guard let cupKeeperStatus = cupKeeperChoice else { return }
                self?.cupKeeperImage(cupKeeperStatus)
            }, for: .touchUpInside)
            cupKeeperChoice.heightAnchor.constraint(equalToConstant: 92).isActive = true
            let cupKeeperLabel = UIImageView(image: cupKeeperDestination(cupKeeperImage.chovviSilkyAftertaste))
            cupKeeperLabel.contentMode = .scaleAspectFill
            cupKeeperLabel.clipsToBounds = true
            cupKeeperLabel.layer.cornerRadius = 12
            cupKeeperLabel.translatesAutoresizingMaskIntoConstraints = false
            cupKeeperChoice.addSubview(cupKeeperLabel)
            let cupKeeperStatus = UILabel()
            cupKeeperStatus.text = cupKeeperImage.chovviSilkyAroma
            cupKeeperStatus.textColor = UIColor(red: 0.17, green: 0.18, blue: 0.23, alpha: 1)
            cupKeeperStatus.font = .systemFont(ofSize: 14, weight: .bold)
            cupKeeperStatus.numberOfLines = 2
            cupKeeperStatus.translatesAutoresizingMaskIntoConstraints = false
            cupKeeperChoice.addSubview(cupKeeperStatus)
            NSLayoutConstraint.activate([
                cupKeeperLabel.leadingAnchor.constraint(equalTo: cupKeeperChoice.leadingAnchor, constant: 8), cupKeeperLabel.topAnchor.constraint(equalTo: cupKeeperChoice.topAnchor, constant: 8), cupKeeperLabel.bottomAnchor.constraint(equalTo: cupKeeperChoice.bottomAnchor, constant: -8),
                cupKeeperLabel.widthAnchor.constraint(equalTo: cupKeeperLabel.heightAnchor), cupKeeperStatus.leadingAnchor.constraint(equalTo: cupKeeperLabel.trailingAnchor, constant: 12), cupKeeperStatus.trailingAnchor.constraint(equalTo: cupKeeperChoice.trailingAnchor, constant: -12),
                cupKeeperStatus.centerYAnchor.constraint(equalTo: cupKeeperChoice.centerYAnchor)
            ])
            cupKeeperItem.addArrangedSubview(cupKeeperChoice)
        }
        return cupKeeperItem
    }

    private func cupKeeperImage(_ cupKeeperChoice: String) -> UIView {
        let cupKeeperLabel = UILabel()
        cupKeeperLabel.text = cupKeeperChoice
        cupKeeperLabel.textColor = .secondaryLabel
        cupKeeperLabel.textAlignment = .center
        cupKeeperLabel.numberOfLines = 0
        cupKeeperLabel.font = .systemFont(ofSize: 15, weight: .medium)
        cupKeeperLabel.heightAnchor.constraint(equalToConstant: 118).isActive = true
        return cupKeeperLabel
    }

    private func cupKeeperDestination(_ cupKeeperCard: String) -> UIImage? {
        cupKeeperCard.hasPrefix("/") ? UIImage(contentsOfFile: cupKeeperCard) : UIImage(named: cupKeeperCard)
    }

    @objc private func cupKeeperItem(_ cupKeeperSelection: UIButton) {
        guard UserDefaults.standard.bool(forKey: "choovilogin") else {
            cupKeeperRecord()
            return
        }
        cupKeeperHeader = cupKeeperSelection.tag
        cupKeeperRender()
    }

    @objc private func cupKeeperSelection(_ cupKeeperImage: UIButton) {
        guard cupKeeperArtwork.indices.contains(cupKeeperImage.tag) else { return }
        let cupKeeperChoice = UINavigationController(rootViewController: ChovviArtisanBrew(cremaStoryCanvas: cupKeeperArtwork[cupKeeperImage.tag]))
        cupKeeperChoice.modalPresentationStyle = .fullScreen
        present(cupKeeperChoice, animated: true)
    }

    @objc private func cupKeeperImage(_ cupKeeperChoice: UIButton) {
        guard cupKeeperCollection.indices.contains(cupKeeperChoice.tag) else { return }
        let cupKeeperLabel = UINavigationController(rootViewController: ChovviOriginBrew(cupChronicleCanvas: cupKeeperCollection[cupKeeperChoice.tag]))
        cupKeeperLabel.modalPresentationStyle = .fullScreen
        present(cupKeeperLabel, animated: true)
    }

    @objc private func cupKeeperChoice() {
        guard UserDefaults.standard.bool(forKey: "choovilogin") else {
            cupKeeperRecord()
            return
        }
        let cupKeeperLabel = UINavigationController(rootViewController: ChovviBaristaTasting())
        cupKeeperLabel.setNavigationBarHidden(true, animated: false)
        cupKeeperLabel.modalPresentationStyle = .fullScreen
        present(cupKeeperLabel, animated: true)
    }

    @objc private func cupKeeperRecord() {
        if UserDefaults.standard.bool(forKey: "choovilogin") {
            let cupKeeperLabel = UINavigationController(rootViewController: ChovviSensoryTasting())
            cupKeeperLabel.setNavigationBarHidden(true, animated: false)
            cupKeeperLabel.modalPresentationStyle = .fullScreen
            present(cupKeeperLabel, animated: true)
        } else {
            let cupKeeperLabel = UINavigationController(rootViewController: ChovviFragrantBrew())
            cupKeeperLabel.modalPresentationStyle = .pageSheet
            present(cupKeeperLabel, animated: true)
        }
    }
}

final class ChovviFragrantTasting: UIViewController, UITextFieldDelegate {
    private let firstSipCanvas = UIScrollView()
    private let firstSipScroll = UIStackView()
    private let firstSipHeader = UITextField()
    private let firstSipArtwork = UITextField()
    private let firstSipStack = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        firstSipState()
        firstSipRender()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func firstSipState() { firstSipStateTrigger() }

    private lazy var firstSipStateTrigger: () -> Void = { [unowned self] in
        title = nil
        view.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.99, alpha: 1)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()

        firstSipCanvas.alwaysBounceVertical = true
        firstSipCanvas.keyboardDismissMode = .interactive
        firstSipCanvas.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstSipCanvas)
        firstSipScroll.axis = .vertical
        firstSipScroll.spacing = 14
        firstSipScroll.translatesAutoresizingMaskIntoConstraints = false
        firstSipCanvas.addSubview(firstSipScroll)

        let firstSipRender = UILabel()
        firstSipRender.text = "Coffee Day"
        firstSipRender.font = .systemFont(ofSize: 29, weight: .black)
        firstSipRender.textColor = UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1)
        firstSipScroll.addArrangedSubview(firstSipRender)

        let firstSipLabel = UIView()
        firstSipLabel.heightAnchor.constraint(equalToConstant: 132).isActive = true
        let firstSipCollection = UIImageView(image: UIImage(named: "chovviGentleVarietal"))
        firstSipCollection.contentMode = .scaleAspectFit
        firstSipCollection.translatesAutoresizingMaskIntoConstraints = false
        firstSipLabel.addSubview(firstSipCollection)
        NSLayoutConstraint.activate([
            firstSipCollection.trailingAnchor.constraint(equalTo: firstSipLabel.trailingAnchor), firstSipCollection.topAnchor.constraint(equalTo: firstSipLabel.topAnchor), firstSipCollection.widthAnchor.constraint(equalToConstant: 132),
            firstSipCollection.heightAnchor.constraint(equalToConstant: 132)
        ])
        firstSipScroll.addArrangedSubview(firstSipLabel)

        let firstSipSection = UILabel()
        firstSipSection.text = "Welcome Back"
        firstSipSection.font = .systemFont(ofSize: 30, weight: .black)
        firstSipSection.textColor = UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1)
        firstSipScroll.addArrangedSubview(firstSipSection)

        let firstSipPreview = UILabel()
        firstSipPreview.text = "Log in to continue your daily coffee ritual."
        firstSipPreview.font = .systemFont(ofSize: 15, weight: .medium)
        firstSipPreview.textColor = .secondaryLabel
        firstSipPreview.numberOfLines = 0
        firstSipScroll.addArrangedSubview(firstSipPreview)
        firstSipScroll.setCustomSpacing(30, after: firstSipPreview)

        let firstSipTrigger = UILabel()
        firstSipTrigger.text = "EMAIL"
        firstSipTrigger.font = .systemFont(ofSize: 13, weight: .bold)
        firstSipTrigger.textColor = UIColor(red: 0.18, green: 0.18, blue: 0.23, alpha: 1)
        firstSipScroll.addArrangedSubview(firstSipTrigger)

        firstSipHeader.placeholder = "Please enter"
        firstSipHeader.keyboardType = .emailAddress
        firstSipHeader.textContentType = .username
        firstSipHeader.autocapitalizationType = .none
        firstSipHeader.returnKeyType = .next
        firstSipHeader.delegate = self
        firstSipStatus(firstSipHeader)
        firstSipScroll.addArrangedSubview(firstSipHeader)

        firstSipScroll.setCustomSpacing(22, after: firstSipHeader)
        let firstSipLayout = UILabel()
        firstSipLayout.text = "PASSWORD"
        firstSipLayout.font = .systemFont(ofSize: 13, weight: .bold)
        firstSipLayout.textColor = UIColor(red: 0.18, green: 0.18, blue: 0.23, alpha: 1)
        firstSipScroll.addArrangedSubview(firstSipLayout)

        firstSipArtwork.placeholder = "Please enter"
        firstSipArtwork.isSecureTextEntry = true
        firstSipArtwork.textContentType = .password
        firstSipArtwork.returnKeyType = .done
        firstSipArtwork.delegate = self
        firstSipStatus(firstSipArtwork)
        firstSipScroll.addArrangedSubview(firstSipArtwork)
        firstSipScroll.setCustomSpacing(38, after: firstSipArtwork)

        firstSipStack.setTitle("Sign In", for: .normal)
        firstSipStack.setTitleColor(.white, for: .normal)
        firstSipStack.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        firstSipStack.backgroundColor = ChovviCuppingBrew.cupKeeperStack
        firstSipStack.layer.cornerRadius = 27
        firstSipStack.addTarget(self, action: #selector(firstSipRoute), for: .touchUpInside)
        firstSipStack.heightAnchor.constraint(equalToConstant: 56).isActive = true
        firstSipScroll.addArrangedSubview(firstSipStack)
        firstSipScroll.setCustomSpacing(28, after: firstSipStack)

        let firstSipSource = UIButton(type: .system)
        let firstSipMenu = NSMutableAttributedString(string: "Don't have an account? ", attributes: [.foregroundColor: UIColor.secondaryLabel, .font: UIFont.systemFont(ofSize: 15, weight: .medium)])
        firstSipMenu.append(NSAttributedString(string: "Create Account", attributes: [.foregroundColor: ChovviCuppingBrew.cupKeeperStack, .font: UIFont.systemFont(ofSize: 15, weight: .bold)]))
        firstSipSource.setAttributedTitle(firstSipMenu, for: .normal)
        firstSipSource.addTarget(self, action: #selector(firstSipItem), for: .touchUpInside)
        firstSipSource.heightAnchor.constraint(equalToConstant: 44).isActive = true
        firstSipScroll.addArrangedSubview(firstSipSource)

        let firstSipUpdate = UILabel()
        firstSipUpdate.text = "Test account: choovi@gmail.com  •  Password: 23452345"
        firstSipUpdate.font = .systemFont(ofSize: 11, weight: .medium)
        firstSipUpdate.textColor = .tertiaryLabel
        firstSipUpdate.textAlignment = .center
        firstSipUpdate.numberOfLines = 0
        firstSipScroll.addArrangedSubview(firstSipUpdate)

        NSLayoutConstraint.activate([
            firstSipCanvas.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), firstSipCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor), firstSipCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstSipCanvas.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), firstSipScroll.topAnchor.constraint(equalTo: firstSipCanvas.contentLayoutGuide.topAnchor, constant: 10), firstSipScroll.leadingAnchor.constraint(equalTo: firstSipCanvas.contentLayoutGuide.leadingAnchor, constant: 24),
            firstSipScroll.trailingAnchor.constraint(equalTo: firstSipCanvas.contentLayoutGuide.trailingAnchor, constant: -24), firstSipScroll.bottomAnchor.constraint(equalTo: firstSipCanvas.contentLayoutGuide.bottomAnchor, constant: -30), firstSipScroll.widthAnchor.constraint(equalTo: firstSipCanvas.frameLayoutGuide.widthAnchor, constant: -48)
        ])
    }

    private func firstSipStatus(_ firstSipRoute: UITextField) {
        firstSipRoute.backgroundColor = .white
        firstSipRoute.layer.cornerRadius = 12
        firstSipRoute.layer.borderWidth = 1
        firstSipRoute.layer.borderColor = UIColor.systemGray5.cgColor
        firstSipRoute.firstSipRecord(14)
        firstSipRoute.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    private func firstSipRender() {
        NotificationCenter.default.addObserver(self, selector: #selector(firstSipMenu(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(firstSipUpdate(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        let firstSipDestination = UITapGestureRecognizer(target: self, action: #selector(firstSipCard))
        firstSipDestination.cancelsTouchesInView = false
        firstSipCanvas.addGestureRecognizer(firstSipDestination)
    }

    @objc private func firstSipItem() {
        guard UserDefaults.standard.bool(forKey: "chovviFragrantTexture") else {
            firstSipSource("Agreement required", firstSipMenu: "Return to the welcome page and accept the Privacy Policy and Terms of Service before creating an account.")
            return
        }
        navigationController?.pushViewController(ChovviGentleTasting(), animated: true)
    }

    @objc private func firstSipRoute() {
        view.endEditing(true)
        let firstSipSection = firstSipHeader.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let firstSipPreview = firstSipArtwork.text ?? ""
        guard !firstSipSection.isEmpty, !firstSipPreview.isEmpty else {
            firstSipSource("Complete both fields", firstSipMenu: "Enter your email and password.")
            return
        }
        guard UserDefaults.standard.bool(forKey: "chovviFragrantTexture") else {
            firstSipSource("Agreement required", firstSipMenu: "Review and accept the Privacy Policy and Terms of Service before signing in.")
            return
        }
        let firstSipLayout = firstSipSection.lowercased()
        firstSipStack.isEnabled = false
        ChovviThermalCalibrationView.amberRitualLayout(self, amberRitualMenu: "Signing in securely...") { [weak self] in
            guard let self else { return }
            self.firstSipStack.isEnabled = true
            let firstSipItem = (UserDefaults.standard.data(forKey: "chovviGentleTexture"))
                .flatMap { try? JSONDecoder().decode([ChovviGentleTexture].self, from: $0) } ?? []
            let firstSipMenu = firstSipItem.first { $0.beanPassportCanvas.lowercased() == firstSipLayout }
            if firstSipLayout == "choovi@gmail.com" {
                guard firstSipPreview == "23452345" else {
                    self.firstSipSource("Incorrect password", firstSipMenu: "Check your password and try again.")
                    return
                }
                guard let firstSipDestination = ChovviCitrusBrew.roastArchiveCanvas.first(where: { $0.chovviBotanicalAcidity == "chovvi-user-20" }) else {
                    self.firstSipSource("Unable to sign in", firstSipMenu: "Your profile is unavailable. Please retry.")
                    return
                }
                UserDefaults.standard.set(firstSipDestination.chovviBotanicalAeropress, forKey: "chovviCuppingTexture")
                UserDefaults.standard.set(firstSipDestination.chovviBotanicalBatch, forKey: "chovviCuppingVarietal")
                UserDefaults.standard.set(firstSipDestination.chovviBotanicalAroma, forKey: "chovviCuppingRoast")
            } else {
                guard let firstSipMenu else {
                    self.firstSipSource("Account does not exist", firstSipMenu: "No account was found for this email.")
                    return
                }
                guard firstSipMenu.beanPassportScroll == firstSipPreview else {
                    self.firstSipSource("Incorrect password", firstSipMenu: "Check your password and try again.")
                    return
                }
                UserDefaults.standard.set(firstSipMenu.beanPassportHeader, forKey: "chovviCuppingTexture")
                UserDefaults.standard.set(firstSipMenu.beanPassportArtwork, forKey: "chovviCuppingVarietal")
                UserDefaults.standard.set(firstSipMenu.beanPassportCollection, forKey: "chovviCuppingRoast")
            }
            UserDefaults.standard.set(true, forKey: "choovilogin")
            UserDefaults.standard.set(firstSipLayout, forKey: "hooviEmail")
            self.dismiss(animated: true) {
                NotificationCenter.default.post(name: .cupKeeperUpdate, object: nil)
            }
        }
    }

    private func firstSipSource(_ firstSipMenu: String, firstSipMenu firstSipUpdate: String) {
        ChovviThermalAlertView.amberRitualSelection(self, amberRitualChoice: firstSipMenu, amberRitualCanvas: firstSipUpdate, amberRitualArtwork: .caution)
    }

    func textFieldShouldReturn(_ firstSipMenu: UITextField) -> Bool {
        if firstSipMenu === firstSipHeader { firstSipArtwork.becomeFirstResponder() } else { firstSipRoute() }
        return true
    }

    @objc private func firstSipMenu(_ firstSipUpdate: Notification) {
        guard let firstSipDestination = firstSipUpdate.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let firstSipCard = max(0, view.bounds.maxY - view.convert(firstSipDestination, from: nil).minY)
        firstSipCanvas.contentInset.bottom = firstSipCard
        firstSipCanvas.verticalScrollIndicatorInsets.bottom = firstSipCard
    }

    @objc private func firstSipUpdate(_ firstSipDestination: Notification) {
        _ = firstSipDestination
        firstSipCanvas.contentInset.bottom = 0
        firstSipCanvas.verticalScrollIndicatorInsets.bottom = 0
    }

    @objc private func firstSipCard() {
        view.endEditing(true)
    }

}

private extension UITextField {
    func firstSipRecord(_ firstSipMenu: CGFloat) {
        let firstSipUpdate = UIView(frame: CGRect(x: 0, y: 0, width: firstSipMenu, height: 1))
        leftView = firstSipUpdate
        leftViewMode = .always
        let firstSipDestination = UIView(frame: CGRect(x: 0, y: 0, width: firstSipMenu, height: 1))
        rightView = firstSipDestination
        rightViewMode = .always
    }
}
