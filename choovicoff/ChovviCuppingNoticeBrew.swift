import UIKit

struct ChovviCuppingTexture: Codable, Hashable {
    let cupKeeperCanvas: String
    let cupKeeperScroll: String
    let cupKeeperHeader: String
    let cupKeeperArtwork: String
    let cupKeeperCollection: String
    let cupKeeperStack: Date

    private enum CodingKeys: String, CodingKey {
        case cupKeeperCanvas = "chovviCuppingAcidity"
        case cupKeeperScroll = "chovviCuppingAeropress"
        case cupKeeperHeader = "chovviCuppingAftertaste"
        case cupKeeperArtwork = "chovviCuppingAroma"
        case cupKeeperCollection = "chovviCuppingBatch"
        case cupKeeperStack = "chovviCuppingBloom"
    }
}

final class ChovviCuppingNoticeBrew: UIViewController, UITextViewDelegate {
    private let cupKeeperCanvas: String
    private let cupKeeperScroll: String
    private let cupKeeperHeader: String
    private let cupKeeperArtwork: () -> Void
    private let cupKeeperCollection = UIScrollView()
    private let cupKeeperStack = UIStackView()
    private let cupKeeperState = UITextView()
    private let cupKeeperRender = UILabel()
    private let cupKeeperAction = UILabel()
    private let cupKeeperLabel = UIButton(type: .system)
    private var cupKeeperStatus: [UIButton] = []
    private var cupKeeperRoute: Int?

    private let cupKeeperSection = [
        "Harassment or bullying",
        "Hate or abusive conduct",
        "Sexual or inappropriate content",
        "Spam or misleading content",
        "Privacy or impersonation",
        "Other safety concern"
    ]

    private static let cupKeeperPreview = UIColor(red: 0.83, green: 0.60, blue: 0.31, alpha: 1)
    private static let cupKeeperTrigger = UIColor(red: 0.99, green: 0.96, blue: 0.91, alpha: 1)
    private static let cupKeeperLayout = UIColor(red: 0.15, green: 0.15, blue: 0.20, alpha: 1)

    init(
        cupKeeperCanvas: String,
        cupKeeperScroll: String,
        cupKeeperHeader: String,
        cupKeeperArtwork: @escaping () -> Void = {}
    ) {
        self.cupKeeperCanvas = cupKeeperCanvas
        self.cupKeeperScroll = cupKeeperScroll
        self.cupKeeperHeader = cupKeeperHeader
        self.cupKeeperArtwork = cupKeeperArtwork
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .pageSheet
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        cupKeeperSource()
        cupKeeperMenu()
        cupKeeperUpdate()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIAccessibility.post(notification: .screenChanged, argument: cupKeeperRender)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func cupKeeperSource() { cupKeeperSourceTrigger() }

    private lazy var cupKeeperSourceTrigger: () -> Void = { [unowned self] in
        view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.97, alpha: 1)
        sheetPresentationController?.detents = [.medium(), .large()]
        sheetPresentationController?.selectedDetentIdentifier = .large
        sheetPresentationController?.prefersGrabberVisible = true
        sheetPresentationController?.preferredCornerRadius = 28
        sheetPresentationController?.prefersScrollingExpandsWhenScrolledToEdge = false

        let cupKeeperDestination = UIButton(type: .system)
        cupKeeperDestination.setImage(UIImage(systemName: "xmark"), for: .normal)
        cupKeeperDestination.tintColor = Self.cupKeeperLayout
        cupKeeperDestination.backgroundColor = UIColor.systemGray6
        cupKeeperDestination.layer.cornerRadius = 18
        cupKeeperDestination.accessibilityLabel = "Close report"
        cupKeeperDestination.addTarget(self, action: #selector(cupKeeperCard), for: .touchUpInside)
        cupKeeperDestination.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cupKeeperDestination)

        let cupKeeperRecord = UILabel()
        cupKeeperRecord.text = "Report"
        cupKeeperRecord.font = .systemFont(ofSize: 20, weight: .bold)
        cupKeeperRecord.textColor = Self.cupKeeperLayout
        cupKeeperRecord.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cupKeeperRecord)

