import UIKit

final class ChovviSensoryTasting: UIViewController {
    private let roastPreferencesCanvas = UIScrollView()
    private let roastPreferencesScroll = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        roastPreferencesHeader()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    private func roastPreferencesHeader() { roastPreferencesHeaderTrigger() }

    private lazy var roastPreferencesHeaderTrigger: () -> Void = { [unowned self] in
        view.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.99, alpha: 1)
        roastPreferencesCanvas.alwaysBounceVertical = true
        roastPreferencesCanvas.showsVerticalScrollIndicator = false
        roastPreferencesCanvas.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(roastPreferencesCanvas)
        roastPreferencesScroll.axis = .vertical
        roastPreferencesScroll.spacing = 22
        roastPreferencesScroll.translatesAutoresizingMaskIntoConstraints = false
        roastPreferencesCanvas.addSubview(roastPreferencesScroll)

        let roastPreferencesArtwork = UIView()
        roastPreferencesArtwork.heightAnchor.constraint(equalToConstant: 64).isActive = true
        let roastPreferencesCollection = UIButton(type: .system)
        roastPreferencesCollection.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        roastPreferencesCollection.tintColor = .black
        roastPreferencesCollection.addTarget(self, action: #selector(roastPreferencesStack), for: .touchUpInside)
        roastPreferencesCollection.translatesAutoresizingMaskIntoConstraints = false
        roastPreferencesArtwork.addSubview(roastPreferencesCollection)
        let roastPreferencesState = UILabel()
        roastPreferencesState.text = "Settings"
        roastPreferencesState.font = .systemFont(ofSize: 28, weight: .black)
        roastPreferencesState.textColor = UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1)
        roastPreferencesState.translatesAutoresizingMaskIntoConstraints = false
        roastPreferencesArtwork.addSubview(roastPreferencesState)
        NSLayoutConstraint.activate([
            roastPreferencesCollection.leadingAnchor.constraint(equalTo: roastPreferencesArtwork.leadingAnchor), roastPreferencesCollection.centerYAnchor.constraint(equalTo: roastPreferencesArtwork.centerYAnchor), roastPreferencesCollection.widthAnchor.constraint(equalToConstant: 48),
            roastPreferencesCollection.heightAnchor.constraint(equalToConstant: 48), roastPreferencesState.leadingAnchor.constraint(equalTo: roastPreferencesCollection.trailingAnchor, constant: 12), roastPreferencesState.centerYAnchor.constraint(equalTo: roastPreferencesCollection.centerYAnchor)
        ])
        roastPreferencesScroll.addArrangedSubview(roastPreferencesArtwork)

        let roastPreferencesRender = UIView()
        roastPreferencesRender.backgroundColor = .white
        roastPreferencesRender.layer.cornerRadius = 18
        roastPreferencesRender.layer.borderWidth = 1
        roastPreferencesRender.layer.borderColor = UIColor.systemGray5.cgColor
        roastPreferencesRender.heightAnchor.constraint(equalToConstant: 112).isActive = true
        let roastPreferencesAction = UIImageView(image: roastPreferencesLabel(UserDefaults.standard.string(forKey: "chovviCuppingRoast") ?? "chovviAromaticKettle"))
        roastPreferencesAction.contentMode = .scaleAspectFill
        roastPreferencesAction.clipsToBounds = true
        roastPreferencesAction.layer.cornerRadius = 32
        roastPreferencesAction.translatesAutoresizingMaskIntoConstraints = false
        roastPreferencesRender.addSubview(roastPreferencesAction)
        let roastPreferencesStatus = UILabel()
        roastPreferencesStatus.text = UserDefaults.standard.string(forKey: "chovviCuppingTexture") ?? "Choovi User"
        roastPreferencesStatus.font = .systemFont(ofSize: 22, weight: .black)
        roastPreferencesStatus.translatesAutoresizingMaskIntoConstraints = false
        roastPreferencesRender.addSubview(roastPreferencesStatus)
        NSLayoutConstraint.activate([
            roastPreferencesAction.leadingAnchor.constraint(equalTo: roastPreferencesRender.leadingAnchor, constant: 22), roastPreferencesAction.centerYAnchor.constraint(equalTo: roastPreferencesRender.centerYAnchor), roastPreferencesAction.widthAnchor.constraint(equalToConstant: 64),
            roastPreferencesAction.heightAnchor.constraint(equalTo: roastPreferencesAction.widthAnchor), roastPreferencesStatus.leadingAnchor.constraint(equalTo: roastPreferencesAction.trailingAnchor, constant: 20), roastPreferencesStatus.trailingAnchor.constraint(equalTo: roastPreferencesRender.trailingAnchor, constant: -18),
            roastPreferencesStatus.centerYAnchor.constraint(equalTo: roastPreferencesRender.centerYAnchor)
        ])
        roastPreferencesScroll.addArrangedSubview(roastPreferencesRender)

