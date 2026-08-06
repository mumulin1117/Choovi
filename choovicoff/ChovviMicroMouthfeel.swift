import UIKit

final class ChovviMicroMouthfeel: UIViewController {
    private let coffeeBulletinCanvas = UIScrollView()
    private let coffeeBulletinScroll = UIStackView()
    fileprivate static let coffeeBulletinHeader = UIColor(red: 0.84, green: 0.61, blue: 0.31, alpha: 1)
    private let coffeeBulletinArtwork = ["Comments", "Likes", "New Followers"]
    private let coffeeBulletinCollection = ["bubble.left", "heart", "person.badge.plus"]

    override func viewDidLoad() {
        super.viewDidLoad()
        coffeeBulletinStack()
        coffeeBulletinState()
    }

    private func coffeeBulletinStack() {
        title = "Messages"
        view.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.99, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(coffeeBulletinRender)
        )
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1),
            .font: UIFont.systemFont(ofSize: 25, weight: .black)
        ]
        navigationController?.navigationBar.prefersLargeTitles = false

        coffeeBulletinCanvas.alwaysBounceVertical = true
        coffeeBulletinCanvas.showsVerticalScrollIndicator = false
        coffeeBulletinCanvas.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(coffeeBulletinCanvas)

        coffeeBulletinScroll.axis = .vertical
        coffeeBulletinScroll.spacing = 14
        coffeeBulletinScroll.translatesAutoresizingMaskIntoConstraints = false
        coffeeBulletinCanvas.addSubview(coffeeBulletinScroll)

        NSLayoutConstraint.activate([
            coffeeBulletinCanvas.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), coffeeBulletinCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor), coffeeBulletinCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coffeeBulletinCanvas.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), coffeeBulletinScroll.topAnchor.constraint(equalTo: coffeeBulletinCanvas.contentLayoutGuide.topAnchor, constant: 18), coffeeBulletinScroll.leadingAnchor.constraint(equalTo: coffeeBulletinCanvas.contentLayoutGuide.leadingAnchor, constant: 16),
            coffeeBulletinScroll.trailingAnchor.constraint(equalTo: coffeeBulletinCanvas.contentLayoutGuide.trailingAnchor, constant: -16), coffeeBulletinScroll.bottomAnchor.constraint(equalTo: coffeeBulletinCanvas.contentLayoutGuide.bottomAnchor, constant: -24), coffeeBulletinScroll.widthAnchor.constraint(equalTo: coffeeBulletinCanvas.frameLayoutGuide.widthAnchor, constant: -32)
        ])
    }

    private func coffeeBulletinState() {
        let coffeeBulletinAction = UIStackView()
        coffeeBulletinAction.axis = .horizontal
        coffeeBulletinAction.distribution = .fillEqually
        coffeeBulletinAction.spacing = 10
        coffeeBulletinArtwork.enumerated().forEach { coffeeBulletinLabel, coffeeBulletinStatus in
            coffeeBulletinAction.addArrangedSubview(coffeeBulletinRoute(coffeeBulletinStatus, coffeeBulletinSection: coffeeBulletinCollection[coffeeBulletinLabel], coffeeBulletinPreview: coffeeBulletinLabel))
        }
        coffeeBulletinAction.heightAnchor.constraint(equalToConstant: 148).isActive = true
        coffeeBulletinScroll.addArrangedSubview(coffeeBulletinAction)
        coffeeBulletinScroll.setCustomSpacing(24, after: coffeeBulletinAction)

        coffeeBulletinScroll.addArrangedSubview(coffeeBulletinTrigger("System Messages"))
        coffeeBulletinScroll.addArrangedSubview(coffeeBulletinRecord())

        coffeeBulletinScroll.setCustomSpacing(24, after: coffeeBulletinScroll.arrangedSubviews.last!)
        coffeeBulletinScroll.addArrangedSubview(coffeeBulletinTrigger("Chats"))
        coffeeBulletinScroll.addArrangedSubview(coffeeBulletinDestination())
    }

    private func coffeeBulletinRoute(_ coffeeBulletinSection: String, coffeeBulletinSection coffeeBulletinPreview: String, coffeeBulletinPreview coffeeBulletinTrigger: Int) -> UIButton {
        let coffeeBulletinLayout = UIButton(type: .system)
        coffeeBulletinLayout.tag = coffeeBulletinTrigger
        coffeeBulletinLayout.backgroundColor = .white
        coffeeBulletinLayout.layer.cornerRadius = 18
        coffeeBulletinLayout.layer.borderWidth = 1
        coffeeBulletinLayout.layer.borderColor = UIColor.systemGray5.cgColor
        coffeeBulletinLayout.addTarget(self, action: #selector(coffeeBulletinSource(_:)), for: .touchUpInside)

        let coffeeBulletinMenu = UIView()
        coffeeBulletinMenu.backgroundColor = UIColor(red: 1, green: 0.95, blue: 0.87, alpha: 1)
        coffeeBulletinMenu.layer.cornerRadius = 34
        coffeeBulletinMenu.isUserInteractionEnabled = false
        coffeeBulletinMenu.translatesAutoresizingMaskIntoConstraints = false
        coffeeBulletinLayout.addSubview(coffeeBulletinMenu)

        let coffeeBulletinUpdate = UIImageView(image: UIImage(systemName: coffeeBulletinPreview, withConfiguration: UIImage.SymbolConfiguration(pointSize: 29, weight: .medium)))
        coffeeBulletinUpdate.tintColor = Self.coffeeBulletinHeader
        coffeeBulletinUpdate.contentMode = .scaleAspectFit
        coffeeBulletinUpdate.translatesAutoresizingMaskIntoConstraints = false
        coffeeBulletinMenu.addSubview(coffeeBulletinUpdate)

        let coffeeBulletinDestination = UILabel()
        coffeeBulletinDestination.text = coffeeBulletinSection
        coffeeBulletinDestination.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.20, alpha: 1)
        coffeeBulletinDestination.font = .systemFont(ofSize: 14, weight: .bold)
        coffeeBulletinDestination.adjustsFontSizeToFitWidth = true
        coffeeBulletinDestination.minimumScaleFactor = 0.72
        coffeeBulletinDestination.textAlignment = .center
        coffeeBulletinDestination.translatesAutoresizingMaskIntoConstraints = false
        coffeeBulletinLayout.addSubview(coffeeBulletinDestination)

        NSLayoutConstraint.activate([
            coffeeBulletinMenu.topAnchor.constraint(equalTo: coffeeBulletinLayout.topAnchor, constant: 22), coffeeBulletinMenu.centerXAnchor.constraint(equalTo: coffeeBulletinLayout.centerXAnchor), coffeeBulletinMenu.widthAnchor.constraint(equalToConstant: 68),
            coffeeBulletinMenu.heightAnchor.constraint(equalTo: coffeeBulletinMenu.widthAnchor), coffeeBulletinUpdate.centerXAnchor.constraint(equalTo: coffeeBulletinMenu.centerXAnchor), coffeeBulletinUpdate.centerYAnchor.constraint(equalTo: coffeeBulletinMenu.centerYAnchor),
            coffeeBulletinUpdate.widthAnchor.constraint(equalToConstant: 36), coffeeBulletinUpdate.heightAnchor.constraint(equalTo: coffeeBulletinUpdate.widthAnchor), coffeeBulletinDestination.topAnchor.constraint(equalTo: coffeeBulletinMenu.bottomAnchor, constant: 12),
            coffeeBulletinDestination.leadingAnchor.constraint(equalTo: coffeeBulletinLayout.leadingAnchor, constant: 5), coffeeBulletinDestination.trailingAnchor.constraint(equalTo: coffeeBulletinLayout.trailingAnchor, constant: -5)
        ])
        return coffeeBulletinLayout
    }

    private func coffeeBulletinTrigger(_ coffeeBulletinLayout: String) -> UILabel {
        let coffeeBulletinSource = UILabel()
        coffeeBulletinSource.text = coffeeBulletinLayout
        coffeeBulletinSource.font = .systemFont(ofSize: 22, weight: .black)
        coffeeBulletinSource.textColor = UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1)
        coffeeBulletinSource.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return coffeeBulletinSource
    }

    private func coffeeBulletinRecord() -> UIView {
        let coffeeBulletinCard = UIView()
        coffeeBulletinCard.backgroundColor = .white
        coffeeBulletinCard.layer.cornerRadius = 17
        coffeeBulletinCard.layer.borderWidth = 1
        coffeeBulletinCard.layer.borderColor = UIColor.systemGray5.cgColor
        coffeeBulletinCard.heightAnchor.constraint(equalToConstant: 76).isActive = true

        let coffeeBulletinItem = UIImageView(image: UIImage(systemName: "bell.fill"))
        coffeeBulletinItem.tintColor = Self.coffeeBulletinHeader
        coffeeBulletinItem.contentMode = .scaleAspectFit
        coffeeBulletinItem.translatesAutoresizingMaskIntoConstraints = false
        coffeeBulletinCard.addSubview(coffeeBulletinItem)

        let coffeeBulletinSelection = UILabel()
        coffeeBulletinSelection.text = "Welcome to Choovi! Start sharing your favorite coffee moments."
        coffeeBulletinSelection.font = .systemFont(ofSize: 14, weight: .medium)
        coffeeBulletinSelection.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.20, alpha: 1)
        coffeeBulletinSelection.numberOfLines = 2
        coffeeBulletinSelection.translatesAutoresizingMaskIntoConstraints = false
        coffeeBulletinCard.addSubview(coffeeBulletinSelection)

        NSLayoutConstraint.activate([
            coffeeBulletinItem.leadingAnchor.constraint(equalTo: coffeeBulletinCard.leadingAnchor, constant: 18), coffeeBulletinItem.centerYAnchor.constraint(equalTo: coffeeBulletinCard.centerYAnchor), coffeeBulletinItem.widthAnchor.constraint(equalToConstant: 28),
            coffeeBulletinItem.heightAnchor.constraint(equalTo: coffeeBulletinItem.widthAnchor), coffeeBulletinSelection.leadingAnchor.constraint(equalTo: coffeeBulletinItem.trailingAnchor, constant: 14), coffeeBulletinSelection.trailingAnchor.constraint(equalTo: coffeeBulletinCard.trailingAnchor, constant: -16),
            coffeeBulletinSelection.centerYAnchor.constraint(equalTo: coffeeBulletinCard.centerYAnchor)
        ])
        return coffeeBulletinCard
    }

    private func coffeeBulletinLayout(_ coffeeBulletinSource: ChovviBotanicalProfile, coffeeBulletinSource coffeeBulletinMenu: String, coffeeBulletinMenu coffeeBulletinUpdate: String, coffeeBulletinUpdate coffeeBulletinDestination: String) -> UIView {
        coffeeBulletinLayoutTrigger(coffeeBulletinSource, coffeeBulletinMenu, coffeeBulletinUpdate, coffeeBulletinDestination)
    }

    private lazy var coffeeBulletinLayoutTrigger: (ChovviBotanicalProfile, String, String, String) -> UIView = { [unowned self] coffeeBulletinSource, coffeeBulletinMenu, coffeeBulletinUpdate, coffeeBulletinDestination in
        let coffeeBulletinCard = UIView()
        coffeeBulletinCard.backgroundColor = .white
        coffeeBulletinCard.layer.cornerRadius = 17
        coffeeBulletinCard.layer.borderWidth = 1
        coffeeBulletinCard.layer.borderColor = UIColor.systemGray5.cgColor
        coffeeBulletinCard.heightAnchor.constraint(greaterThanOrEqualToConstant: 94).isActive = true

        let coffeeBulletinRecord = UIImageView(image: UIImage(named: coffeeBulletinSource.chovviBotanicalAroma))
        coffeeBulletinRecord.contentMode = .scaleAspectFill
        coffeeBulletinRecord.clipsToBounds = true
        coffeeBulletinRecord.layer.cornerRadius = 25
        coffeeBulletinRecord.translatesAutoresizingMaskIntoConstraints = false
        coffeeBulletinCard.addSubview(coffeeBulletinRecord)

        let coffeeBulletinItem = UILabel()
        coffeeBulletinItem.text = coffeeBulletinMenu
        coffeeBulletinItem.font = .systemFont(ofSize: 15, weight: .bold)
        coffeeBulletinItem.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.20, alpha: 1)
        coffeeBulletinItem.numberOfLines = 1
        coffeeBulletinItem.translatesAutoresizingMaskIntoConstraints = false
        coffeeBulletinCard.addSubview(coffeeBulletinItem)

        let coffeeBulletinSelection = UILabel()
        coffeeBulletinSelection.text = coffeeBulletinUpdate
        coffeeBulletinSelection.font = .systemFont(ofSize: 13, weight: .medium)
        coffeeBulletinSelection.textColor = .secondaryLabel
        coffeeBulletinSelection.numberOfLines = 2
        coffeeBulletinSelection.translatesAutoresizingMaskIntoConstraints = false
        coffeeBulletinCard.addSubview(coffeeBulletinSelection)

        let coffeeBulletinImage = UILabel()
        coffeeBulletinImage.text = coffeeBulletinDestination
        coffeeBulletinImage.font = .systemFont(ofSize: 11, weight: .medium)
        coffeeBulletinImage.textColor = .tertiaryLabel
        coffeeBulletinImage.translatesAutoresizingMaskIntoConstraints = false
        coffeeBulletinCard.addSubview(coffeeBulletinImage)

        NSLayoutConstraint.activate([
            coffeeBulletinRecord.leadingAnchor.constraint(equalTo: coffeeBulletinCard.leadingAnchor, constant: 14), coffeeBulletinRecord.centerYAnchor.constraint(equalTo: coffeeBulletinCard.centerYAnchor), coffeeBulletinRecord.widthAnchor.constraint(equalToConstant: 50),
            coffeeBulletinRecord.heightAnchor.constraint(equalTo: coffeeBulletinRecord.widthAnchor), coffeeBulletinItem.leadingAnchor.constraint(equalTo: coffeeBulletinRecord.trailingAnchor, constant: 12), coffeeBulletinItem.topAnchor.constraint(equalTo: coffeeBulletinCard.topAnchor, constant: 16),
            coffeeBulletinItem.trailingAnchor.constraint(lessThanOrEqualTo: coffeeBulletinImage.leadingAnchor, constant: -8), coffeeBulletinImage.trailingAnchor.constraint(equalTo: coffeeBulletinCard.trailingAnchor, constant: -14), coffeeBulletinImage.centerYAnchor.constraint(equalTo: coffeeBulletinItem.centerYAnchor),
            coffeeBulletinSelection.leadingAnchor.constraint(equalTo: coffeeBulletinItem.leadingAnchor), coffeeBulletinSelection.trailingAnchor.constraint(equalTo: coffeeBulletinCard.trailingAnchor, constant: -14), coffeeBulletinSelection.topAnchor.constraint(equalTo: coffeeBulletinItem.bottomAnchor, constant: 5),
            coffeeBulletinSelection.bottomAnchor.constraint(lessThanOrEqualTo: coffeeBulletinCard.bottomAnchor, constant: -13)
        ])
        return coffeeBulletinCard
    }

    private func coffeeBulletinDestination() -> UIView {
        let coffeeBulletinCard = UIView()
        coffeeBulletinCard.backgroundColor = .white
        coffeeBulletinCard.layer.cornerRadius = 17
        coffeeBulletinCard.layer.borderWidth = 1
        coffeeBulletinCard.layer.borderColor = UIColor.systemGray5.cgColor
        coffeeBulletinCard.heightAnchor.constraint(equalToConstant: 108).isActive = true

        let coffeeBulletinRecord = UIImageView(image: UIImage(systemName: "person.2.slash"))
        coffeeBulletinRecord.tintColor = Self.coffeeBulletinHeader
        coffeeBulletinRecord.contentMode = .scaleAspectFit
        coffeeBulletinRecord.translatesAutoresizingMaskIntoConstraints = false
        coffeeBulletinCard.addSubview(coffeeBulletinRecord)

        let coffeeBulletinItem = UILabel()
        coffeeBulletinItem.text = "No Friend message."
        coffeeBulletinItem.font = .systemFont(ofSize: 16, weight: .bold)
        coffeeBulletinItem.textColor = .secondaryLabel
        coffeeBulletinItem.translatesAutoresizingMaskIntoConstraints = false
        coffeeBulletinCard.addSubview(coffeeBulletinItem)

        NSLayoutConstraint.activate([
            coffeeBulletinRecord.centerXAnchor.constraint(equalTo: coffeeBulletinCard.centerXAnchor), coffeeBulletinRecord.topAnchor.constraint(equalTo: coffeeBulletinCard.topAnchor, constant: 18), coffeeBulletinRecord.widthAnchor.constraint(equalToConstant: 34),
            coffeeBulletinRecord.heightAnchor.constraint(equalTo: coffeeBulletinRecord.widthAnchor), coffeeBulletinItem.centerXAnchor.constraint(equalTo: coffeeBulletinCard.centerXAnchor), coffeeBulletinItem.topAnchor.constraint(equalTo: coffeeBulletinRecord.bottomAnchor, constant: 9)
        ])
        return coffeeBulletinCard
    }

    @objc private func coffeeBulletinSource(_ coffeeBulletinLayout: UIButton) {
        let coffeeBulletinMenu = coffeeBulletinArtwork.indices.contains(coffeeBulletinLayout.tag)
            ? coffeeBulletinArtwork[coffeeBulletinLayout.tag]
            : "Updates"
        let coffeeBulletinUpdate = ChovviMicroRoast(coffeeBulletinCanvas: coffeeBulletinMenu)
        navigationController?.pushViewController(coffeeBulletinUpdate, animated: true)
    }

    @objc private func coffeeBulletinRender() {
        dismiss(animated: true)
    }
}