        cupKeeperLabel.setTitle("Submit Report", for: .normal)
        cupKeeperLabel.setTitleColor(.white, for: .normal)
        cupKeeperLabel.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        cupKeeperLabel.backgroundColor = Self.cupKeeperPreview
        cupKeeperLabel.layer.cornerRadius = 25
        cupKeeperLabel.alpha = 0.48
        cupKeeperLabel.isEnabled = false
        cupKeeperLabel.addTarget(self, action: #selector(cupKeeperItem), for: .touchUpInside)
        cupKeeperLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cupKeeperLabel)

        cupKeeperCollection.alwaysBounceVertical = true
        cupKeeperCollection.showsVerticalScrollIndicator = false
        cupKeeperCollection.keyboardDismissMode = .interactive
        cupKeeperCollection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cupKeeperCollection)

        cupKeeperStack.axis = .vertical
        cupKeeperStack.spacing = 12
        cupKeeperStack.translatesAutoresizingMaskIntoConstraints = false
        cupKeeperCollection.addSubview(cupKeeperStack)

        NSLayoutConstraint.activate([
            cupKeeperDestination.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10), cupKeeperDestination.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), cupKeeperDestination.widthAnchor.constraint(equalToConstant: 36),
            cupKeeperDestination.heightAnchor.constraint(equalTo: cupKeeperDestination.widthAnchor), cupKeeperRecord.centerXAnchor.constraint(equalTo: view.centerXAnchor), cupKeeperRecord.centerYAnchor.constraint(equalTo: cupKeeperDestination.centerYAnchor),
             cupKeeperLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), cupKeeperLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cupKeeperLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12), cupKeeperLabel.heightAnchor.constraint(equalToConstant: 50), 
            cupKeeperCollection.topAnchor.constraint(equalTo: cupKeeperDestination.bottomAnchor, constant: 12), cupKeeperCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor), cupKeeperCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cupKeeperCollection.bottomAnchor.constraint(equalTo: cupKeeperLabel.topAnchor, constant: -10), cupKeeperStack.topAnchor.constraint(equalTo: cupKeeperCollection.contentLayoutGuide.topAnchor), cupKeeperStack.leadingAnchor.constraint(equalTo: cupKeeperCollection.contentLayoutGuide.leadingAnchor, constant: 20),
            cupKeeperStack.trailingAnchor.constraint(equalTo: cupKeeperCollection.contentLayoutGuide.trailingAnchor, constant: -20), cupKeeperStack.bottomAnchor.constraint(equalTo: cupKeeperCollection.contentLayoutGuide.bottomAnchor, constant: -18), cupKeeperStack.widthAnchor.constraint(equalTo: cupKeeperCollection.frameLayoutGuide.widthAnchor, constant: -40)
        ])
    }

    private func cupKeeperMenu() { cupKeeperMenuTrigger() }

    private lazy var cupKeeperMenuTrigger: () -> Void = { [unowned self] in
        let cupKeeperDestination = UIView()
        cupKeeperDestination.backgroundColor = Self.cupKeeperTrigger
        cupKeeperDestination.layer.cornerRadius = 22
        cupKeeperDestination.translatesAutoresizingMaskIntoConstraints = false

        let cupKeeperCard = UIImageView(image: UIImage(systemName: "shield.lefthalf.filled"))
        cupKeeperCard.tintColor = Self.cupKeeperPreview
        cupKeeperCard.contentMode = .scaleAspectFit
        cupKeeperCard.translatesAutoresizingMaskIntoConstraints = false
        cupKeeperDestination.addSubview(cupKeeperCard)

        cupKeeperRender.text = "Help keep Choovi welcoming"
        cupKeeperRender.font = .systemFont(ofSize: 20, weight: .bold)
        cupKeeperRender.textColor = Self.cupKeeperLayout
        cupKeeperRender.numberOfLines = 0
        cupKeeperRender.translatesAutoresizingMaskIntoConstraints = false
        cupKeeperDestination.addSubview(cupKeeperRender)

        let cupKeeperRecord = UILabel()
        cupKeeperRecord.text = "Tell us what happened with \(cupKeeperCanvas). Your report is private and helps support respectful coffee sharing."
        cupKeeperRecord.font = .systemFont(ofSize: 13, weight: .regular)
        cupKeeperRecord.textColor = .secondaryLabel
        cupKeeperRecord.numberOfLines = 0
        cupKeeperRecord.translatesAutoresizingMaskIntoConstraints = false
        cupKeeperDestination.addSubview(cupKeeperRecord)

        NSLayoutConstraint.activate([
            cupKeeperDestination.heightAnchor.constraint(greaterThanOrEqualToConstant: 126), cupKeeperCard.leadingAnchor.constraint(equalTo: cupKeeperDestination.leadingAnchor, constant: 16), cupKeeperCard.topAnchor.constraint(equalTo: cupKeeperDestination.topAnchor, constant: 18),
            cupKeeperCard.widthAnchor.constraint(equalToConstant: 38), cupKeeperCard.heightAnchor.constraint(equalTo: cupKeeperCard.widthAnchor), cupKeeperRender.leadingAnchor.constraint(equalTo: cupKeeperCard.trailingAnchor, constant: 12),
            cupKeeperRender.trailingAnchor.constraint(equalTo: cupKeeperDestination.trailingAnchor, constant: -16), cupKeeperRender.topAnchor.constraint(equalTo: cupKeeperDestination.topAnchor, constant: 18), cupKeeperRecord.leadingAnchor.constraint(equalTo: cupKeeperRender.leadingAnchor),
            cupKeeperRecord.trailingAnchor.constraint(equalTo: cupKeeperRender.trailingAnchor), cupKeeperRecord.topAnchor.constraint(equalTo: cupKeeperRender.bottomAnchor, constant: 6), cupKeeperRecord.bottomAnchor.constraint(equalTo: cupKeeperDestination.bottomAnchor, constant: -16)
        ])
        cupKeeperStack.addArrangedSubview(cupKeeperDestination)

        let cupKeeperItem = cupKeeperSelection("Choose a reason")
        cupKeeperStack.addArrangedSubview(cupKeeperItem)

        for (cupKeeperSelection, cupKeeperImage) in cupKeeperSection.enumerated() {
            let cupKeeperChoice = UIButton(type: .system)
            var cupKeeperRecord = UIButton.Configuration.plain()
            cupKeeperRecord.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 14)
            cupKeeperRecord.imagePadding = 4
            cupKeeperChoice.configuration = cupKeeperRecord
            cupKeeperChoice.tag = cupKeeperSelection
            cupKeeperChoice.setTitle(cupKeeperImage, for: .normal)
            cupKeeperChoice.setTitleColor(Self.cupKeeperLayout, for: .normal)
            cupKeeperChoice.setImage(UIImage(systemName: "circle"), for: .normal)
            cupKeeperChoice.tintColor = UIColor.systemGray3
            cupKeeperChoice.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
            cupKeeperChoice.contentHorizontalAlignment = .leading
            cupKeeperChoice.backgroundColor = .white
            cupKeeperChoice.layer.cornerRadius = 14
            cupKeeperChoice.layer.borderWidth = 1
            cupKeeperChoice.layer.borderColor = UIColor.systemGray5.cgColor
            cupKeeperChoice.heightAnchor.constraint(equalToConstant: 50).isActive = true
            cupKeeperChoice.addTarget(self, action: #selector(cupKeeperImage(_:)), for: .touchUpInside)
            cupKeeperStatus.append(cupKeeperChoice)
            cupKeeperStack.addArrangedSubview(cupKeeperChoice)
        }

        let cupKeeperChoice = cupKeeperSelection("Add details (optional)")
        cupKeeperStack.addArrangedSubview(cupKeeperChoice)
        cupKeeperStack.setCustomSpacing(6, after: cupKeeperChoice)

        let cupKeeperSelection = UIView()
        cupKeeperSelection.backgroundColor = .white
        cupKeeperSelection.layer.cornerRadius = 16
        cupKeeperSelection.layer.borderWidth = 1
        cupKeeperSelection.layer.borderColor = UIColor.systemGray5.cgColor
        cupKeeperSelection.translatesAutoresizingMaskIntoConstraints = false
        cupKeeperSelection.heightAnchor.constraint(equalToConstant: 130).isActive = true

        cupKeeperState.backgroundColor = .clear
        cupKeeperState.font = .systemFont(ofSize: 15)
        cupKeeperState.textColor = Self.cupKeeperLayout
        cupKeeperState.delegate = self
        cupKeeperState.translatesAutoresizingMaskIntoConstraints = false
        cupKeeperSelection.addSubview(cupKeeperState)

        cupKeeperAction.text = "Share useful context without including sensitive personal information."
        cupKeeperAction.font = .systemFont(ofSize: 14)
        cupKeeperAction.textColor = UIColor.systemGray2
        cupKeeperAction.numberOfLines = 0
        cupKeeperAction.translatesAutoresizingMaskIntoConstraints = false
        cupKeeperSelection.addSubview(cupKeeperAction)

        let cupKeeperImage = UILabel()
        cupKeeperImage.text = "0/300"
        cupKeeperImage.font = .systemFont(ofSize: 12, weight: .medium)
        cupKeeperImage.textColor = .secondaryLabel
        cupKeeperImage.translatesAutoresizingMaskIntoConstraints = false
        cupKeeperSelection.addSubview(cupKeeperImage)
        cupKeeperState.accessibilityIdentifier = "chovviCuppingBody"
        cupKeeperImage.accessibilityIdentifier = "chovviCuppingTexture"

        NSLayoutConstraint.activate([
            cupKeeperState.topAnchor.constraint(equalTo: cupKeeperSelection.topAnchor, constant: 8), cupKeeperState.leadingAnchor.constraint(equalTo: cupKeeperSelection.leadingAnchor, constant: 10), cupKeeperState.trailingAnchor.constraint(equalTo: cupKeeperSelection.trailingAnchor, constant: -10),
            cupKeeperState.bottomAnchor.constraint(equalTo: cupKeeperImage.topAnchor, constant: -3), cupKeeperAction.topAnchor.constraint(equalTo: cupKeeperState.topAnchor, constant: 8), cupKeeperAction.leadingAnchor.constraint(equalTo: cupKeeperState.leadingAnchor, constant: 5),
            cupKeeperAction.trailingAnchor.constraint(lessThanOrEqualTo: cupKeeperState.trailingAnchor, constant: -5), cupKeeperImage.trailingAnchor.constraint(equalTo: cupKeeperSelection.trailingAnchor, constant: -12), cupKeeperImage.bottomAnchor.constraint(equalTo: cupKeeperSelection.bottomAnchor, constant: -9)
        ])
        cupKeeperStack.addArrangedSubview(cupKeeperSelection)

        let cupKeeperImageNote = UILabel()
        cupKeeperImageNote.text = "Reports are submitted for safety review. The reported account is not notified."
        cupKeeperImageNote.font = .systemFont(ofSize: 12)
        cupKeeperImageNote.textColor = .secondaryLabel
        cupKeeperImageNote.numberOfLines = 0
        cupKeeperStack.addArrangedSubview(cupKeeperImageNote)
    }

    private func cupKeeperSelection(_ cupKeeperImage: String) -> UILabel {
        let cupKeeperChoice = UILabel()
        cupKeeperChoice.text = cupKeeperImage
        cupKeeperChoice.font = .systemFont(ofSize: 15, weight: .bold)
        cupKeeperChoice.textColor = Self.cupKeeperLayout
        return cupKeeperChoice
    }

    private func cupKeeperUpdate() {
        NotificationCenter.default.addObserver(self, selector: #selector(cupKeeperDestination(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(cupKeeperRecord(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        let cupKeeperItem = UITapGestureRecognizer(target: self, action: #selector(cupKeeperChoice))
        cupKeeperItem.cancelsTouchesInView = false
        cupKeeperCollection.addGestureRecognizer(cupKeeperItem)
    }

    @objc private func cupKeeperImage(_ cupKeeperChoice: UIButton) {
        cupKeeperRoute = cupKeeperChoice.tag
        for cupKeeperSelection in cupKeeperStatus {
            let cupKeeperImage = cupKeeperSelection === cupKeeperChoice
            cupKeeperSelection.setImage(UIImage(systemName: cupKeeperImage ? "checkmark.circle.fill" : "circle"), for: .normal)
            cupKeeperSelection.tintColor = cupKeeperImage ? Self.cupKeeperPreview : UIColor.systemGray3
            cupKeeperSelection.backgroundColor = cupKeeperImage ? Self.cupKeeperTrigger : .white
            cupKeeperSelection.layer.borderColor = (cupKeeperImage ? Self.cupKeeperPreview : UIColor.systemGray5).cgColor
        }
        cupKeeperLabel.isEnabled = true
        cupKeeperLabel.alpha = 1
    }

    @objc private func cupKeeperItem() {
        guard let cupKeeperRoute else { return }
        let cupKeeperSelection = cupKeeperState.text.trimmingCharacters(in: .whitespacesAndNewlines)
        if cupKeeperRoute == cupKeeperSection.count - 1, cupKeeperSelection.isEmpty {
            cupKeeperTrigger("Add a little detail", cupKeeperTrigger: "Please describe the safety concern so it can be reviewed accurately.")
            cupKeeperState.becomeFirstResponder()
            return
        }
        let cupKeeperImage = ChovviCuppingTexture(
            cupKeeperCanvas: UUID().uuidString,
            cupKeeperScroll: cupKeeperScroll,
            cupKeeperHeader: cupKeeperHeader,
            cupKeeperArtwork: cupKeeperSection[cupKeeperRoute],
            cupKeeperCollection: cupKeeperSelection,
            cupKeeperStack: Date()
        )
        var cupKeeperChoice = cupKeeperStatusEntries()
        cupKeeperChoice.append(cupKeeperImage)
        guard let cupKeeperSource = try? JSONEncoder().encode(cupKeeperChoice) else {
            cupKeeperTrigger("Could not submit", cupKeeperTrigger: "Please retry your report.")
            return
        }
        UserDefaults.standard.set(cupKeeperSource, forKey: "chovviCuppingReviewEntries")
        cupKeeperLabel.isEnabled = false
        cupKeeperArtwork()

        ChovviThermalAlertView.amberRitualSelection(self, amberRitualChoice: "Report Submitted", amberRitualCanvas: "Thank you for helping keep Choovi respectful. This report has been submitted for safety review.", amberRitualArtwork: .success, amberRitualStack: { [weak self] in
            self?.dismiss(animated: true)
        })
    }

    private func cupKeeperStatusEntries() -> [ChovviCuppingTexture] {
        guard let cupKeeperRoute = UserDefaults.standard.data(forKey: "chovviCuppingReviewEntries") else { return [] }
        return (try? JSONDecoder().decode([ChovviCuppingTexture].self, from: cupKeeperRoute)) ?? []
    }

    func textViewDidChange(_ cupKeeperSelection: UITextView) {
        cupKeeperAction.isHidden = !cupKeeperSelection.text.isEmpty
        let cupKeeperImage = cupKeeperStack.arrangedSubviews
            .flatMap(\.subviews)
            .compactMap { $0 as? UILabel }
            .first { $0.accessibilityIdentifier == "chovviCuppingTexture" }
        cupKeeperImage?.text = "\(cupKeeperSelection.text.count)/300"
    }

    func textView(_ cupKeeperSelection: UITextView, shouldChangeTextIn cupKeeperImage: NSRange, replacementText cupKeeperChoice: String) -> Bool {
        guard let cupKeeperItem = cupKeeperSelection.text as NSString? else { return true }
        return cupKeeperItem.replacingCharacters(in: cupKeeperImage, with: cupKeeperChoice).count <= 300
    }

    @objc private func cupKeeperDestination(_ cupKeeperSelection: Notification) {
        guard let cupKeeperImage = cupKeeperSelection.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let cupKeeperChoice = max(0, view.bounds.maxY - view.convert(cupKeeperImage, from: nil).minY)
        cupKeeperCollection.contentInset.bottom = cupKeeperChoice
        cupKeeperCollection.verticalScrollIndicatorInsets.bottom = cupKeeperChoice
        cupKeeperCollection.scrollRectToVisible(cupKeeperState.convert(cupKeeperState.bounds, to: cupKeeperCollection), animated: true)
    }

    @objc private func cupKeeperRecord(_ cupKeeperSelection: Notification) {
        _ = cupKeeperSelection
        cupKeeperCollection.contentInset.bottom = 0
        cupKeeperCollection.verticalScrollIndicatorInsets.bottom = 0
    }

    @objc private func cupKeeperChoice() {
        view.endEditing(true)
    }

    @objc private func cupKeeperCard() {
        dismiss(animated: true)
    }

    private func cupKeeperTrigger(_ cupKeeperLayout: String, cupKeeperTrigger: String) {
        ChovviThermalAlertView.amberRitualSelection(self, amberRitualChoice: cupKeeperLayout, amberRitualCanvas: cupKeeperTrigger, amberRitualArtwork: .caution)
    }
}
