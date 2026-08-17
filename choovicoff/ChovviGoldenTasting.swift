import PhotosUI
import UIKit

final class ChovviAmberTasting: UIViewController, PHPickerViewControllerDelegate, UITextViewDelegate {
    private var brewGatheringCanvas: UIImage?
    private let brewGatheringScroll = UIScrollView()
    private let brewGatheringHeader = UIStackView()
    private let brewGatheringArtwork = UIView()
    private let brewGatheringCollection = UIButton(type: .system)
    private let brewGatheringStack = UIImageView()
    private let brewGatheringState = UIButton(type: .system)
    private let brewGatheringRender = UITextField()
    private let brewGatheringAction = UITextView()
    private let brewGatheringLabel = UILabel()
    private let brewGatheringStatus = UIButton(type: .system)
    private let brewGatheringEmblem = UIImageView(image: UIImage(named: "chovviRoomEntryMark"))
    private let brewGatheringRoute = CAShapeLayer()
    private var brewGatheringSection: NSLayoutConstraint?
    private static let brewGatheringPreview = UIColor(red: 0.84, green: 0.61, blue: 0.31, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        brewGatheringTrigger()
        brewGatheringLayout()
        brewGatheringMenu()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        brewGatheringRoute.frame = brewGatheringArtwork.bounds
        brewGatheringRoute.path = UIBezierPath(roundedRect: brewGatheringArtwork.bounds.insetBy(dx: 1, dy: 1), cornerRadius: 14).cgPath
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func brewGatheringTrigger() { brewGatheringTriggerArtwork() }

    private lazy var brewGatheringTriggerArtwork: () -> Void = { [unowned self] in
        title = "Create Room"
        view.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.99, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(brewGatheringUpdate)
        )
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor(red: 0.13, green: 0.13, blue: 0.18, alpha: 1),
            .font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ]

        brewGatheringScroll.alwaysBounceVertical = true
        brewGatheringScroll.keyboardDismissMode = .interactive
        brewGatheringScroll.showsVerticalScrollIndicator = false
        brewGatheringScroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(brewGatheringScroll)

        brewGatheringHeader.axis = .vertical
        brewGatheringHeader.spacing = 12
        brewGatheringHeader.translatesAutoresizingMaskIntoConstraints = false
        brewGatheringScroll.addSubview(brewGatheringHeader)