final class ChovviMicroRoast: UIViewController {
    private let coffeeBulletinCanvas: String

    init(coffeeBulletinCanvas: String) {
        self.coffeeBulletinCanvas = coffeeBulletinCanvas
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        coffeeBulletinCanvas = "Updates"
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        coffeeBulletinScroll()
    }

    private func coffeeBulletinScroll() {
        title = coffeeBulletinCanvas
        view.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.99, alpha: 1)
        navigationController?.navigationBar.tintColor = .black

        let coffeeBulletinHeader = UIImageView(image: UIImage(systemName: coffeeBulletinArtwork(), withConfiguration: UIImage.SymbolConfiguration(pointSize: 38, weight: .medium)))
        coffeeBulletinHeader.tintColor = ChovviMicroMouthfeel.coffeeBulletinHeader
        coffeeBulletinHeader.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(coffeeBulletinHeader)

        let coffeeBulletinCollection = UILabel()
        coffeeBulletinCollection.text = "No \(coffeeBulletinCanvas)"
        coffeeBulletinCollection.font = .systemFont(ofSize: 22, weight: .black)
        coffeeBulletinCollection.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.20, alpha: 1)
        coffeeBulletinCollection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(coffeeBulletinCollection)

        let coffeeBulletinStack = UILabel()
        coffeeBulletinStack.text = "There are no \(coffeeBulletinCanvas.lowercased()) to show yet."
        coffeeBulletinStack.font = .systemFont(ofSize: 15, weight: .medium)
        coffeeBulletinStack.textColor = .secondaryLabel
        coffeeBulletinStack.textAlignment = .center
        coffeeBulletinStack.numberOfLines = 0
        coffeeBulletinStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(coffeeBulletinStack)

        NSLayoutConstraint.activate([
            coffeeBulletinHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor), coffeeBulletinHeader.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -54), coffeeBulletinHeader.widthAnchor.constraint(equalToConstant: 68),
            coffeeBulletinHeader.heightAnchor.constraint(equalTo: coffeeBulletinHeader.widthAnchor), coffeeBulletinCollection.topAnchor.constraint(equalTo: coffeeBulletinHeader.bottomAnchor, constant: 18), coffeeBulletinCollection.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coffeeBulletinStack.topAnchor.constraint(equalTo: coffeeBulletinCollection.bottomAnchor, constant: 9), coffeeBulletinStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34), coffeeBulletinStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -34)
        ])
    }

    private func coffeeBulletinArtwork() -> String {
        if coffeeBulletinCanvas == "Likes" { return "heart" }
        if coffeeBulletinCanvas == "New Followers" { return "person.badge.plus" }
        return "bubble.left"
    }
}