        let roastPreferencesRoute = UIStackView()
        roastPreferencesRoute.axis = .vertical
        roastPreferencesRoute.spacing = 0
        roastPreferencesRoute.backgroundColor = .white
        roastPreferencesRoute.layer.cornerRadius = 18
        roastPreferencesRoute.layer.borderWidth = 1
        roastPreferencesRoute.layer.borderColor = UIColor.systemGray5.cgColor
        roastPreferencesRoute.clipsToBounds = true
        let roastPreferencesSection = ["Blacklist", "Terms of Service", "Privacy Policy", "About Us"]
        roastPreferencesSection.enumerated().forEach { roastPreferencesPreview, roastPreferencesTrigger in
            let roastPreferencesLayout = UIButton(type: .system)
            roastPreferencesLayout.tag = roastPreferencesPreview
            var roastPreferencesCard = UIButton.Configuration.plain()
            roastPreferencesCard.title = roastPreferencesTrigger
            roastPreferencesCard.baseForegroundColor = UIColor(red: 0.16, green: 0.17, blue: 0.22, alpha: 1)
            roastPreferencesCard.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
            roastPreferencesCard.titleAlignment = .leading
            roastPreferencesLayout.configuration = roastPreferencesCard
            roastPreferencesLayout.contentHorizontalAlignment = .leading
            roastPreferencesLayout.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
            roastPreferencesLayout.heightAnchor.constraint(equalToConstant: 58).isActive = true
            roastPreferencesLayout.addTarget(self, action: #selector(roastPreferencesSource(_:)), for: .touchUpInside)
            roastPreferencesRoute.addArrangedSubview(roastPreferencesLayout)
            if roastPreferencesPreview < roastPreferencesSection.count - 1 {
                let roastPreferencesMenu = UIView()
                roastPreferencesMenu.backgroundColor = UIColor.systemGray5
                roastPreferencesMenu.heightAnchor.constraint(equalToConstant: 1).isActive = true
                roastPreferencesRoute.addArrangedSubview(roastPreferencesMenu)
            }
        }
        roastPreferencesScroll.addArrangedSubview(roastPreferencesRoute)
        roastPreferencesScroll.setCustomSpacing(44, after: roastPreferencesRoute)

        let roastPreferencesUpdate = UIButton(type: .system)
        roastPreferencesUpdate.setTitle("Log Out", for: .normal)
        roastPreferencesUpdate.setTitleColor(.systemRed, for: .normal)
        roastPreferencesUpdate.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        roastPreferencesUpdate.backgroundColor = .white
        roastPreferencesUpdate.layer.cornerRadius = 26
        roastPreferencesUpdate.layer.borderWidth = 1
        roastPreferencesUpdate.layer.borderColor = UIColor.systemRed.cgColor
        roastPreferencesUpdate.heightAnchor.constraint(equalToConstant: 54).isActive = true
        roastPreferencesUpdate.addTarget(self, action: #selector(roastPreferencesDestination), for: .touchUpInside)
        roastPreferencesScroll.addArrangedSubview(roastPreferencesUpdate)

        let roastPreferencesCard = UIButton(type: .system)
        roastPreferencesCard.setTitle("Delete Account", for: .normal)
        roastPreferencesCard.setTitleColor(.secondaryLabel, for: .normal)
        roastPreferencesCard.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        roastPreferencesCard.addTarget(self, action: #selector(roastPreferencesRecord), for: .touchUpInside)
        roastPreferencesCard.heightAnchor.constraint(equalToConstant: 44).isActive = true
        roastPreferencesScroll.addArrangedSubview(roastPreferencesCard)

        NSLayoutConstraint.activate([
            roastPreferencesCanvas.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), roastPreferencesCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor), roastPreferencesCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            roastPreferencesCanvas.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), roastPreferencesScroll.topAnchor.constraint(equalTo: roastPreferencesCanvas.contentLayoutGuide.topAnchor, constant: 18), roastPreferencesScroll.leadingAnchor.constraint(equalTo: roastPreferencesCanvas.contentLayoutGuide.leadingAnchor, constant: 16),
            roastPreferencesScroll.trailingAnchor.constraint(equalTo: roastPreferencesCanvas.contentLayoutGuide.trailingAnchor, constant: -16), roastPreferencesScroll.bottomAnchor.constraint(equalTo: roastPreferencesCanvas.contentLayoutGuide.bottomAnchor, constant: -30), roastPreferencesScroll.widthAnchor.constraint(equalTo: roastPreferencesCanvas.frameLayoutGuide.widthAnchor, constant: -32)
        ])
    }

    private func roastPreferencesLabel(_ roastPreferencesStatus: String) -> UIImage? {
        roastPreferencesStatus.hasPrefix("/") ? UIImage(contentsOfFile: roastPreferencesStatus) : UIImage(named: roastPreferencesStatus)
    }

    @objc private func roastPreferencesStack() {
        dismiss(animated: true)
    }

    @objc private func roastPreferencesSource(_ roastPreferencesMenu: UIButton) {
        switch roastPreferencesMenu.tag {
        case 0:
            navigationController?.pushViewController(ChovviSensoryTexture(), animated: true)
        case 1:
            roastPreferencesItem("Terms of Service", roastPreferencesItem: ChovviGentleBrew.beanPassportStack)
        case 2:
            roastPreferencesItem("Privacy Policy", roastPreferencesItem: ChovviGentleBrew.beanPassportState)
        case 3:
            roastPreferencesImage("About Choovi", roastPreferencesImage: "Choovi is a coffee journal for sharing coffee moments, moods, brewing ideas, and respectful group participation.\n\nContact: choovi@gmail.com")
        default:
            break
        }
    }

    private func roastPreferencesItem(_ roastPreferencesSelection: String, roastPreferencesItem roastPreferencesImage: String) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.pushViewController(ChovviGentleBrew(beanPassportCanvas: roastPreferencesSelection, beanPassportScroll: roastPreferencesImage, beanPassportArtwork: false, beanPassportCollection: nil), animated: true)
    }

    private func roastPreferencesImage(_ roastPreferencesChoice: String, roastPreferencesImage roastPreferencesRecord: String) {
        ChovviThermalAlertView.amberRitualSelection(self, amberRitualChoice: roastPreferencesChoice, amberRitualCanvas: roastPreferencesRecord, amberRitualArtwork: .caution)
    }

    @objc private func roastPreferencesDestination() {
        ChovviThermalAlertView.amberRitualSelection(self, amberRitualChoice: "Log Out?", amberRitualCanvas: "You can sign in again with the same account.", amberRitualScroll: "Keep Brewing", amberRitualHeader: "Log Out", amberRitualArtwork: .destructive) { } amberRitualStack: { [weak self] in
            UserDefaults.standard.set(false, forKey: "choovilogin")
            self?.dismiss(animated: true)
        }
    }

    @objc private func roastPreferencesRecord() {
        ChovviThermalAlertView.amberRitualSelection(self, amberRitualChoice: "Delete Account?", amberRitualCanvas: "This permanently removes the current account, profile, and associated content. This action cannot be undone.", amberRitualScroll: "Not Now", amberRitualHeader: "Delete", amberRitualArtwork: .destructive) { } amberRitualStack: { [weak self] in
            self?.roastPreferencesChoice()
        }
    }

    private func roastPreferencesChoice() {
        let roastPreferencesRecord = UserDefaults.standard.string(forKey: "hooviEmail")?.lowercased() ?? ""
        let roastPreferencesItem = UserDefaults.standard.string(forKey: "chovviCuppingRoast") ?? ""
        var roastPreferencesSelection = UserDefaults.standard.data(forKey: "chovviGentleTexture")
            .flatMap { try? JSONDecoder().decode([ChovviGentleTexture].self, from: $0) } ?? []
        roastPreferencesSelection.removeAll { $0.beanPassportCanvas.lowercased() == roastPreferencesRecord }
        if let roastPreferencesImage = try? JSONEncoder().encode(roastPreferencesSelection) {
            UserDefaults.standard.set(roastPreferencesImage, forKey: "chovviGentleTexture")
        }
        if roastPreferencesItem.hasPrefix("/"),
           let roastPreferencesChoice = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.standardizedFileURL.path,
           roastPreferencesItem.hasPrefix(roastPreferencesChoice) {
            try? FileManager.default.removeItem(atPath: roastPreferencesItem)
        }
        var roastPreferencesCanvas = UserDefaults.standard.dictionary(forKey: "chovviThermalBody") as? [String: String] ?? [:]
        roastPreferencesCanvas.removeValue(forKey: roastPreferencesRecord)
        UserDefaults.standard.set(roastPreferencesCanvas, forKey: "chovviThermalBody")
        [
            "chovviCuppingTexture",
            "chovviCuppingVarietal",
            "chovviCuppingRoast",
            "hooviEmail",
            "chovviThermalTexture.\(roastPreferencesRecord)",
            "chovviThermalRoast.\(roastPreferencesRecord)"
        ].forEach { UserDefaults.standard.removeObject(forKey: $0) }
        UserDefaults.standard.set(false, forKey: "choovilogin")
        dismiss(animated: true)
    }
}

