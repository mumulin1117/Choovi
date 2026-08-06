import UIKit
import AVFoundation

final class ChovviAromaticProfile: UIViewController {
    private let originPortraitCanvas: ChovviBotanicalProfile
    private let originPortraitScroll = UIScrollView()
    private let originPortraitHeader = UIStackView()
    private var originPortraitArtwork: [String] = []
    private var originPortraitCollection: [ChovviSilkyProfile] = []
    private let originPortraitStack = UIStackView()
    private var originPortraitState = 0
    private let originPortraitRender = UILabel()
    private let originPortraitAction = UILabel()
    private let originPortraitLabel = UILabel()
    private let originPortraitStatus = UIButton(type: .system)
    private let originPortraitRoute = UIButton(type: .system)
    private let originPortraitSection = UIView()
    private let originPortraitPreview = UIButton(type: .system)
    private let originPortraitTrigger = UIButton(type: .system)
    private let originPortraitLayout = UIView()
    private var coffeeBulletinSource: [AVAssetImageGenerator] = []

    init(originPortraitCanvas: ChovviBotanicalProfile) {
        self.originPortraitCanvas = originPortraitCanvas
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        originPortraitSource()
        originPortraitMenu()
        originPortraitUpdate()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        originPortraitDestination()
    }

    private func originPortraitSource() {
        let originPortraitMenu = ChovviCitrusProfile.roastArchivePreview + ChovviCitrusProfile.roastArchiveRender
        originPortraitArtwork = originPortraitMenu
            .filter { originPortraitUpdate in originPortraitUpdate.chovviCaramelAeropress == originPortraitCanvas.chovviBotanicalAcidity }
            .flatMap(\.chovviCaramelAftertaste)

        originPortraitCollection = (ChovviCitrusProfile.roastArchiveSection + ChovviCitrusProfile.roastArchiveStatus)
            .filter { originPortraitDestination in originPortraitDestination.chovviSilkyAeropress == originPortraitCanvas.chovviBotanicalAcidity }
    }

    private func originPortraitMenu() {
        view.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.99, alpha: 1)
        originPortraitScroll.showsVerticalScrollIndicator = false
        originPortraitScroll.alwaysBounceVertical = true
        originPortraitScroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(originPortraitScroll)

        originPortraitHeader.axis = .vertical
        originPortraitHeader.spacing = 0
        originPortraitHeader.translatesAutoresizingMaskIntoConstraints = false
        originPortraitScroll.addSubview(originPortraitHeader)

        let originPortraitUpdate = originPortraitCard()
        originPortraitHeader.addArrangedSubview(originPortraitUpdate)
        originPortraitHeader.addArrangedSubview(originPortraitRecord())
        originPortraitHeader.addArrangedSubview(originPortraitItem())

        originPortraitStack.axis = .vertical
        originPortraitStack.spacing = 10
        originPortraitHeader.addArrangedSubview(originPortraitStack)

