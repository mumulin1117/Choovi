import UIKit
import PhotosUI

struct ChovviPetiteBrew: Hashable {
    let coffeeBulletinCanvas: String
    let coffeeBulletinScroll: String
    let coffeeBulletinHeader: String
    let coffeeBulletinArtwork: Bool

    static let coffeeBulletinLabel: [ChovviPetiteBrew] = [
        ChovviPetiteBrew(coffeeBulletinCanvas: "LatteArtChallenge", coffeeBulletinScroll: "23 active coffee lovers", coffeeBulletinHeader: "chovviBaristaBody", coffeeBulletinArtwork: true),
        ChovviPetiteBrew(coffeeBulletinCanvas: "PourOver", coffeeBulletinScroll: "48 posts", coffeeBulletinHeader: "chovviBaristaAcidity", coffeeBulletinArtwork: false),
        ChovviPetiteBrew(coffeeBulletinCanvas: "EspressoLovers", coffeeBulletinScroll: "82 posts", coffeeBulletinHeader: "chovviBaristaBrewer", coffeeBulletinArtwork: false),
        ChovviPetiteBrew(coffeeBulletinCanvas: "CoffeeBeans", coffeeBulletinScroll: "23 posts", coffeeBulletinHeader: "chovviBaristaBurr", coffeeBulletinArtwork: false),
        ChovviPetiteBrew(coffeeBulletinCanvas: "HomeCafe", coffeeBulletinScroll: "15 posts", coffeeBulletinHeader: "chovviBaristaCalibration", coffeeBulletinArtwork: false),
        ChovviPetiteBrew(coffeeBulletinCanvas: "BaristaLife", coffeeBulletinScroll: "67 posts", coffeeBulletinHeader: "chovviBaristaCascade", coffeeBulletinArtwork: false),
        ChovviPetiteBrew(coffeeBulletinCanvas: "CoffeeGear", coffeeBulletinScroll: "19 posts", coffeeBulletinHeader: "chovviBaristaGrinder", coffeeBulletinArtwork: false)
    ]
}

final class ChovviSpecialtyBrew: UIViewController, PHPickerViewControllerDelegate, UITextViewDelegate {
    private var journalDraftCanvas: [UIImage] = []
    private var journalDraftScroll: ChovviPetiteBrew?
    private let journalDraftHeader = UIScrollView()
    private let journalDraftArtwork = UIStackView()
    private let journalDraftCollection = UIStackView()
    private let journalDraftStack = UITextView()
    private let journalDraftState = UILabel()
    private let journalDraftRender = UIButton(type: .system)
    private let journalDraftAction = UIButton(type: .system)
    private static let journalDraftLabel = UIColor(red: 0.84, green: 0.61, blue: 0.31, alpha: 1)
    private static let journalDraftStatus = UIColor(red: 0.97, green: 0.98, blue: 0.99, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        journalDraftRoute()
        journalDraftSection()
        journalDraftPreview()
    }