private struct ChovviSensoryRoast: Hashable {
    let roastPreferencesCanvas: String
    let roastPreferencesScroll: String
    let roastPreferencesHeader: String
    let roastPreferencesArtwork: String
    let roastPreferencesCollection: String
}

final class ChovviSensoryTexture: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var roastPreferencesCanvas: [ChovviSensoryRoast] = []
    private let roastPreferencesScroll = UITableView(frame: .zero, style: .plain)
    private let roastPreferencesHeader = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        roastPreferencesArtwork()
        roastPreferencesCollection()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        roastPreferencesRender()
    }

    private func roastPreferencesArtwork() { roastPreferencesArtworkTrigger() }

    private lazy var roastPreferencesArtworkTrigger: () -> Void = { [unowned self] in
        view.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.99, alpha: 1)

        let roastPreferencesStack = UIView()
        roastPreferencesStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(roastPreferencesStack)

        let roastPreferencesState = UIButton(type: .system)
        roastPreferencesState.setImage(UIImage(systemName: "chevron.left")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        roastPreferencesState.backgroundColor = .white
        roastPreferencesState.layer.cornerRadius = 24
        roastPreferencesState.layer.borderWidth = 1
        roastPreferencesState.layer.borderColor = UIColor.systemGray5.cgColor
        roastPreferencesState.accessibilityLabel = "Back"
        roastPreferencesState.addTarget(self, action: #selector(roastPreferencesAction), for: .touchUpInside)
        roastPreferencesState.translatesAutoresizingMaskIntoConstraints = false
        roastPreferencesStack.addSubview(roastPreferencesState)

        let roastPreferencesLabel = UILabel()
        roastPreferencesLabel.text = "Blacklist"
        roastPreferencesLabel.font = .systemFont(ofSize: 30, weight: .black)
        roastPreferencesLabel.textColor = UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1)
        roastPreferencesLabel.translatesAutoresizingMaskIntoConstraints = false
        roastPreferencesStack.addSubview(roastPreferencesLabel)

        roastPreferencesScroll.backgroundColor = .clear
        roastPreferencesScroll.separatorStyle = .none
        roastPreferencesScroll.showsVerticalScrollIndicator = false
        roastPreferencesScroll.rowHeight = 132
        roastPreferencesScroll.dataSource = self
        roastPreferencesScroll.delegate = self
        roastPreferencesScroll.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 24, right: 0)
        roastPreferencesScroll.register(ChovviSensoryVarietal.self, forCellReuseIdentifier: "chovviSensoryVarietal")
        roastPreferencesScroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(roastPreferencesScroll)

        roastPreferencesHeader.axis = .vertical
        roastPreferencesHeader.alignment = .center
        roastPreferencesHeader.spacing = 10
        roastPreferencesHeader.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(roastPreferencesHeader)

        let roastPreferencesStatus = UIImageView(image: UIImage(systemName: "person.crop.circle.badge.xmark"))
        roastPreferencesStatus.tintColor = UIColor(red: 0.83, green: 0.60, blue: 0.31, alpha: 1)
        roastPreferencesStatus.contentMode = .scaleAspectFit
        roastPreferencesStatus.widthAnchor.constraint(equalToConstant: 58).isActive = true
        roastPreferencesStatus.heightAnchor.constraint(equalTo: roastPreferencesStatus.widthAnchor).isActive = true
        roastPreferencesHeader.addArrangedSubview(roastPreferencesStatus)

        let roastPreferencesRoute = UILabel()
        roastPreferencesRoute.text = "No blocked users"
        roastPreferencesRoute.font = .systemFont(ofSize: 20, weight: .bold)
        roastPreferencesRoute.textColor = UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1)
        roastPreferencesHeader.addArrangedSubview(roastPreferencesRoute)

        let roastPreferencesSection = UILabel()
        roastPreferencesSection.text = "Profiles you block will appear here."
        roastPreferencesSection.font = .systemFont(ofSize: 14)
        roastPreferencesSection.textColor = .secondaryLabel
        roastPreferencesHeader.addArrangedSubview(roastPreferencesSection)

        NSLayoutConstraint.activate([
            roastPreferencesStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10), roastPreferencesStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16), roastPreferencesStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            roastPreferencesStack.heightAnchor.constraint(equalToConstant: 70), roastPreferencesState.leadingAnchor.constraint(equalTo: roastPreferencesStack.leadingAnchor), roastPreferencesState.centerYAnchor.constraint(equalTo: roastPreferencesStack.centerYAnchor),
            roastPreferencesState.widthAnchor.constraint(equalToConstant: 48), roastPreferencesState.heightAnchor.constraint(equalTo: roastPreferencesState.widthAnchor), roastPreferencesLabel.leadingAnchor.constraint(equalTo: roastPreferencesState.trailingAnchor, constant: 14),
            roastPreferencesLabel.centerYAnchor.constraint(equalTo: roastPreferencesState.centerYAnchor), roastPreferencesLabel.trailingAnchor.constraint(lessThanOrEqualTo: roastPreferencesStack.trailingAnchor), roastPreferencesScroll.topAnchor.constraint(equalTo: roastPreferencesStack.bottomAnchor, constant: 4),
            roastPreferencesScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16), roastPreferencesScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16), roastPreferencesScroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            roastPreferencesHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor), roastPreferencesHeader.centerYAnchor.constraint(equalTo: view.centerYAnchor), roastPreferencesHeader.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 24),
            roastPreferencesHeader.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -24)
        ])
    }

    private func roastPreferencesCollection() {
        roastPreferencesRender()
    }

    private func roastPreferencesRender() { roastPreferencesRenderTrigger() }

    private lazy var roastPreferencesRenderTrigger: () -> Void = { [unowned self] in
        let roastPreferencesStack = UserDefaults.standard.stringArray(forKey: "chovviCraftedRoast") ?? []
        var roastPreferencesState = Set<String>()
        roastPreferencesCanvas = roastPreferencesStack.compactMap { roastPreferencesAction in
            guard roastPreferencesState.insert(roastPreferencesAction).inserted else { return nil }
            if let roastPreferencesLabel = ChovviCitrusBrew.roastArchiveCanvas.first(where: { $0.chovviBotanicalAcidity == roastPreferencesAction }) {
                return ChovviSensoryRoast(
                    roastPreferencesCanvas: roastPreferencesLabel.chovviBotanicalAcidity,
                    roastPreferencesScroll: roastPreferencesLabel.chovviBotanicalAeropress,
                    roastPreferencesHeader: roastPreferencesLabel.chovviBotanicalAftertaste,
                    roastPreferencesArtwork: roastPreferencesLabel.chovviBotanicalAroma,
                    roastPreferencesCollection: roastPreferencesLabel.chovviBotanicalBatch
                )
            }
            return ChovviSensoryRoast(
                roastPreferencesCanvas: roastPreferencesAction,
                roastPreferencesScroll: "Choovi Member",
                roastPreferencesHeader: "@choovimember",
                roastPreferencesArtwork: "chovviAromaticKettle",
                roastPreferencesCollection: "This profile is currently blocked."
            )
        }
        roastPreferencesScroll.reloadData()
        roastPreferencesScroll.isHidden = roastPreferencesCanvas.isEmpty
        roastPreferencesHeader.isHidden = !roastPreferencesCanvas.isEmpty
    }

    func tableView(_ roastPreferencesSelection: UITableView, numberOfRowsInSection roastPreferencesImage: Int) -> Int {
        _ = roastPreferencesSelection
        _ = roastPreferencesImage
        return roastPreferencesCanvas.count
    }

    func tableView(_ roastPreferencesSelection: UITableView, cellForRowAt roastPreferencesImage: IndexPath) -> UITableViewCell {
        guard let roastPreferencesChoice = roastPreferencesSelection.dequeueReusableCell(withIdentifier: "chovviSensoryVarietal", for: roastPreferencesImage) as? ChovviSensoryVarietal else {
            return UITableViewCell()
        }
        let roastPreferencesItem = roastPreferencesCanvas[roastPreferencesImage.row]
        roastPreferencesChoice.roastPreferencesCanvas(roastPreferencesItem) { [weak self] in
            self?.roastPreferencesLabel(roastPreferencesItem)
        }
        return roastPreferencesChoice
    }

    private func roastPreferencesLabel(_ roastPreferencesItem: ChovviSensoryRoast) {
        ChovviThermalAlertView.amberRitualSelection(self, amberRitualChoice: "Remove from blacklist?", amberRitualCanvas: "You will see content from \(roastPreferencesItem.roastPreferencesScroll) again, and they may interact with you according to your current settings.", amberRitualScroll: "Keep Blocked", amberRitualHeader: "Remove", amberRitualArtwork: .destructive) { } amberRitualStack: { [weak self] in
            guard let self else { return }
            var roastPreferencesChoice = UserDefaults.standard.stringArray(forKey: "chovviCraftedRoast") ?? []
            roastPreferencesChoice.removeAll { $0 == roastPreferencesItem.roastPreferencesCanvas }
            UserDefaults.standard.set(roastPreferencesChoice, forKey: "chovviCraftedRoast")
            self.roastPreferencesRender()
            UIAccessibility.post(notification: .announcement, argument: "Removed from blacklist")
        }
    }

    @objc private func roastPreferencesAction() {
        navigationController?.popViewController(animated: true)
    }
}