        NSLayoutConstraint.activate([
            originPortraitScroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), originPortraitScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor), originPortraitScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            originPortraitScroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), originPortraitHeader.topAnchor.constraint(equalTo: originPortraitScroll.contentLayoutGuide.topAnchor), originPortraitHeader.leadingAnchor.constraint(equalTo: originPortraitScroll.contentLayoutGuide.leadingAnchor),
            originPortraitHeader.trailingAnchor.constraint(equalTo: originPortraitScroll.contentLayoutGuide.trailingAnchor), originPortraitHeader.bottomAnchor.constraint(equalTo: originPortraitScroll.contentLayoutGuide.bottomAnchor, constant: -24), originPortraitHeader.widthAnchor.constraint(equalTo: originPortraitScroll.frameLayoutGuide.widthAnchor)
        ])
    }

    private func originPortraitCard() -> UIView {
        originPortraitSection.heightAnchor.constraint(equalTo: originPortraitSection.widthAnchor, multiplier: 0.38).isActive = true
        let originPortraitRecord = UIImageView(image: originPortraitImage(originPortraitArtwork.last ?? originPortraitCanvas.chovviBotanicalAroma))
        originPortraitRecord.contentMode = .scaleAspectFill
        originPortraitRecord.clipsToBounds = true
        originPortraitRecord.translatesAutoresizingMaskIntoConstraints = false
        originPortraitSection.addSubview(originPortraitRecord)

        let originPortraitItem = UIView()
        originPortraitItem.backgroundColor = UIColor.black.withAlphaComponent(0.18)
        originPortraitItem.translatesAutoresizingMaskIntoConstraints = false
        originPortraitSection.addSubview(originPortraitItem)

        let originPortraitSelection = UIButton(type: .system)
        originPortraitSelection.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        originPortraitSelection.tintColor = .black
        originPortraitSelection.backgroundColor = UIColor.white.withAlphaComponent(0.92)
        originPortraitSelection.layer.cornerRadius = 17
        originPortraitSelection.addTarget(self, action: #selector(originPortraitChoice), for: .touchUpInside)
        originPortraitSelection.translatesAutoresizingMaskIntoConstraints = false
        originPortraitSection.addSubview(originPortraitSelection)

        let coffeeBulletinCanvas = UIButton(type: .custom)
        coffeeBulletinCanvas.setImage(UIImage(named: "chovviAromaticVarietal")?.withRenderingMode(.alwaysOriginal), for: .normal)
        coffeeBulletinCanvas.imageView?.contentMode = .scaleAspectFit
        coffeeBulletinCanvas.accessibilityLabel = "Report or block user"
        coffeeBulletinCanvas.addTarget(self, action: #selector(coffeeBulletinHeader(_:)), for: .touchUpInside)
        coffeeBulletinCanvas.translatesAutoresizingMaskIntoConstraints = false
        originPortraitSection.addSubview(coffeeBulletinCanvas)
        NSLayoutConstraint.activate([
            originPortraitRecord.topAnchor.constraint(equalTo: originPortraitSection.topAnchor), originPortraitRecord.leadingAnchor.constraint(equalTo: originPortraitSection.leadingAnchor), originPortraitRecord.trailingAnchor.constraint(equalTo: originPortraitSection.trailingAnchor),
            originPortraitRecord.bottomAnchor.constraint(equalTo: originPortraitSection.bottomAnchor), originPortraitItem.topAnchor.constraint(equalTo: originPortraitSection.topAnchor), originPortraitItem.leadingAnchor.constraint(equalTo: originPortraitSection.leadingAnchor),
            originPortraitItem.trailingAnchor.constraint(equalTo: originPortraitSection.trailingAnchor), originPortraitItem.bottomAnchor.constraint(equalTo: originPortraitSection.bottomAnchor), originPortraitSelection.leadingAnchor.constraint(equalTo: originPortraitSection.leadingAnchor, constant: 14),
            originPortraitSelection.topAnchor.constraint(equalTo: originPortraitSection.topAnchor, constant: 12), originPortraitSelection.widthAnchor.constraint(equalToConstant: 34), originPortraitSelection.heightAnchor.constraint(equalTo: originPortraitSelection.widthAnchor),
            coffeeBulletinCanvas.trailingAnchor.constraint(equalTo: originPortraitSection.trailingAnchor, constant: -14), coffeeBulletinCanvas.centerYAnchor.constraint(equalTo: originPortraitSelection.centerYAnchor), coffeeBulletinCanvas.widthAnchor.constraint(equalToConstant: 34),
            coffeeBulletinCanvas.heightAnchor.constraint(equalTo: coffeeBulletinCanvas.widthAnchor)
        ])
        return originPortraitSection
    }

    private func originPortraitRecord() -> UIView { originPortraitRecordTrigger() }

    private lazy var originPortraitRecordTrigger: () -> UIView = { [unowned self] in
        let originPortraitItem = UIView()
        originPortraitItem.heightAnchor.constraint(equalToConstant: 150).isActive = true

        let originPortraitSelection = UIImageView(image: UIImage(named: originPortraitCanvas.chovviBotanicalAroma))
        originPortraitSelection.contentMode = .scaleAspectFill
        originPortraitSelection.clipsToBounds = true
        originPortraitSelection.layer.cornerRadius = 28
        originPortraitSelection.layer.borderWidth = 3
        originPortraitSelection.layer.borderColor = UIColor.white.cgColor
        originPortraitSelection.translatesAutoresizingMaskIntoConstraints = false
        originPortraitItem.addSubview(originPortraitSelection)

        originPortraitRoute.setTitle("Message", for: .normal)
        originPortraitRoute.setTitleColor(ChovviRoastedProfile.discoveryShelfCanvas, for: .normal)
        originPortraitRoute.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        originPortraitRoute.layer.cornerRadius = 16
        originPortraitRoute.layer.borderWidth = 1
        originPortraitRoute.layer.borderColor = ChovviRoastedProfile.discoveryShelfCanvas.cgColor
        originPortraitRoute.addTarget(self, action: #selector(coffeeBulletinStack), for: .touchUpInside)
        originPortraitRoute.translatesAutoresizingMaskIntoConstraints = false
        originPortraitItem.addSubview(originPortraitRoute)

        originPortraitStatus.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        originPortraitStatus.layer.cornerRadius = 16
        originPortraitStatus.layer.borderWidth = 1
        originPortraitStatus.layer.borderColor = ChovviRoastedProfile.discoveryShelfCanvas.cgColor
        originPortraitStatus.addTarget(self, action: #selector(coffeeBulletinStatus), for: .touchUpInside)
        originPortraitStatus.translatesAutoresizingMaskIntoConstraints = false
        originPortraitItem.addSubview(originPortraitStatus)

        let originPortraitImage = UILabel()
        originPortraitImage.text = originPortraitCanvas.chovviBotanicalAeropress
        originPortraitImage.textColor = ChovviRoastedProfile.discoveryShelfScroll
        originPortraitImage.font = UIFont.systemFont(ofSize: 19, weight: .black)
        originPortraitImage.translatesAutoresizingMaskIntoConstraints = false
        originPortraitItem.addSubview(originPortraitImage)

        let originPortraitChoice = UILabel()
        originPortraitChoice.text = originPortraitCanvas.chovviBotanicalBatch
        originPortraitChoice.textColor = .secondaryLabel
        originPortraitChoice.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        originPortraitChoice.numberOfLines = 1
        originPortraitChoice.adjustsFontSizeToFitWidth = true
        originPortraitChoice.translatesAutoresizingMaskIntoConstraints = false
        originPortraitItem.addSubview(originPortraitChoice)
        NSLayoutConstraint.activate([
            originPortraitSelection.leadingAnchor.constraint(equalTo: originPortraitItem.leadingAnchor, constant: 18), originPortraitSelection.topAnchor.constraint(equalTo: originPortraitItem.topAnchor, constant: -28), originPortraitSelection.widthAnchor.constraint(equalToConstant: 56),
            originPortraitSelection.heightAnchor.constraint(equalTo: originPortraitSelection.widthAnchor), originPortraitStatus.trailingAnchor.constraint(equalTo: originPortraitItem.trailingAnchor, constant: -16), originPortraitStatus.topAnchor.constraint(equalTo: originPortraitItem.topAnchor, constant: 14),
            originPortraitStatus.widthAnchor.constraint(equalToConstant: 70), originPortraitStatus.heightAnchor.constraint(equalToConstant: 32), originPortraitRoute.trailingAnchor.constraint(equalTo: originPortraitStatus.leadingAnchor, constant: -8),
            originPortraitRoute.centerYAnchor.constraint(equalTo: originPortraitStatus.centerYAnchor), originPortraitRoute.widthAnchor.constraint(equalToConstant: 82), originPortraitRoute.heightAnchor.constraint(equalToConstant: 32),
            originPortraitImage.leadingAnchor.constraint(equalTo: originPortraitItem.leadingAnchor, constant: 16), originPortraitImage.topAnchor.constraint(equalTo: originPortraitItem.topAnchor, constant: 46), originPortraitImage.trailingAnchor.constraint(equalTo: originPortraitItem.trailingAnchor, constant: -16),
            originPortraitChoice.leadingAnchor.constraint(equalTo: originPortraitImage.leadingAnchor), originPortraitChoice.topAnchor.constraint(equalTo: originPortraitImage.bottomAnchor, constant: 5), originPortraitChoice.trailingAnchor.constraint(equalTo: originPortraitItem.trailingAnchor, constant: -16)
        ])
        return originPortraitItem
    }

    private func originPortraitItem() -> UIView { originPortraitItemTrigger() }

    private lazy var originPortraitItemTrigger: () -> UIView = { [unowned self] in
        let originPortraitSelection = UIView()
        originPortraitSelection.heightAnchor.constraint(equalToConstant: 112).isActive = true
        let originPortraitImage = UIStackView()
        originPortraitImage.axis = .horizontal
        originPortraitImage.distribution = .fillEqually
        originPortraitImage.translatesAutoresizingMaskIntoConstraints = false
        originPortraitSelection.addSubview(originPortraitImage)

        [originPortraitRender, originPortraitAction, originPortraitLabel].forEach { originPortraitChoice in
            originPortraitChoice.textAlignment = .center
            originPortraitChoice.textColor = ChovviRoastedProfile.discoveryShelfScroll
            originPortraitChoice.numberOfLines = 2
            originPortraitChoice.font = UIFont.systemFont(ofSize: 13, weight: .bold)
            originPortraitImage.addArrangedSubview(originPortraitChoice)
        }

        let originPortraitChoice = UIStackView()
        originPortraitChoice.axis = .horizontal
        originPortraitChoice.distribution = .fillEqually
        originPortraitChoice.translatesAutoresizingMaskIntoConstraints = false
        originPortraitSelection.addSubview(originPortraitChoice)

        originPortraitPreview.setTitle("Posts", for: .normal)
        originPortraitPreview.tag = 0
        originPortraitPreview.addTarget(self, action: #selector(originPortraitTrigger(_:)), for: .touchUpInside)
        originPortraitTrigger.setTitle("Diary", for: .normal)
        originPortraitTrigger.tag = 1
        originPortraitTrigger.addTarget(self, action: #selector(originPortraitTrigger(_:)), for: .touchUpInside)
        [originPortraitPreview, originPortraitTrigger].forEach { coffeeBulletinCanvas in
            coffeeBulletinCanvas.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            originPortraitChoice.addArrangedSubview(coffeeBulletinCanvas)
        }
        originPortraitLayout.backgroundColor = ChovviRoastedProfile.discoveryShelfCanvas
        originPortraitLayout.translatesAutoresizingMaskIntoConstraints = false
        originPortraitSelection.addSubview(originPortraitLayout)
        NSLayoutConstraint.activate([
            originPortraitImage.topAnchor.constraint(equalTo: originPortraitSelection.topAnchor), originPortraitImage.leadingAnchor.constraint(equalTo: originPortraitSelection.leadingAnchor, constant: 12), originPortraitImage.trailingAnchor.constraint(equalTo: originPortraitSelection.trailingAnchor, constant: -12),
            originPortraitImage.heightAnchor.constraint(equalToConstant: 50), originPortraitChoice.topAnchor.constraint(equalTo: originPortraitImage.bottomAnchor, constant: 8), originPortraitChoice.leadingAnchor.constraint(equalTo: originPortraitSelection.leadingAnchor),
            originPortraitChoice.trailingAnchor.constraint(equalTo: originPortraitSelection.trailingAnchor), originPortraitChoice.heightAnchor.constraint(equalToConstant: 44), originPortraitLayout.bottomAnchor.constraint(equalTo: originPortraitSelection.bottomAnchor),
            originPortraitLayout.heightAnchor.constraint(equalToConstant: 2), originPortraitLayout.widthAnchor.constraint(equalTo: originPortraitSelection.widthAnchor, multiplier: 0.5), originPortraitLayout.leadingAnchor.constraint(equalTo: originPortraitSelection.leadingAnchor)
        ])
        return originPortraitSelection
    }

    private func originPortraitUpdate() { originPortraitUpdateTrigger() }

    private lazy var originPortraitUpdateTrigger: () -> Void = { [unowned self] in
        originPortraitStack.arrangedSubviews.forEach { originPortraitDestination in
            originPortraitStack.removeArrangedSubview(originPortraitDestination)
            originPortraitDestination.removeFromSuperview()
        }
        if originPortraitState == 0 {
            if originPortraitArtwork.isEmpty {
                let originPortraitDestination = UILabel()
                originPortraitDestination.text = "No posts yet."
                originPortraitDestination.textColor = .secondaryLabel
                originPortraitDestination.textAlignment = .center
                originPortraitDestination.heightAnchor.constraint(equalToConstant: 100).isActive = true
                originPortraitStack.addArrangedSubview(originPortraitDestination)
            } else {
                var originPortraitDestination = 0
                while originPortraitDestination < originPortraitArtwork.count {
                    let originPortraitCard = UIStackView()
                    originPortraitCard.axis = .horizontal
                    originPortraitCard.distribution = .fillEqually
                    originPortraitCard.spacing = 8
                    for originPortraitRecord in 0..<3 {
                        let originPortraitItem = originPortraitDestination + originPortraitRecord
                        if originPortraitItem < originPortraitArtwork.count {
                            let originPortraitSelection = UIImageView(image: originPortraitImage(originPortraitArtwork[originPortraitItem]))
                            originPortraitSelection.contentMode = .scaleAspectFill
                            originPortraitSelection.clipsToBounds = true
                            originPortraitSelection.layer.cornerRadius = 8
                            originPortraitSelection.heightAnchor.constraint(equalTo: originPortraitSelection.widthAnchor).isActive = true
                            originPortraitCard.addArrangedSubview(originPortraitSelection)
                        } else {
                            originPortraitCard.addArrangedSubview(UIView())
                        }
                    }
                    originPortraitStack.addArrangedSubview(originPortraitCard)
                    originPortraitDestination += 3
                }
            }
        } else if originPortraitCollection.isEmpty {
            let originPortraitDestination = UILabel()
            originPortraitDestination.text = "No diary moments yet."
            originPortraitDestination.textColor = .secondaryLabel
            originPortraitDestination.textAlignment = .center
            originPortraitDestination.heightAnchor.constraint(equalToConstant: 100).isActive = true
            originPortraitStack.addArrangedSubview(originPortraitDestination)
        } else {
            originPortraitCollection.forEach { originPortraitDestination in
                originPortraitStack.addArrangedSubview(originPortraitState(originPortraitDestination))
            }
        }
        originPortraitStack.isLayoutMarginsRelativeArrangement = true
        originPortraitStack.layoutMargins = UIEdgeInsets(top: 10, left: 16, bottom: 20, right: 16)
    }

    private func originPortraitState(_ originPortraitDestination: ChovviSilkyProfile) -> UIView {
        originPortraitStateTrigger(originPortraitDestination)
    }

    private lazy var originPortraitStateTrigger: (ChovviSilkyProfile) -> UIView = { [unowned self] originPortraitDestination in
        let originPortraitCard = UIView()
        originPortraitCard.backgroundColor = UIColor(red: 0.93, green: 0.95, blue: 0.96, alpha: 1)
        originPortraitCard.layer.cornerRadius = 12
        originPortraitCard.heightAnchor.constraint(equalToConstant: 108).isActive = true
        let originPortraitRecord = UIImageView()
        originPortraitRecord.contentMode = .scaleAspectFill
        originPortraitRecord.clipsToBounds = true
        originPortraitRecord.layer.cornerRadius = 10
        originPortraitRecord.backgroundColor = .systemGray5
        originPortraitRecord.translatesAutoresizingMaskIntoConstraints = false
        originPortraitCard.addSubview(originPortraitRecord)
        self.originPortraitRecord(originPortraitDestination.chovviSilkyAftertaste, originPortraitItem: originPortraitRecord)

        let originPortraitItem = UILabel()
        originPortraitItem.text = originPortraitDestination.chovviSilkyAroma
        originPortraitItem.textColor = ChovviRoastedProfile.discoveryShelfScroll
        originPortraitItem.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        originPortraitItem.numberOfLines = 3
        originPortraitItem.translatesAutoresizingMaskIntoConstraints = false
        originPortraitCard.addSubview(originPortraitItem)

        let originPortraitSelection = UILabel()
        originPortraitSelection.text = "\(originPortraitCanvas.chovviBotanicalAeropress)  ·  \(originPortraitDestination.chovviSilkyBrewer)"
        originPortraitSelection.textColor = .secondaryLabel
        originPortraitSelection.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        originPortraitSelection.translatesAutoresizingMaskIntoConstraints = false
        originPortraitCard.addSubview(originPortraitSelection)

        let originPortraitImage = UIImageView(image: UIImage(named: ChovviCitrusProfile.roastArchiveCard(originPortraitDestination.chovviSilkyBurr)))
        originPortraitImage.contentMode = .scaleAspectFit
        originPortraitImage.translatesAutoresizingMaskIntoConstraints = false
        originPortraitCard.addSubview(originPortraitImage)

        let originPortraitChoice = UIButton(type: .system)
        originPortraitChoice.setImage(UIImage(systemName: "arrow.up.right"), for: .normal)
        originPortraitChoice.tintColor = .white
        originPortraitChoice.backgroundColor = ChovviRoastedProfile.discoveryShelfScroll
        originPortraitChoice.layer.cornerRadius = 18
        originPortraitChoice.addAction(UIAction { [weak self] coffeeBulletinCanvas in
            _ = coffeeBulletinCanvas
            let coffeeBulletinScroll = ChovviOriginProfile(cupChronicleCanvas: originPortraitDestination)
            let coffeeBulletinHeader = UINavigationController(rootViewController: coffeeBulletinScroll)
            coffeeBulletinHeader.modalPresentationStyle = .fullScreen
            self?.present(coffeeBulletinHeader, animated: true)
        }, for: .touchUpInside)
        originPortraitChoice.translatesAutoresizingMaskIntoConstraints = false
        originPortraitCard.addSubview(originPortraitChoice)
        NSLayoutConstraint.activate([
            originPortraitRecord.leadingAnchor.constraint(equalTo: originPortraitCard.leadingAnchor, constant: 8), originPortraitRecord.topAnchor.constraint(equalTo: originPortraitCard.topAnchor, constant: 8), originPortraitRecord.bottomAnchor.constraint(equalTo: originPortraitCard.bottomAnchor, constant: -8),
            originPortraitRecord.widthAnchor.constraint(equalTo: originPortraitRecord.heightAnchor), originPortraitItem.leadingAnchor.constraint(equalTo: originPortraitRecord.trailingAnchor, constant: 10), originPortraitItem.topAnchor.constraint(equalTo: originPortraitCard.topAnchor, constant: 10),
            originPortraitItem.trailingAnchor.constraint(equalTo: originPortraitCard.trailingAnchor, constant: -42), originPortraitSelection.leadingAnchor.constraint(equalTo: originPortraitItem.leadingAnchor), originPortraitSelection.bottomAnchor.constraint(equalTo: originPortraitCard.bottomAnchor, constant: -12),
            originPortraitSelection.trailingAnchor.constraint(lessThanOrEqualTo: originPortraitImage.leadingAnchor, constant: -5), originPortraitImage.trailingAnchor.constraint(equalTo: originPortraitChoice.leadingAnchor, constant: -8), originPortraitImage.centerYAnchor.constraint(equalTo: originPortraitSelection.centerYAnchor),
            originPortraitChoice.trailingAnchor.constraint(equalTo: originPortraitCard.trailingAnchor, constant: -8), originPortraitChoice.bottomAnchor.constraint(equalTo: originPortraitCard.bottomAnchor, constant: -8), originPortraitChoice.widthAnchor.constraint(equalToConstant: 36),
            originPortraitChoice.heightAnchor.constraint(equalTo: originPortraitChoice.widthAnchor)
        ])
        return originPortraitCard
    }

    private func originPortraitDestination() {
        let originPortraitCard = Set(UserDefaults.standard.stringArray(forKey: "chovviCremaRoast") ?? [])
        let coffeeBulletinRecord = originPortraitCard.contains(originPortraitCanvas.chovviBotanicalAcidity)
        originPortraitStatus.setTitle(coffeeBulletinRecord ? "Following" : "Follow", for: .normal)
        originPortraitStatus.setTitleColor(coffeeBulletinRecord ? ChovviRoastedProfile.discoveryShelfCanvas : .white, for: .normal)
        originPortraitStatus.backgroundColor = coffeeBulletinRecord ? .clear : ChovviRoastedProfile.discoveryShelfCanvas

        let originPortraitItem = originPortraitRecord(originPortraitCanvas.chovviBotanicalAcidity)
        let originPortraitSelection = min(9, originPortraitItem + (coffeeBulletinRecord ? 1 : 0))
        let originPortraitImage = min(9, max(1, originPortraitCanvas.chovviBotanicalBurr.count))
        originPortraitRender.text = "\(originPortraitArtwork.count)\nPosts"
        originPortraitAction.text = "\(originPortraitSelection)\nFollowers"
        originPortraitLabel.text = "\(originPortraitImage)\nFollowing"

        let originPortraitChoice = originPortraitState == 0
        originPortraitPreview.setTitleColor(originPortraitChoice ? ChovviRoastedProfile.discoveryShelfCanvas : .secondaryLabel, for: .normal)
        originPortraitTrigger.setTitleColor(originPortraitChoice ? .secondaryLabel : ChovviRoastedProfile.discoveryShelfCanvas, for: .normal)
        originPortraitLayout.transform = CGAffineTransform(translationX: originPortraitChoice ? 0 : view.bounds.width * 0.5, y: 0)
    }

    @objc private func originPortraitTrigger(_ originPortraitDestination: UIButton) {
        originPortraitState = originPortraitDestination.tag
        UIView.animate(withDuration: 0.22) { [weak self] in self?.originPortraitDestination() }
        originPortraitUpdate()
    }

    @objc private func coffeeBulletinStatus() {
        guard coffeeBulletinRecord(coffeeBulletinItem: true) else { return }
        originPortraitSelection()
    }

    private func originPortraitSelection() {
        var originPortraitImage = Set(UserDefaults.standard.stringArray(forKey: "chovviCremaRoast") ?? [])
        if originPortraitImage.contains(originPortraitCanvas.chovviBotanicalAcidity) {
            originPortraitImage.remove(originPortraitCanvas.chovviBotanicalAcidity)
        } else {
            originPortraitImage.insert(originPortraitCanvas.chovviBotanicalAcidity)
        }
        UserDefaults.standard.set(Array(originPortraitImage), forKey: "chovviCremaRoast")
        originPortraitDestination()
    }

    @objc private func coffeeBulletinStack() {
        guard coffeeBulletinRecord(coffeeBulletinItem: true) else { return }
        let originPortraitImage = Set(UserDefaults.standard.stringArray(forKey: "chovviCremaRoast") ?? [])
        let originPortraitChoice = originPortraitImage.contains(originPortraitCanvas.chovviBotanicalAcidity)
        let coffeeBulletinCanvas = originPortraitCanvas.chovviBotanicalBurr.contains("chovvi-user-20")
        originPortraitRecord(originPortraitItem: originPortraitChoice && coffeeBulletinCanvas)
    }

    private func originPortraitRecord(originPortraitItem: Bool) {
        originPortraitRecordLayout(originPortraitItem)
    }

    private lazy var originPortraitRecordLayout: (Bool) -> Void = { [unowned self] originPortraitItem in
        let originPortraitSelection = UIControl()
        originPortraitSelection.backgroundColor = UIColor.black.withAlphaComponent(0.52)
        originPortraitSelection.addTarget(self, action: #selector(originPortraitRoute(_:)), for: .touchUpInside)
        originPortraitSelection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(originPortraitSelection)

        let originPortraitImage = UIView()
        originPortraitImage.backgroundColor = .white
        originPortraitImage.layer.cornerRadius = 20
        originPortraitImage.translatesAutoresizingMaskIntoConstraints = false
        originPortraitSelection.addSubview(originPortraitImage)

        let originPortraitChoice = UIImageView(image: UIImage(systemName: originPortraitItem ? "lock.open.fill" : "lock.fill"))
        originPortraitChoice.tintColor = UIColor(red: 0.94, green: 0.60, blue: 0.05, alpha: 1)
        originPortraitChoice.contentMode = .scaleAspectFit
        originPortraitChoice.translatesAutoresizingMaskIntoConstraints = false
        originPortraitImage.addSubview(originPortraitChoice)

        let coffeeBulletinCanvas = UILabel()
        coffeeBulletinCanvas.text = originPortraitItem ? "You Follow Each Other" : "Follow Each Other to Message"
        coffeeBulletinCanvas.textColor = ChovviRoastedProfile.discoveryShelfScroll
        coffeeBulletinCanvas.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        coffeeBulletinCanvas.textAlignment = .center
        coffeeBulletinCanvas.translatesAutoresizingMaskIntoConstraints = false
        originPortraitImage.addSubview(coffeeBulletinCanvas)

        let coffeeBulletinScroll = UILabel()
        coffeeBulletinScroll.text = originPortraitItem
            ? "You both follow each other. This connection is ready."
            : "You can only send messages to users who follow you back. Follow them first and wait for a follow back."
        coffeeBulletinScroll.textColor = .secondaryLabel
        coffeeBulletinScroll.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        coffeeBulletinScroll.textAlignment = .center
        coffeeBulletinScroll.numberOfLines = 0
        coffeeBulletinScroll.translatesAutoresizingMaskIntoConstraints = false
        originPortraitImage.addSubview(coffeeBulletinScroll)

        let coffeeBulletinHeader = UIButton(type: .system)
        let coffeeBulletinArtwork = Set(UserDefaults.standard.stringArray(forKey: "chovviCremaRoast") ?? []).contains(originPortraitCanvas.chovviBotanicalAcidity)
        coffeeBulletinHeader.setTitle(originPortraitItem ? "Got It" : (coffeeBulletinArtwork ? "Waiting for Follow Back" : "Follow"), for: .normal)
        coffeeBulletinHeader.setTitleColor(.white, for: .normal)
        coffeeBulletinHeader.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        coffeeBulletinHeader.backgroundColor = UIColor(red: 0.94, green: 0.60, blue: 0.05, alpha: 1)
        coffeeBulletinHeader.layer.cornerRadius = 21
        coffeeBulletinHeader.addAction(UIAction { [weak self, weak originPortraitSelection] coffeeBulletinCollection in
            _ = coffeeBulletinCollection
            if !originPortraitItem && !coffeeBulletinArtwork { self?.originPortraitSelection() }
            originPortraitSelection?.removeFromSuperview()
        }, for: .touchUpInside)
        coffeeBulletinHeader.translatesAutoresizingMaskIntoConstraints = false
        originPortraitImage.addSubview(coffeeBulletinHeader)
        NSLayoutConstraint.activate([
            originPortraitSelection.topAnchor.constraint(equalTo: view.topAnchor), originPortraitSelection.leadingAnchor.constraint(equalTo: view.leadingAnchor), originPortraitSelection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            originPortraitSelection.bottomAnchor.constraint(equalTo: view.bottomAnchor), originPortraitImage.centerYAnchor.constraint(equalTo: originPortraitSelection.centerYAnchor), originPortraitImage.leadingAnchor.constraint(equalTo: originPortraitSelection.leadingAnchor, constant: 28),
            originPortraitImage.trailingAnchor.constraint(equalTo: originPortraitSelection.trailingAnchor, constant: -28), originPortraitChoice.topAnchor.constraint(equalTo: originPortraitImage.topAnchor, constant: 24), originPortraitChoice.centerXAnchor.constraint(equalTo: originPortraitImage.centerXAnchor),
            originPortraitChoice.widthAnchor.constraint(equalToConstant: 52), originPortraitChoice.heightAnchor.constraint(equalToConstant: 52), coffeeBulletinCanvas.topAnchor.constraint(equalTo: originPortraitChoice.bottomAnchor, constant: 14),
            coffeeBulletinCanvas.leadingAnchor.constraint(equalTo: originPortraitImage.leadingAnchor, constant: 18), coffeeBulletinCanvas.trailingAnchor.constraint(equalTo: originPortraitImage.trailingAnchor, constant: -18), coffeeBulletinScroll.topAnchor.constraint(equalTo: coffeeBulletinCanvas.bottomAnchor, constant: 12),
            coffeeBulletinScroll.leadingAnchor.constraint(equalTo: originPortraitImage.leadingAnchor, constant: 24), coffeeBulletinScroll.trailingAnchor.constraint(equalTo: originPortraitImage.trailingAnchor, constant: -24), coffeeBulletinHeader.topAnchor.constraint(equalTo: coffeeBulletinScroll.bottomAnchor, constant: 20),
            coffeeBulletinHeader.leadingAnchor.constraint(equalTo: originPortraitImage.leadingAnchor, constant: 20), coffeeBulletinHeader.trailingAnchor.constraint(equalTo: originPortraitImage.trailingAnchor, constant: -20), coffeeBulletinHeader.heightAnchor.constraint(equalToConstant: 42),
            coffeeBulletinHeader.bottomAnchor.constraint(equalTo: originPortraitImage.bottomAnchor, constant: -20)
        ])
    }

    private func coffeeBulletinRecord(coffeeBulletinItem: Bool) -> Bool {
        _ = coffeeBulletinItem
        return tastingReplySelection()
    }

    @objc private func coffeeBulletinHeader(_ coffeeBulletinScroll: UIButton) {
        guard coffeeBulletinRecord(coffeeBulletinItem: true) else { return }
        let coffeeBulletinCanvas = UIAlertController(
            title: originPortraitCanvas.chovviBotanicalAeropress,
            message: "Choose a safety action for this profile.",
            preferredStyle: .actionSheet
        )
        coffeeBulletinCanvas.addAction(UIAlertAction(title: "Report", style: .default) { [weak self] coffeeBulletinArtwork in
            _ = coffeeBulletinArtwork
            self?.coffeeBulletinArtwork(false)
        })
        coffeeBulletinCanvas.addAction(UIAlertAction(title: "Block", style: .destructive) { [weak self] coffeeBulletinArtwork in
            _ = coffeeBulletinArtwork
            self?.coffeeBulletinArtwork(true)
        })
        coffeeBulletinCanvas.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        coffeeBulletinCanvas.popoverPresentationController?.sourceView = coffeeBulletinScroll
        coffeeBulletinCanvas.popoverPresentationController?.sourceRect = coffeeBulletinScroll.bounds
        present(coffeeBulletinCanvas, animated: true)
    }

    private func coffeeBulletinArtwork(_ coffeeBulletinCollection: Bool) {
        if !coffeeBulletinCollection {
            let coffeeBulletinCanvas = ChovviCuppingReportProfile(
                cupKeeperCanvas: originPortraitCanvas.chovviBotanicalAeropress,
                cupKeeperScroll: originPortraitCanvas.chovviBotanicalAcidity,
                cupKeeperHeader: "profile"
            ) { [weak self] in
                guard let self else { return }
                var coffeeBulletinScroll = Set(UserDefaults.standard.stringArray(forKey: "chovviCraftedTasting") ?? [])
                coffeeBulletinScroll.insert(self.originPortraitCanvas.chovviBotanicalAcidity)
                UserDefaults.standard.set(Array(coffeeBulletinScroll), forKey: "chovviCraftedTasting")
            }
            present(coffeeBulletinCanvas, animated: true)
            return
        }
        let coffeeBulletinCanvas = coffeeBulletinCollection ? "chovviCraftedRoast" : "chovviCraftedTasting"
        var coffeeBulletinScroll = Set(UserDefaults.standard.stringArray(forKey: coffeeBulletinCanvas) ?? [])
        coffeeBulletinScroll.insert(originPortraitCanvas.chovviBotanicalAcidity)
        UserDefaults.standard.set(Array(coffeeBulletinScroll), forKey: coffeeBulletinCanvas)

        ChovviThermalAlertView.goldenRitualSelection(self, goldenRitualChoice: coffeeBulletinCollection ? "User Blocked" : "Report Received", goldenRitualCanvas: coffeeBulletinCollection ? "This user has been added to your blocked list." : "Thank you. This profile has been submitted for safety review.", goldenRitualArtwork: .success, goldenRitualStack: { [weak self] in
            if coffeeBulletinCollection {
                self?.navigationController?.dismiss(animated: true)
            }
        })
    }

    private func originPortraitImage(_ originPortraitItem: String) -> UIImage? {
        originPortraitItem.hasPrefix("/") ? UIImage(contentsOfFile: originPortraitItem) : UIImage(named: originPortraitItem)
    }

    private func originPortraitRecord(_ originPortraitSelection: String, originPortraitItem: UIImageView) {
        let originPortraitImage = originPortraitSelection.hasPrefix("/")
            ? URL(fileURLWithPath: originPortraitSelection)
            : Bundle.main.url(forResource: originPortraitSelection, withExtension: "mp4")
        guard let originPortraitImage else { return }
        let originPortraitChoice = AVAssetImageGenerator(asset: AVURLAsset(url: originPortraitImage))
        originPortraitChoice.appliesPreferredTrackTransform = true
        originPortraitChoice.maximumSize = CGSize(width: 360, height: 360)
        coffeeBulletinSource.append(originPortraitChoice)
        let coffeeBulletinCanvas = NSValue(time: CMTime(seconds: 0.1, preferredTimescale: 600))
        originPortraitChoice.generateCGImagesAsynchronously(forTimes: [coffeeBulletinCanvas]) { [weak originPortraitItem] _, coffeeBulletinScroll, _, coffeeBulletinHeader, _ in
            guard coffeeBulletinHeader == .succeeded, let coffeeBulletinScroll else { return }
            DispatchQueue.main.async {
                originPortraitItem?.image = UIImage(cgImage: coffeeBulletinScroll)
            }
        }
    }

    private func originPortraitRecord(_ originPortraitItem: String) -> Int {
        let originPortraitSelection = Int(originPortraitItem.components(separatedBy: "-").last ?? "1") ?? 1
        return 1 + ((originPortraitSelection * 3) % 8)
    }

    @objc private func originPortraitRoute(_ originPortraitItem: UIControl) {
        originPortraitItem.removeFromSuperview()
    }

    @objc private func originPortraitChoice() {
        navigationController?.dismiss(animated: true)
    }
}