    private func journalDraftRoute() {
        title = "New Post"
        view.backgroundColor = Self.journalDraftStatus
        navigationItem.largeTitleDisplayMode = .never

        let journalDraftSection = UIButton(type: .system)
        journalDraftSection.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        journalDraftSection.tintColor = .black
        journalDraftSection.addTarget(self, action: #selector(journalDraftTrigger), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: journalDraftSection)

        journalDraftAction.setTitle("Post", for: .normal)
        journalDraftAction.setTitleColor(.white, for: .normal)
        journalDraftAction.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        journalDraftAction.backgroundColor = Self.journalDraftLabel
        journalDraftAction.layer.cornerRadius = 15
        journalDraftAction.addTarget(self, action: #selector(journalDraftLayout), for: .touchUpInside)
        journalDraftAction.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            journalDraftAction.widthAnchor.constraint(equalToConstant: 54), journalDraftAction.heightAnchor.constraint(equalToConstant: 30)
        ])
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: journalDraftAction)
    }

    private func journalDraftSection() { journalDraftSectionTrigger() }

    private lazy var journalDraftSectionTrigger: () -> Void = { [unowned self] in
        journalDraftHeader.alwaysBounceVertical = true
        journalDraftHeader.keyboardDismissMode = .interactive
        journalDraftHeader.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(journalDraftHeader)

        journalDraftArtwork.axis = .vertical
        journalDraftArtwork.spacing = 12
        journalDraftArtwork.translatesAutoresizingMaskIntoConstraints = false
        journalDraftHeader.addSubview(journalDraftArtwork)

        journalDraftCollection.axis = .horizontal
        journalDraftCollection.distribution = .fillEqually
        journalDraftCollection.spacing = 12
        journalDraftCollection.heightAnchor.constraint(equalToConstant: 92).isActive = true
        journalDraftArtwork.addArrangedSubview(journalDraftCollection)

        let journalDraftTrigger = UIView()
        journalDraftTrigger.backgroundColor = .white
        journalDraftTrigger.layer.cornerRadius = 10
        journalDraftTrigger.layer.borderWidth = 1
        journalDraftTrigger.layer.borderColor = UIColor.systemGray5.cgColor
        journalDraftTrigger.heightAnchor.constraint(equalToConstant: 112).isActive = true
        journalDraftArtwork.addArrangedSubview(journalDraftTrigger)

        journalDraftStack.backgroundColor = .clear
        journalDraftStack.font = UIFont.systemFont(ofSize: 14)
        journalDraftStack.textColor = UIColor(red: 0.17, green: 0.18, blue: 0.23, alpha: 1)
        journalDraftStack.delegate = self
        journalDraftStack.translatesAutoresizingMaskIntoConstraints = false
        journalDraftTrigger.addSubview(journalDraftStack)

        journalDraftState.text = "Write a caption... Sharing my morning brewing ritual today with this fantastic single-origin bean from Ethiopia. Sweet notes of blueberry and jasmine! #specialtycoffee"
        journalDraftState.font = UIFont.systemFont(ofSize: 13)
        journalDraftState.textColor = .systemGray2
        journalDraftState.numberOfLines = 0
        journalDraftState.translatesAutoresizingMaskIntoConstraints = false
        journalDraftTrigger.addSubview(journalDraftState)

        NSLayoutConstraint.activate([
            journalDraftStack.topAnchor.constraint(equalTo: journalDraftTrigger.topAnchor, constant: 8), journalDraftStack.leadingAnchor.constraint(equalTo: journalDraftTrigger.leadingAnchor, constant: 8), journalDraftStack.trailingAnchor.constraint(equalTo: journalDraftTrigger.trailingAnchor, constant: -8),
            journalDraftStack.bottomAnchor.constraint(equalTo: journalDraftTrigger.bottomAnchor, constant: -8), journalDraftState.topAnchor.constraint(equalTo: journalDraftStack.topAnchor, constant: 8), journalDraftState.leadingAnchor.constraint(equalTo: journalDraftStack.leadingAnchor, constant: 5),
            journalDraftState.trailingAnchor.constraint(equalTo: journalDraftStack.trailingAnchor, constant: -5)
        ])

        journalDraftRender.backgroundColor = .white
        journalDraftRender.layer.cornerRadius = 10
        journalDraftRender.layer.borderWidth = 1
        journalDraftRender.layer.borderColor = UIColor.systemGray5.cgColor
        journalDraftRender.contentHorizontalAlignment = .fill
        journalDraftRender.addTarget(self, action: #selector(journalDraftMenu), for: .touchUpInside)
        journalDraftRender.heightAnchor.constraint(equalToConstant: 50).isActive = true
        journalDraftArtwork.addArrangedSubview(journalDraftRender)
        let coffeeBulletinImage = UIImageView(image: UIImage(systemName: "chevron.right"))
        coffeeBulletinImage.tintColor = .systemGray
        coffeeBulletinImage.isUserInteractionEnabled = false
        coffeeBulletinImage.translatesAutoresizingMaskIntoConstraints = false
        journalDraftRender.addSubview(coffeeBulletinImage)
        NSLayoutConstraint.activate([
            coffeeBulletinImage.trailingAnchor.constraint(equalTo: journalDraftRender.trailingAnchor, constant: -14), coffeeBulletinImage.centerYAnchor.constraint(equalTo: journalDraftRender.centerYAnchor), coffeeBulletinImage.widthAnchor.constraint(equalToConstant: 8),
            coffeeBulletinImage.heightAnchor.constraint(equalToConstant: 13)
        ])
        journalDraftUpdate()

        NSLayoutConstraint.activate([
            journalDraftHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), journalDraftHeader.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), journalDraftHeader.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            journalDraftHeader.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), journalDraftArtwork.topAnchor.constraint(equalTo: journalDraftHeader.contentLayoutGuide.topAnchor, constant: 14), journalDraftArtwork.leadingAnchor.constraint(equalTo: journalDraftHeader.frameLayoutGuide.leadingAnchor, constant: 16),
            journalDraftArtwork.trailingAnchor.constraint(equalTo: journalDraftHeader.frameLayoutGuide.trailingAnchor, constant: -16), journalDraftArtwork.bottomAnchor.constraint(lessThanOrEqualTo: journalDraftHeader.contentLayoutGuide.bottomAnchor, constant: -20)
        ])
        journalDraftDestination()
    }

    private func journalDraftPreview() {
        NotificationCenter.default.addObserver(self, selector: #selector(journalDraftCard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(journalDraftItem(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        let journalDraftTrigger = UITapGestureRecognizer(target: self, action: #selector(journalDraftSelection))
        journalDraftTrigger.cancelsTouchesInView = false
        journalDraftHeader.addGestureRecognizer(journalDraftTrigger)
    }

    private func journalDraftDestination() { journalDraftDestinationTrigger() }

    private lazy var journalDraftDestinationTrigger: () -> Void = { [unowned self] in
        journalDraftCollection.arrangedSubviews.forEach { journalDraftCard in
            journalDraftCollection.removeArrangedSubview(journalDraftCard)
            journalDraftCard.removeFromSuperview()
        }
        for journalDraftItem in 0..<3 {
            let journalDraftSelection = UIView()
            journalDraftSelection.backgroundColor = UIColor(red: 0.93, green: 0.95, blue: 0.96, alpha: 1)
            journalDraftSelection.layer.cornerRadius = 9
            journalDraftSelection.clipsToBounds = true
            journalDraftCollection.addArrangedSubview(journalDraftSelection)

            if journalDraftItem < journalDraftCanvas.count {
                let journalDraftImage = UIImageView(image: journalDraftCanvas[journalDraftItem])
                journalDraftImage.contentMode = .scaleAspectFill
                journalDraftImage.clipsToBounds = true
                journalDraftImage.translatesAutoresizingMaskIntoConstraints = false
                journalDraftSelection.addSubview(journalDraftImage)

                let journalDraftChoice = UIButton(type: .system)
                journalDraftChoice.tag = journalDraftItem
                journalDraftChoice.setImage(UIImage(systemName: "xmark"), for: .normal)
                journalDraftChoice.tintColor = .white
                journalDraftChoice.backgroundColor = UIColor.black.withAlphaComponent(0.45)
                journalDraftChoice.layer.cornerRadius = 11
                journalDraftChoice.addTarget(self, action: #selector(journalDraftChoice(_:)), for: .touchUpInside)
                journalDraftChoice.translatesAutoresizingMaskIntoConstraints = false
                journalDraftSelection.addSubview(journalDraftChoice)
                NSLayoutConstraint.activate([
                    journalDraftImage.topAnchor.constraint(equalTo: journalDraftSelection.topAnchor), journalDraftImage.leadingAnchor.constraint(equalTo: journalDraftSelection.leadingAnchor), journalDraftImage.trailingAnchor.constraint(equalTo: journalDraftSelection.trailingAnchor),
                    journalDraftImage.bottomAnchor.constraint(equalTo: journalDraftSelection.bottomAnchor), journalDraftChoice.topAnchor.constraint(equalTo: journalDraftSelection.topAnchor, constant: 5), journalDraftChoice.trailingAnchor.constraint(equalTo: journalDraftSelection.trailingAnchor, constant: -5),
                    journalDraftChoice.widthAnchor.constraint(equalToConstant: 22), journalDraftChoice.heightAnchor.constraint(equalToConstant: 22)
                ])
            } else if journalDraftItem == journalDraftCanvas.count {
                let coffeeBulletinImage = UIButton(type: .system)
                coffeeBulletinImage.setImage(UIImage(systemName: "plus"), for: .normal)
                coffeeBulletinImage.tintColor = .systemGray
                coffeeBulletinImage.addTarget(self, action: #selector(journalDraftImage), for: .touchUpInside)
                coffeeBulletinImage.translatesAutoresizingMaskIntoConstraints = false
                journalDraftSelection.addSubview(coffeeBulletinImage)
                NSLayoutConstraint.activate([
                    coffeeBulletinImage.topAnchor.constraint(equalTo: journalDraftSelection.topAnchor), coffeeBulletinImage.leadingAnchor.constraint(equalTo: journalDraftSelection.leadingAnchor), coffeeBulletinImage.trailingAnchor.constraint(equalTo: journalDraftSelection.trailingAnchor),
                    coffeeBulletinImage.bottomAnchor.constraint(equalTo: journalDraftSelection.bottomAnchor)
                ])
            }
        }
    }

    private func journalDraftUpdate() {
        var journalDraftDestination = UIButton.Configuration.plain()
        journalDraftDestination.image = UIImage(systemName: "number")
        journalDraftDestination.imagePlacement = .leading
        journalDraftDestination.imagePadding = 12
        journalDraftDestination.title = journalDraftScroll?.coffeeBulletinCanvas ?? "Add Topic"
        journalDraftDestination.baseForegroundColor = UIColor(red: 0.18, green: 0.19, blue: 0.24, alpha: 1)
        journalDraftDestination.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 36)
        journalDraftRender.configuration = journalDraftDestination
        journalDraftRender.tintColor = Self.journalDraftLabel
        journalDraftRender.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }

    @objc private func journalDraftImage() {
        guard journalDraftCanvas.count < 3 else { return }
        var journalDraftChoice = PHPickerConfiguration(photoLibrary: .shared())
        journalDraftChoice.filter = .images
        journalDraftChoice.selectionLimit = 3 - journalDraftCanvas.count
        let coffeeBulletinCanvas = PHPickerViewController(configuration: journalDraftChoice)
        coffeeBulletinCanvas.delegate = self
        present(coffeeBulletinCanvas, animated: true)
    }

    func picker(_ coffeeBulletinCanvas: PHPickerViewController, didFinishPicking coffeeBulletinHeader: [PHPickerResult]) {
        coffeeBulletinCanvas.dismiss(animated: true)
        for coffeeBulletinScroll in coffeeBulletinHeader where journalDraftCanvas.count < 3 {
            guard coffeeBulletinScroll.itemProvider.canLoadObject(ofClass: UIImage.self) else { continue }
            coffeeBulletinScroll.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] coffeeBulletinHeader, _ in
                guard let coffeeBulletinArtwork = coffeeBulletinHeader as? UIImage else { return }
                DispatchQueue.main.async {
                    guard let self, self.journalDraftCanvas.count < 3 else { return }
                    self.journalDraftCanvas.append(coffeeBulletinArtwork)
                    self.journalDraftDestination()
                }
            }
        }
    }

    @objc private func journalDraftChoice(_ coffeeBulletinCanvas: UIButton) {
        guard journalDraftCanvas.indices.contains(coffeeBulletinCanvas.tag) else { return }
        journalDraftCanvas.remove(at: coffeeBulletinCanvas.tag)
        journalDraftDestination()
    }

    @objc private func journalDraftMenu() {
        let coffeeBulletinCanvas = ChovviSensoryBrew { [weak self] coffeeBulletinScroll in
            self?.journalDraftScroll = coffeeBulletinScroll
            self?.journalDraftUpdate()
        }
        navigationController?.pushViewController(coffeeBulletinCanvas, animated: true)
    }

    @objc private func journalDraftLayout() {
        guard !journalDraftCanvas.isEmpty else {
            journalDraftRecord("Add at least one photo", coffeeBulletinScroll: "Choose one to three coffee photos before posting.")
            return
        }
        guard journalDraftScroll != nil else {
            journalDraftRecord("Choose a topic", coffeeBulletinScroll: "Select a coffee topic so people can discover your post.")
            return
        }

        journalDraftAction.isEnabled = false
        journalDraftAction.setTitle("Posting...", for: .normal)
        view.endEditing(true)
        ChovviThermalCalibrationView.amberRitualLayout(self, amberRitualMenu: "Publishing your coffee post...", amberRitualUpdate: 1.0) { [weak self] in
            guard let self else { return }
            do {
                let coffeeBulletinCanvas = try self.journalDraftRecord()
                var coffeeBulletinScroll = ChovviCitrusBrew.roastArchivePreview
                coffeeBulletinScroll.insert(coffeeBulletinCanvas, at: 0)
                let coffeeBulletinHeader = try JSONEncoder().encode(coffeeBulletinScroll)
                UserDefaults.standard.set(coffeeBulletinHeader, forKey: "chovviSpecialtyTexture")
                self.dismiss(animated: true)
            } catch {
                self.journalDraftAction.isEnabled = true
                self.journalDraftAction.setTitle("Post", for: .normal)
                self.journalDraftRecord("Unable to post", coffeeBulletinScroll: "Your photos could not be saved. Please try again.")
            }
        }
    }

    private func journalDraftRecord() throws -> ChovviCaramelBrew {
        let coffeeBulletinCanvas = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        var coffeeBulletinScroll: [String] = []
        for coffeeBulletinHeader in journalDraftCanvas {
            guard let coffeeBulletinArtwork = coffeeBulletinHeader.jpegData(compressionQuality: 0.86) else { continue }
            let coffeeBulletinCollection = coffeeBulletinCanvas.appendingPathComponent("chovviSpecialty-\(UUID().uuidString).jpg")
            try coffeeBulletinArtwork.write(to: coffeeBulletinCollection, options: .atomic)
            coffeeBulletinScroll.append(coffeeBulletinCollection.path)
        }
        guard !coffeeBulletinScroll.isEmpty else { throw CocoaError(.fileWriteUnknown) }
        let coffeeBulletinStack = journalDraftStack.text.trimmingCharacters(in: .whitespacesAndNewlines)
        return ChovviCaramelBrew(
            chovviCaramelAcidity: "chovvi-origin-\(UUID().uuidString)",
            chovviCaramelAeropress: "chovvi-user-20",
            chovviCaramelAftertaste: coffeeBulletinScroll,
            chovviCaramelAroma: coffeeBulletinStack.isEmpty ? "A fresh coffee moment." : coffeeBulletinStack,
            chovviCaramelBatch: 0,
            chovviCaramelBloom: 0,
            chovviCaramelBody: ISO8601DateFormatter().string(from: Date()),
            chovviCaramelBrewer: [],
            chovviCaramelBurr: [journalDraftScroll?.coffeeBulletinCanvas ?? "CoffeeMoment"]
        )
    }

    private func journalDraftRecord(_ coffeeBulletinCanvas: String, coffeeBulletinScroll: String) {
        ChovviThermalAlertView.amberRitualSelection(self, amberRitualChoice: coffeeBulletinCanvas, amberRitualCanvas: coffeeBulletinScroll, amberRitualArtwork: .caution)
    }

    func textViewDidChange(_ coffeeBulletinCanvas: UITextView) {
        journalDraftState.isHidden = !coffeeBulletinCanvas.text.isEmpty
    }

    @objc private func journalDraftCard(_ coffeeBulletinCanvas: Notification) {
        guard let coffeeBulletinScroll = coffeeBulletinCanvas.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let coffeeBulletinHeader = view.convert(coffeeBulletinScroll, from: nil)
        let coffeeBulletinArtwork = max(0, view.bounds.maxY - coffeeBulletinHeader.minY - view.safeAreaInsets.bottom)
        journalDraftHeader.contentInset.bottom = coffeeBulletinArtwork
        journalDraftHeader.verticalScrollIndicatorInsets.bottom = coffeeBulletinArtwork
    }

    @objc private func journalDraftItem(_ coffeeBulletinCanvas: Notification) {
        _ = coffeeBulletinCanvas
        journalDraftHeader.contentInset.bottom = 0
        journalDraftHeader.verticalScrollIndicatorInsets.bottom = 0
    }

    @objc private func journalDraftSelection() {
        view.endEditing(true)
    }

    @objc private func journalDraftTrigger() {
        dismiss(animated: true)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

final class ChovviSensoryBrew: UIViewController {
    private let roastPreferencesCanvas: (ChovviPetiteBrew) -> Void
    private let roastPreferencesScroll = UIScrollView()
    private let roastPreferencesHeader = UIStackView()

    init(roastPreferencesCanvas: @escaping (ChovviPetiteBrew) -> Void) {
        self.roastPreferencesCanvas = roastPreferencesCanvas
        super.init(nibName: nil, bundle: nil)
    }

    convenience init(_ roastPreferencesCanvas: @escaping (ChovviPetiteBrew) -> Void) {
        self.init(roastPreferencesCanvas: roastPreferencesCanvas)
    }

    required init?(coder: NSCoder) {
        roastPreferencesCanvas = { _ in }
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        roastPreferencesArtwork()
    }

    private func roastPreferencesArtwork() {
        title = "Topics"
        view.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.99, alpha: 1)
        navigationItem.largeTitleDisplayMode = .never
        roastPreferencesScroll.alwaysBounceVertical = true
        roastPreferencesScroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(roastPreferencesScroll)

        roastPreferencesHeader.axis = .vertical
        roastPreferencesHeader.spacing = 9
        roastPreferencesHeader.translatesAutoresizingMaskIntoConstraints = false
        roastPreferencesScroll.addSubview(roastPreferencesHeader)

        roastPreferencesHeader.addArrangedSubview(roastPreferencesCollection("Hot Topics"))
        if let roastPreferencesStack = ChovviPetiteBrew.coffeeBulletinLabel.first {
            roastPreferencesHeader.addArrangedSubview(roastPreferencesState(roastPreferencesStack, roastPreferencesRender: true))
        }
        let roastPreferencesAction = roastPreferencesCollection("All Topics")
        roastPreferencesAction.setContentHuggingPriority(.required, for: .vertical)
        roastPreferencesHeader.addArrangedSubview(roastPreferencesAction)
        for roastPreferencesLabel in ChovviPetiteBrew.coffeeBulletinLabel.dropFirst() {
            roastPreferencesHeader.addArrangedSubview(roastPreferencesState(roastPreferencesLabel, roastPreferencesRender: false))
        }

        NSLayoutConstraint.activate([
            roastPreferencesScroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), roastPreferencesScroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), roastPreferencesScroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            roastPreferencesScroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), roastPreferencesHeader.topAnchor.constraint(equalTo: roastPreferencesScroll.contentLayoutGuide.topAnchor, constant: 18), roastPreferencesHeader.leadingAnchor.constraint(equalTo: roastPreferencesScroll.frameLayoutGuide.leadingAnchor, constant: 16),
            roastPreferencesHeader.trailingAnchor.constraint(equalTo: roastPreferencesScroll.frameLayoutGuide.trailingAnchor, constant: -16), roastPreferencesHeader.bottomAnchor.constraint(equalTo: roastPreferencesScroll.contentLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

    private func roastPreferencesCollection(_ roastPreferencesStack: String) -> UILabel {
        let roastPreferencesState = UILabel()
        roastPreferencesState.text = roastPreferencesStack
        roastPreferencesState.textColor = UIColor(red: 0.12, green: 0.13, blue: 0.18, alpha: 1)
        roastPreferencesState.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        roastPreferencesState.heightAnchor.constraint(equalToConstant: 27).isActive = true
        return roastPreferencesState
    }

    private func roastPreferencesState(_ roastPreferencesStack: ChovviPetiteBrew, roastPreferencesRender: Bool) -> UIView {
        roastPreferencesStateTrigger(roastPreferencesStack, roastPreferencesRender)
    }

    private lazy var roastPreferencesStateTrigger: (ChovviPetiteBrew, Bool) -> UIView = { [unowned self] roastPreferencesStack, roastPreferencesRender in
        let roastPreferencesAction = UIButton(type: .custom)
        roastPreferencesAction.backgroundColor = .white
        roastPreferencesAction.layer.cornerRadius = 14
        roastPreferencesAction.layer.borderWidth = 1
        roastPreferencesAction.layer.borderColor = UIColor.systemGray5.cgColor
        roastPreferencesAction.addAction(UIAction { [weak self] roastPreferencesLabel in
            _ = roastPreferencesLabel
            self?.roastPreferencesCanvas(roastPreferencesStack)
            self?.navigationController?.popViewController(animated: true)
        }, for: .touchUpInside)

        let roastPreferencesLabel = UIImageView(image: UIImage(named: roastPreferencesStack.coffeeBulletinHeader))
        roastPreferencesLabel.contentMode = .scaleAspectFill
        roastPreferencesLabel.clipsToBounds = true
        roastPreferencesLabel.layer.cornerRadius = 10
        roastPreferencesLabel.translatesAutoresizingMaskIntoConstraints = false
        roastPreferencesAction.addSubview(roastPreferencesLabel)

        let roastPreferencesStatus = UILabel()
        roastPreferencesStatus.text = "#\(roastPreferencesStack.coffeeBulletinCanvas)"
        roastPreferencesStatus.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        roastPreferencesStatus.textColor = UIColor(red: 0.12, green: 0.13, blue: 0.18, alpha: 1)
        roastPreferencesStatus.translatesAutoresizingMaskIntoConstraints = false
        roastPreferencesAction.addSubview(roastPreferencesStatus)

        let roastPreferencesRoute = UILabel()
        roastPreferencesRoute.text = roastPreferencesStack.coffeeBulletinScroll
        roastPreferencesRoute.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        roastPreferencesRoute.textColor = .secondaryLabel
        roastPreferencesRoute.translatesAutoresizingMaskIntoConstraints = false
        roastPreferencesAction.addSubview(roastPreferencesRoute)

        if roastPreferencesRender {
            let roastPreferencesSection = UILabel()
            roastPreferencesSection.text = "Trending 🔥"
            roastPreferencesSection.font = UIFont.systemFont(ofSize: 9, weight: .semibold)
            roastPreferencesSection.textColor = UIColor(red: 0.72, green: 0.48, blue: 0.20, alpha: 1)
            roastPreferencesSection.backgroundColor = UIColor(red: 0.97, green: 0.93, blue: 0.87, alpha: 1)
            roastPreferencesSection.layer.cornerRadius = 7
            roastPreferencesSection.clipsToBounds = true
            roastPreferencesSection.textAlignment = .center
            roastPreferencesSection.translatesAutoresizingMaskIntoConstraints = false
            roastPreferencesAction.addSubview(roastPreferencesSection)
            NSLayoutConstraint.activate([
                roastPreferencesSection.leadingAnchor.constraint(equalTo: roastPreferencesStatus.leadingAnchor), roastPreferencesSection.topAnchor.constraint(equalTo: roastPreferencesRoute.bottomAnchor, constant: 4), roastPreferencesSection.widthAnchor.constraint(equalToConstant: 70),
                roastPreferencesSection.heightAnchor.constraint(equalToConstant: 16)
            ])
        }

        let roastPreferencesPreview: CGFloat = roastPreferencesRender ? 84 : 58
        roastPreferencesAction.heightAnchor.constraint(equalToConstant: roastPreferencesPreview).isActive = true
        NSLayoutConstraint.activate([
            roastPreferencesLabel.leadingAnchor.constraint(equalTo: roastPreferencesAction.leadingAnchor, constant: 9), roastPreferencesLabel.centerYAnchor.constraint(equalTo: roastPreferencesAction.centerYAnchor), roastPreferencesLabel.widthAnchor.constraint(equalToConstant: roastPreferencesRender ? 66 : 42),
            roastPreferencesLabel.heightAnchor.constraint(equalTo: roastPreferencesLabel.widthAnchor), roastPreferencesStatus.leadingAnchor.constraint(equalTo: roastPreferencesLabel.trailingAnchor, constant: 11), roastPreferencesStatus.trailingAnchor.constraint(lessThanOrEqualTo: roastPreferencesAction.trailingAnchor, constant: -10),
            roastPreferencesStatus.topAnchor.constraint(equalTo: roastPreferencesLabel.topAnchor, constant: roastPreferencesRender ? 4 : 1), roastPreferencesRoute.leadingAnchor.constraint(equalTo: roastPreferencesStatus.leadingAnchor), roastPreferencesRoute.topAnchor.constraint(equalTo: roastPreferencesStatus.bottomAnchor, constant: 2)
        ])
        return roastPreferencesAction
    }
}