private final class ChovviSensoryVarietal: UITableViewCell {
    private let roastPreferencesCanvas = UIView()
    private let roastPreferencesScroll = UIImageView()
    private let roastPreferencesHeader = UILabel()
    private let roastPreferencesArtwork = UILabel()
    private let roastPreferencesCollection = UILabel()
    private let roastPreferencesStack = UIButton(type: .system)
    private var roastPreferencesState: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        roastPreferencesRender()
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        roastPreferencesScroll.image = nil
        roastPreferencesState = nil
    }

    private func roastPreferencesRender() { roastPreferencesRenderLayout() }

    private lazy var roastPreferencesRenderLayout: () -> Void = { [unowned self] in
        backgroundColor = .clear
        selectionStyle = .none

        roastPreferencesCanvas.backgroundColor = .white
        roastPreferencesCanvas.layer.cornerRadius = 17
        roastPreferencesCanvas.layer.borderWidth = 1
        roastPreferencesCanvas.layer.borderColor = UIColor.systemGray5.cgColor
        roastPreferencesCanvas.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(roastPreferencesCanvas)

        roastPreferencesScroll.contentMode = .scaleAspectFill
        roastPreferencesScroll.clipsToBounds = true
        roastPreferencesScroll.layer.cornerRadius = 32
        roastPreferencesScroll.backgroundColor = UIColor.systemGray6
        roastPreferencesScroll.translatesAutoresizingMaskIntoConstraints = false
        roastPreferencesCanvas.addSubview(roastPreferencesScroll)

        roastPreferencesHeader.font = .systemFont(ofSize: 17, weight: .bold)
        roastPreferencesHeader.textColor = UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1)
        roastPreferencesHeader.lineBreakMode = .byTruncatingTail
        roastPreferencesHeader.translatesAutoresizingMaskIntoConstraints = false
        roastPreferencesCanvas.addSubview(roastPreferencesHeader)

        roastPreferencesArtwork.font = .systemFont(ofSize: 13, weight: .medium)
        roastPreferencesArtwork.textColor = .secondaryLabel
        roastPreferencesArtwork.lineBreakMode = .byTruncatingTail
        roastPreferencesArtwork.translatesAutoresizingMaskIntoConstraints = false
        roastPreferencesCanvas.addSubview(roastPreferencesArtwork)

        roastPreferencesCollection.font = .systemFont(ofSize: 13)
        roastPreferencesCollection.textColor = UIColor(red: 0.55, green: 0.56, blue: 0.64, alpha: 1)
        roastPreferencesCollection.lineBreakMode = .byTruncatingTail
        roastPreferencesCollection.translatesAutoresizingMaskIntoConstraints = false
        roastPreferencesCanvas.addSubview(roastPreferencesCollection)

        roastPreferencesStack.setTitle("Remove", for: .normal)
        roastPreferencesStack.setTitleColor(.white, for: .normal)
        roastPreferencesStack.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        roastPreferencesStack.backgroundColor = UIColor(red: 0.83, green: 0.60, blue: 0.31, alpha: 1)
        roastPreferencesStack.layer.cornerRadius = 22
        roastPreferencesStack.addTarget(self, action: #selector(roastPreferencesAction), for: .touchUpInside)
        roastPreferencesStack.translatesAutoresizingMaskIntoConstraints = false
        roastPreferencesCanvas.addSubview(roastPreferencesStack)

        NSLayoutConstraint.activate([
            roastPreferencesCanvas.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6), roastPreferencesCanvas.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), roastPreferencesCanvas.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            roastPreferencesCanvas.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6), roastPreferencesScroll.leadingAnchor.constraint(equalTo: roastPreferencesCanvas.leadingAnchor, constant: 14), roastPreferencesScroll.centerYAnchor.constraint(equalTo: roastPreferencesCanvas.centerYAnchor),
            roastPreferencesScroll.widthAnchor.constraint(equalToConstant: 64), roastPreferencesScroll.heightAnchor.constraint(equalTo: roastPreferencesScroll.widthAnchor), roastPreferencesStack.trailingAnchor.constraint(equalTo: roastPreferencesCanvas.trailingAnchor, constant: -14),
            roastPreferencesStack.centerYAnchor.constraint(equalTo: roastPreferencesCanvas.centerYAnchor), roastPreferencesStack.widthAnchor.constraint(equalToConstant: 94), roastPreferencesStack.heightAnchor.constraint(equalToConstant: 44),
            roastPreferencesHeader.leadingAnchor.constraint(equalTo: roastPreferencesScroll.trailingAnchor, constant: 12), roastPreferencesHeader.trailingAnchor.constraint(equalTo: roastPreferencesStack.leadingAnchor, constant: -10), roastPreferencesHeader.topAnchor.constraint(equalTo: roastPreferencesScroll.topAnchor, constant: -2),
            roastPreferencesArtwork.leadingAnchor.constraint(equalTo: roastPreferencesHeader.leadingAnchor), roastPreferencesArtwork.trailingAnchor.constraint(equalTo: roastPreferencesHeader.trailingAnchor), roastPreferencesArtwork.topAnchor.constraint(equalTo: roastPreferencesHeader.bottomAnchor, constant: 3),
            roastPreferencesCollection.leadingAnchor.constraint(equalTo: roastPreferencesHeader.leadingAnchor), roastPreferencesCollection.trailingAnchor.constraint(equalTo: roastPreferencesHeader.trailingAnchor), roastPreferencesCollection.topAnchor.constraint(equalTo: roastPreferencesArtwork.bottomAnchor, constant: 3),
            roastPreferencesCollection.bottomAnchor.constraint(lessThanOrEqualTo: roastPreferencesCanvas.bottomAnchor, constant: -12)
        ])
    }

    func roastPreferencesCanvas(_ roastPreferencesItem: ChovviSensoryRoast, roastPreferencesScroll: @escaping () -> Void) {
        self.roastPreferencesScroll.image = UIImage(named: roastPreferencesItem.roastPreferencesArtwork) ?? UIImage(systemName: "person.crop.circle.fill")
        roastPreferencesHeader.text = roastPreferencesItem.roastPreferencesScroll
        roastPreferencesArtwork.text = roastPreferencesItem.roastPreferencesHeader
        roastPreferencesCollection.text = roastPreferencesItem.roastPreferencesCollection
        roastPreferencesState = roastPreferencesScroll
        accessibilityLabel = "\(roastPreferencesItem.roastPreferencesScroll), blocked profile"
    }

    @objc private func roastPreferencesAction() {
        roastPreferencesState?()
    }
}