        brewGatheringStatus.setTitle("Create Room", for: .normal)
        brewGatheringStatus.setTitleColor(.white, for: .normal)
        brewGatheringStatus.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        brewGatheringStatus.backgroundColor = Self.brewGatheringPreview
        brewGatheringStatus.layer.cornerRadius = 26
        brewGatheringStatus.addTarget(self, action: #selector(brewGatheringDestination), for: .touchUpInside)
        brewGatheringStatus.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(brewGatheringStatus)

        brewGatheringEmblem.contentMode = .scaleAspectFit
        brewGatheringEmblem.isUserInteractionEnabled = false
        brewGatheringEmblem.accessibilityLabel = "Creating a room uses 20 coins"
        brewGatheringEmblem.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(brewGatheringEmblem)

        brewGatheringSection = brewGatheringStatus.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -14)
        NSLayoutConstraint.activate([
            brewGatheringScroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), brewGatheringScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor), brewGatheringScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            brewGatheringScroll.bottomAnchor.constraint(equalTo: brewGatheringStatus.topAnchor, constant: -8),  brewGatheringHeader.topAnchor.constraint(equalTo: brewGatheringScroll.contentLayoutGuide.topAnchor, constant: 16),
            brewGatheringHeader.leadingAnchor.constraint(equalTo: brewGatheringScroll.contentLayoutGuide.leadingAnchor, constant: 16), brewGatheringHeader.trailingAnchor.constraint(equalTo: brewGatheringScroll.contentLayoutGuide.trailingAnchor, constant: -16), brewGatheringHeader.bottomAnchor.constraint(equalTo: brewGatheringScroll.contentLayoutGuide.bottomAnchor, constant: -20),
            brewGatheringHeader.widthAnchor.constraint(equalTo: brewGatheringScroll.frameLayoutGuide.widthAnchor, constant: -32),  brewGatheringStatus.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            brewGatheringStatus.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16), brewGatheringStatus.heightAnchor.constraint(equalToConstant: 52), brewGatheringSection!,
            brewGatheringEmblem.trailingAnchor.constraint(equalTo: brewGatheringStatus.trailingAnchor, constant: -8), brewGatheringEmblem.bottomAnchor.constraint(equalTo: brewGatheringStatus.topAnchor, constant: 8), brewGatheringEmblem.widthAnchor.constraint(equalToConstant: 83),
            brewGatheringEmblem.heightAnchor.constraint(equalToConstant: 31)
        ])
    }

    private func brewGatheringLayout() { brewGatheringLayoutTrigger() }

    private lazy var brewGatheringLayoutTrigger: () -> Void = { [unowned self] in
        brewGatheringArtwork.backgroundColor = UIColor.white.withAlphaComponent(0.72)
        brewGatheringArtwork.layer.cornerRadius = 14
        brewGatheringArtwork.clipsToBounds = true
        brewGatheringArtwork.heightAnchor.constraint(equalTo: brewGatheringArtwork.widthAnchor, multiplier: 0.42).isActive = true

        brewGatheringRoute.strokeColor = UIColor(red: 0.83, green: 0.85, blue: 0.89, alpha: 1).cgColor
        brewGatheringRoute.fillColor = UIColor.clear.cgColor
        brewGatheringRoute.lineWidth = 1
        brewGatheringRoute.lineDashPattern = [5, 4]
        brewGatheringArtwork.layer.addSublayer(brewGatheringRoute)

        var brewGatheringTrigger = UIButton.Configuration.plain()
        brewGatheringTrigger.image = UIImage(systemName: "photo")
        brewGatheringTrigger.imagePlacement = .top
        brewGatheringTrigger.imagePadding = 9
        brewGatheringTrigger.baseForegroundColor = UIColor(red: 0.49, green: 0.51, blue: 0.58, alpha: 1)
        brewGatheringTrigger.title = "Upload Room Cover Image"
        brewGatheringCollection.configuration = brewGatheringTrigger
        brewGatheringCollection.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        brewGatheringCollection.addTarget(self, action: #selector(brewGatheringCard), for: .touchUpInside)
        brewGatheringCollection.translatesAutoresizingMaskIntoConstraints = false
        brewGatheringArtwork.addSubview(brewGatheringCollection)

        brewGatheringStack.contentMode = .scaleAspectFill
        brewGatheringStack.clipsToBounds = true
        brewGatheringStack.isHidden = true
        brewGatheringStack.translatesAutoresizingMaskIntoConstraints = false
        brewGatheringArtwork.addSubview(brewGatheringStack)

        brewGatheringState.setImage(UIImage(systemName: "xmark"), for: .normal)
        brewGatheringState.tintColor = .white
        brewGatheringState.backgroundColor = UIColor.black.withAlphaComponent(0.46)
        brewGatheringState.layer.cornerRadius = 14
        brewGatheringState.isHidden = true
        brewGatheringState.accessibilityLabel = "Remove selected cover"
        brewGatheringState.addAction(UIAction { [weak self] brewGatheringImage in
            _ = brewGatheringImage
            self?.brewGatheringCanvas = nil
            self?.brewGatheringStack.image = nil
            self?.brewGatheringStack.isHidden = true
            self?.brewGatheringState.isHidden = true
        }, for: .touchUpInside)
        brewGatheringState.translatesAutoresizingMaskIntoConstraints = false
        brewGatheringArtwork.addSubview(brewGatheringState)

        NSLayoutConstraint.activate([
            brewGatheringCollection.topAnchor.constraint(equalTo: brewGatheringArtwork.topAnchor), brewGatheringCollection.leadingAnchor.constraint(equalTo: brewGatheringArtwork.leadingAnchor), brewGatheringCollection.trailingAnchor.constraint(equalTo: brewGatheringArtwork.trailingAnchor),
            brewGatheringCollection.bottomAnchor.constraint(equalTo: brewGatheringArtwork.bottomAnchor), brewGatheringStack.topAnchor.constraint(equalTo: brewGatheringArtwork.topAnchor), brewGatheringStack.leadingAnchor.constraint(equalTo: brewGatheringArtwork.leadingAnchor),
            brewGatheringStack.trailingAnchor.constraint(equalTo: brewGatheringArtwork.trailingAnchor), brewGatheringStack.bottomAnchor.constraint(equalTo: brewGatheringArtwork.bottomAnchor), brewGatheringState.topAnchor.constraint(equalTo: brewGatheringArtwork.topAnchor, constant: 10),
            brewGatheringState.trailingAnchor.constraint(equalTo: brewGatheringArtwork.trailingAnchor, constant: -10), brewGatheringState.widthAnchor.constraint(equalToConstant: 28), brewGatheringState.heightAnchor.constraint(equalTo: brewGatheringState.widthAnchor)
        ])

        brewGatheringHeader.addArrangedSubview(brewGatheringArtwork)
        brewGatheringHeader.addArrangedSubview(brewGatheringItem("ROOM NAME"))

        brewGatheringRender.placeholder = "e.g. Moka Pot Masters"
        brewGatheringRender.font = .systemFont(ofSize: 15)
        brewGatheringRender.textColor = UIColor(red: 0.15, green: 0.16, blue: 0.21, alpha: 1)
        brewGatheringRender.backgroundColor = .white
        brewGatheringRender.layer.cornerRadius = 9
        brewGatheringRender.layer.borderWidth = 1
        brewGatheringRender.layer.borderColor = UIColor(red: 0.87, green: 0.88, blue: 0.91, alpha: 1).cgColor
        brewGatheringRender.autocorrectionType = .no
        brewGatheringRender.returnKeyType = .next
        brewGatheringRender.brewGatheringStack(12)
        brewGatheringRender.addAction(UIAction { [weak self] brewGatheringImage in
            _ = brewGatheringImage
            self?.brewGatheringAction.becomeFirstResponder()
        }, for: .editingDidEndOnExit)
        brewGatheringRender.heightAnchor.constraint(equalToConstant: 48).isActive = true
        brewGatheringHeader.addArrangedSubview(brewGatheringRender)
        brewGatheringHeader.setCustomSpacing(18, after: brewGatheringRender)

        brewGatheringHeader.addArrangedSubview(brewGatheringItem("DESCRIPTION"))
        brewGatheringAction.delegate = self
        brewGatheringAction.font = .systemFont(ofSize: 15)
        brewGatheringAction.textColor = UIColor(red: 0.15, green: 0.16, blue: 0.21, alpha: 1)
        brewGatheringAction.backgroundColor = .white
        brewGatheringAction.layer.cornerRadius = 9
        brewGatheringAction.layer.borderWidth = 1
        brewGatheringAction.layer.borderColor = UIColor(red: 0.87, green: 0.88, blue: 0.91, alpha: 1).cgColor
        brewGatheringAction.textContainerInset = UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8)
        brewGatheringAction.heightAnchor.constraint(equalToConstant: 104).isActive = true
        brewGatheringHeader.addArrangedSubview(brewGatheringAction)

        brewGatheringLabel.text = "What should members talk about in this room?"
        brewGatheringLabel.textColor = UIColor(red: 0.57, green: 0.59, blue: 0.65, alpha: 1)
        brewGatheringLabel.font = .systemFont(ofSize: 15)
        brewGatheringLabel.translatesAutoresizingMaskIntoConstraints = false
        brewGatheringAction.addSubview(brewGatheringLabel)
        NSLayoutConstraint.activate([
            brewGatheringLabel.topAnchor.constraint(equalTo: brewGatheringAction.topAnchor, constant: 12), brewGatheringLabel.leadingAnchor.constraint(equalTo: brewGatheringAction.leadingAnchor, constant: 13)
        ])

        let brewGatheringImage = UIView()
        brewGatheringImage.backgroundColor = UIColor(red: 1, green: 0.96, blue: 0.89, alpha: 1)
        brewGatheringImage.layer.cornerRadius = 10
        brewGatheringImage.layer.borderWidth = 1
        brewGatheringImage.layer.borderColor = Self.brewGatheringPreview.withAlphaComponent(0.65).cgColor
        brewGatheringImage.clipsToBounds = true
        brewGatheringImage.heightAnchor.constraint(greaterThanOrEqualToConstant: 54).isActive = true
        let brewGatheringChoice = UILabel()
        brewGatheringChoice.text = "Note: Every room is reviewed before it becomes visible."
        brewGatheringChoice.numberOfLines = 0
        brewGatheringChoice.font = .systemFont(ofSize: 13, weight: .medium)
        brewGatheringChoice.textColor = UIColor(red: 0.37, green: 0.32, blue: 0.25, alpha: 1)
        brewGatheringChoice.translatesAutoresizingMaskIntoConstraints = false
        brewGatheringImage.addSubview(brewGatheringChoice)
        NSLayoutConstraint.activate([
            brewGatheringChoice.topAnchor.constraint(equalTo: brewGatheringImage.topAnchor, constant: 12), brewGatheringChoice.leadingAnchor.constraint(equalTo: brewGatheringImage.leadingAnchor, constant: 12), brewGatheringChoice.trailingAnchor.constraint(equalTo: brewGatheringImage.trailingAnchor, constant: -12),
            brewGatheringChoice.bottomAnchor.constraint(equalTo: brewGatheringImage.bottomAnchor, constant: -12)
        ])
        brewGatheringHeader.setCustomSpacing(16, after: brewGatheringAction)
        brewGatheringHeader.addArrangedSubview(brewGatheringImage)
    }

    private func brewGatheringMenu() {
        NotificationCenter.default.addObserver(self, selector: #selector(brewGatheringSelection), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(brewGatheringImage), name: UIResponder.keyboardWillHideNotification, object: nil)
        let brewGatheringItem = UITapGestureRecognizer(target: self, action: #selector(brewGatheringChoice))
        brewGatheringItem.cancelsTouchesInView = false
        view.addGestureRecognizer(brewGatheringItem)
    }

    private func brewGatheringItem(_ brewGatheringSelection: String) -> UILabel {
        let brewGatheringImage = UILabel()
        brewGatheringImage.text = brewGatheringSelection
        brewGatheringImage.font = .systemFont(ofSize: 12, weight: .bold)
        brewGatheringImage.textColor = UIColor(red: 0.16, green: 0.17, blue: 0.21, alpha: 1)
        return brewGatheringImage
    }

    @objc private func brewGatheringUpdate() {
        dismiss(animated: true)
    }

    @objc private func brewGatheringCard() {
        var brewGatheringImage = PHPickerConfiguration(photoLibrary: .shared())
        brewGatheringImage.filter = .images
        brewGatheringImage.selectionLimit = 1
        let brewGatheringChoice = PHPickerViewController(configuration: brewGatheringImage)
        brewGatheringChoice.delegate = self
        present(brewGatheringChoice, animated: true)
    }

    func picker(_ brewGatheringSelection: PHPickerViewController, didFinishPicking brewGatheringItem: [PHPickerResult]) {
        brewGatheringSelection.dismiss(animated: true)
        guard let brewGatheringImage = brewGatheringItem.first?.itemProvider,
              brewGatheringImage.canLoadObject(ofClass: UIImage.self) else { return }
        brewGatheringImage.loadObject(ofClass: UIImage.self) { [weak self] brewGatheringChoice, _ in
            guard let brewGatheringCanvas = brewGatheringChoice as? UIImage else { return }
            DispatchQueue.main.async {
                self?.brewGatheringCanvas = brewGatheringCanvas
                self?.brewGatheringStack.image = brewGatheringCanvas
                self?.brewGatheringStack.isHidden = false
                self?.brewGatheringState.isHidden = false
            }
        }
    }

    func textViewDidChange(_ brewGatheringSelection: UITextView) {
        brewGatheringLabel.isHidden = !brewGatheringSelection.text.isEmpty
    }

    @objc private func brewGatheringDestination() {
        guard tastingReplySelection() else { return }
        view.endEditing(true)
        let brewGatheringImage = brewGatheringRender.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let brewGatheringChoice = brewGatheringAction.text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let brewGatheringCanvas else {
            brewGatheringArtwork.brewGatheringRoute()
            brewGatheringRecord("Add a room cover", brewGatheringItem: "Choose one image before submitting your room.")
            return
        }
        guard !brewGatheringImage.isEmpty else {
            brewGatheringRender.becomeFirstResponder()
            brewGatheringRecord("Enter a room name", brewGatheringItem: "A room name is required.")
            return
        }
        guard !brewGatheringChoice.isEmpty else {
            brewGatheringAction.becomeFirstResponder()
            brewGatheringRecord("Add a description", brewGatheringItem: "Tell members what they can discuss in this room.")
            return
        }

        guard let brewGatheringIdentity = brewGatheringIdentity() else { return }
        guard ChovviRoastReserve.availableMarks(for: brewGatheringIdentity) >= ChovviRoastReserve.roomCraftMeasure else {
            brewGatheringReservePrompt(for: brewGatheringIdentity)
            return
        }

        brewGatheringStatus.isEnabled = false
        brewGatheringStatus.setTitle("Submitting...", for: .normal)
        ChovviThermalCalibrationView.amberRitualLayout(self, amberRitualMenu: "Submitting your room for review...", amberRitualUpdate: 1.0) { [weak self] in
            self?.brewGatheringItem(brewGatheringCanvas, brewGatheringSelection: brewGatheringImage, brewGatheringImage: brewGatheringChoice)
        }
    }

    private func brewGatheringItem(_ brewGatheringCanvas: UIImage, brewGatheringSelection: String, brewGatheringImage: String) {
        guard let brewGatheringIdentity = brewGatheringIdentity(),
              ChovviRoastReserve.claimRoomCraft(for: brewGatheringIdentity) else {
            brewGatheringResetAction()
            if let brewGatheringIdentity = brewGatheringIdentity() {
                brewGatheringReservePrompt(for: brewGatheringIdentity)
            }
            return
        }
        let brewGatheringItem = brewGatheringState(brewGatheringCanvas)
        guard !brewGatheringItem.isEmpty else {
            ChovviRoastReserve.restoreRoomCraft(for: brewGatheringIdentity)
            brewGatheringResetAction()
            brewGatheringRecord("Unable to submit", brewGatheringItem: "The selected cover could not be stored. Please choose it again.")
            return
        }
        guard brewGatheringStoreRoom(
            coverPath: brewGatheringItem,
            title: brewGatheringSelection,
            summary: brewGatheringImage
        ) else {
            ChovviRoastReserve.restoreRoomCraft(for: brewGatheringIdentity)
            brewGatheringResetAction()
            brewGatheringRecord("Unable to submit", brewGatheringItem: "The room request could not be stored. Please retry.")
            return
        }
        ChovviThermalAlertView.amberRitualSelection(self, amberRitualChoice: "Submitted for Review", amberRitualCanvas: "20 coins were used. After approval, you’ll receive an update in Notification Center.", amberRitualHeader: "Sounds Good", amberRitualArtwork: .success, amberRitualStack: { [weak self] in
            self?.dismiss(animated: true)
        })
    }

    private func brewGatheringStoreRoom(coverPath: String, title: String, summary: String) -> Bool {
        let brewGatheringChoice = ChovviBrightBrew(
            chovviBrightAcidity: "pending-\(UUID().uuidString)",
            chovviBrightAeropress: title,
            chovviBrightAftertaste: summary,
            chovviBrightAroma: coverPath,
            chovviBrightBatch: 1,
            chovviBrightBloom: "chovvi-user-20",
            chovviBrightBody: ["chovvi-user-20"],
            chovviBrightBrewer: []
        )
        var brewGatheringCard = [ChovviBrightBrew]()
        if let brewGatheringArtwork = UserDefaults.standard.data(forKey: "chovviGoldenTexture")
            ?? UserDefaults.standard.data(forKey: "chovviGoldenTasting"),
           let brewGatheringCollection = try? JSONDecoder().decode([ChovviBrightBrew].self, from: brewGatheringArtwork) {
            brewGatheringCard = brewGatheringCollection
        }
        brewGatheringCard.insert(brewGatheringChoice, at: 0)
        guard let brewGatheringUpdate = try? JSONEncoder().encode(brewGatheringCard) else { return false }
        UserDefaults.standard.set(brewGatheringUpdate, forKey: "chovviGoldenTexture")
        return true
    }

    private func brewGatheringIdentity() -> String? {
        let brewGatheringIdentity = UserDefaults.standard.string(forKey: "hooviEmail")?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        return brewGatheringIdentity.isEmpty ? nil : brewGatheringIdentity.lowercased()
    }

    private func brewGatheringReservePrompt(for brewGatheringIdentity: String) {
        let brewGatheringMarks = ChovviRoastReserve.availableMarks(for: brewGatheringIdentity)
        ChovviThermalAlertView.amberRitualSelection(
            self,
            amberRitualChoice: "More Coins Needed",
            amberRitualCanvas: "Creating a room requires 20 coins. You currently have \(brewGatheringMarks.formatted()). Recharge to continue.",
            amberRitualScroll: "Not Now",
            amberRitualHeader: "Recharge",
            amberRitualArtwork: .caution,
            amberRitualCollection: {},
            amberRitualStack: { [weak self] in self?.brewGatheringOpenReserve() }
        )
    }

    private func brewGatheringOpenReserve() {
        let brewGatheringReserve = UINavigationController(rootViewController: ChovviThermalTasting())
        brewGatheringReserve.setNavigationBarHidden(true, animated: false)
        brewGatheringReserve.modalPresentationStyle = .fullScreen
        present(brewGatheringReserve, animated: true)
    }

    private func brewGatheringResetAction() {
        brewGatheringStatus.isEnabled = true
        brewGatheringStatus.setTitle("Create Room", for: .normal)
    }

    private func brewGatheringState(_ brewGatheringSelection: UIImage) -> String {
        guard let brewGatheringItem = brewGatheringSelection.jpegData(compressionQuality: 0.84),
              let brewGatheringImage = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return "" }
        let brewGatheringChoice = "cover-\(UUID().uuidString).jpg"
        let brewGatheringCanvas = brewGatheringImage.appendingPathComponent(brewGatheringChoice)
        do {
            try brewGatheringItem.write(to: brewGatheringCanvas, options: .atomic)
            return brewGatheringCanvas.path
        } catch {
            return ""
        }
    }

    private func brewGatheringRecord(_ brewGatheringSelection: String, brewGatheringItem: String) {
        ChovviThermalAlertView.amberRitualSelection(self, amberRitualChoice: brewGatheringSelection, amberRitualCanvas: brewGatheringItem, amberRitualArtwork: .caution)
    }

    @objc private func brewGatheringSelection(_ brewGatheringItem: Notification) {
        guard let brewGatheringImage = brewGatheringItem.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let brewGatheringChoice = max(0, view.bounds.maxY - view.convert(brewGatheringImage, from: nil).minY)
        brewGatheringSection?.constant = -(max(14, brewGatheringChoice - view.safeAreaInsets.bottom + 8))
        brewGatheringScroll.contentInset.bottom = 12
        brewGatheringScroll.verticalScrollIndicatorInsets.bottom = 12
        let brewGatheringCanvas = brewGatheringItem.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.25
        UIView.animate(withDuration: brewGatheringCanvas) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }

    @objc private func brewGatheringImage() {
        brewGatheringSection?.constant = -14
        brewGatheringScroll.contentInset.bottom = 0
        brewGatheringScroll.verticalScrollIndicatorInsets.bottom = 0
        UIView.animate(withDuration: 0.25) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }

    @objc private func brewGatheringChoice() {
        view.endEditing(true)
    }
}

private extension UITextField {
    func brewGatheringStack(_ brewGatheringSelection: CGFloat) {
        let brewGatheringItem = UIView(frame: CGRect(x: 0, y: 0, width: brewGatheringSelection, height: 1))
        leftView = brewGatheringItem
        leftViewMode = .always
    }
}

private extension UIView {
    func brewGatheringRoute() {
        let brewGatheringSelection = CAKeyframeAnimation(keyPath: "transform.translation.x")
        brewGatheringSelection.timingFunction = CAMediaTimingFunction(name: .linear)
        brewGatheringSelection.duration = 0.32
        brewGatheringSelection.values = [-8, 8, -6, 6, 0]
        layer.add(brewGatheringSelection, forKey: "chovviGoldenTasting")
    }
}
