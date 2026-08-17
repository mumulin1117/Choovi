import UIKit
import UniformTypeIdentifiers

final class ChovviGranularBrew: UIViewController, UIDocumentPickerDelegate, UITextViewDelegate {
    private var moodPourCanvas: URL?
    private var moodPourScroll = 0
    private let moodPourHeader = UIScrollView()
    private let moodPourArtwork = UIStackView()
    private let moodPourCollection = UIView()
    private let moodPourStack = UIStackView()
    private let moodPourState = UITextView()
    private let moodPourRender = UILabel()
    private let moodPourAction = UIButton(type: .system)
    private let moodPourLabel = UIButton(type: .system)
    private let moodPourStatus = CAShapeLayer()
    private var moodPourRoute: ChovviThermalBrew?
    private var moodPourSection: NSLayoutConstraint?
    private var moodPourPreview = false
    private let moodPourChoice = [
        "chovviGoldenAcidity",
        "chovviGoldenAeropress",
        "chovviGoldenAftertaste",
        "chovviGoldenAroma"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        moodPourTrigger()
        moodPourLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(moodPourSource),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(moodPourMenu),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        moodPourRoute?.amberRitualStack()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        moodPourStatus.frame = moodPourCollection.bounds
        moodPourStatus.path = UIBezierPath(roundedRect: moodPourCollection.bounds.insetBy(dx: 1, dy: 1), cornerRadius: 16).cgPath
    }

    private func moodPourTrigger() {
        view.backgroundColor = UIColor(red: 248 / 255, green: 250 / 255, blue: 252 / 255, alpha: 1)
        title = "Create Coffee Card"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left")?.withTintColor(.black, renderingMode: .alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(moodPourUpdate)
        )
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.tintColor = .black

        moodPourHeader.translatesAutoresizingMaskIntoConstraints = false
        moodPourHeader.alwaysBounceVertical = true
        moodPourHeader.showsVerticalScrollIndicator = false
        view.addSubview(moodPourHeader)

        moodPourArtwork.axis = .vertical
        moodPourArtwork.spacing = 14
        moodPourArtwork.translatesAutoresizingMaskIntoConstraints = false
        moodPourHeader.addSubview(moodPourArtwork)

        moodPourLabel.setTitle("Post", for: .normal)
        moodPourLabel.setTitleColor(.white, for: .normal)
        moodPourLabel.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        moodPourLabel.backgroundColor = ChovviRoastedBrew.roastShelfCanvas
        moodPourLabel.layer.cornerRadius = 26
        moodPourLabel.addTarget(self, action: #selector(moodPourDestination), for: .touchUpInside)
        moodPourLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(moodPourLabel)

        moodPourSection = moodPourLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -14)
        moodPourSection?.isActive = true

        NSLayoutConstraint.activate([
            moodPourLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), moodPourLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), moodPourLabel.heightAnchor.constraint(equalToConstant: 52),
            moodPourHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), moodPourHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor), moodPourHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moodPourHeader.bottomAnchor.constraint(equalTo: moodPourLabel.topAnchor, constant: -12), moodPourArtwork.topAnchor.constraint(equalTo: moodPourHeader.contentLayoutGuide.topAnchor, constant: 16), moodPourArtwork.leadingAnchor.constraint(equalTo: moodPourHeader.contentLayoutGuide.leadingAnchor, constant: 18),
            moodPourArtwork.trailingAnchor.constraint(equalTo: moodPourHeader.contentLayoutGuide.trailingAnchor, constant: -18), moodPourArtwork.bottomAnchor.constraint(equalTo: moodPourHeader.contentLayoutGuide.bottomAnchor, constant: -24), moodPourArtwork.widthAnchor.constraint(equalTo: moodPourHeader.frameLayoutGuide.widthAnchor, constant: -36)
        ])

        let moodPourCard = UITapGestureRecognizer(target: self, action: #selector(moodPourRecord))
        moodPourCard.cancelsTouchesInView = false
        moodPourHeader.addGestureRecognizer(moodPourCard)
    }

    private func moodPourLayout() { moodPourLayoutTrigger() }

    private lazy var moodPourLayoutTrigger: () -> Void = { [unowned self] in
        moodPourCollection.backgroundColor = ChovviRoastedBrew.roastShelfHeader
        moodPourCollection.layer.cornerRadius = 16
        moodPourCollection.clipsToBounds = true
        moodPourCollection.heightAnchor.constraint(equalTo: moodPourCollection.widthAnchor, multiplier: 0.46).isActive = true
        moodPourArtwork.addArrangedSubview(moodPourCollection)

        moodPourStatus.strokeColor = UIColor(red: 204 / 255, green: 212 / 255, blue: 219 / 255, alpha: 1).cgColor
        moodPourStatus.fillColor = UIColor.clear.cgColor
        moodPourStatus.lineWidth = 1
        moodPourStatus.lineDashPattern = [5, 4]
        moodPourCollection.layer.addSublayer(moodPourStatus)

        moodPourAction.setTitle("Tap Add Video", for: .normal)
        moodPourAction.setTitleColor(.secondaryLabel, for: .normal)
        moodPourAction.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        moodPourAction.setImage(UIImage(systemName: "play.rectangle"), for: .normal)
        moodPourAction.tintColor = .secondaryLabel
        moodPourAction.configuration = {
            var moodPourImage = UIButton.Configuration.plain()
            moodPourImage.imagePlacement = .top
            moodPourImage.imagePadding = 8
            moodPourImage.title = "Tap Add Video"
            moodPourImage.image = UIImage(systemName: "play.rectangle")
            return moodPourImage
        }()
        moodPourAction.addTarget(self, action: #selector(moodPourItem), for: .touchUpInside)
        moodPourAction.translatesAutoresizingMaskIntoConstraints = false
        moodPourCollection.addSubview(moodPourAction)

        moodPourRender.text = "TODAY'S MOOD"
        moodPourRender.textColor = ChovviRoastedBrew.roastShelfScroll
        moodPourRender.font = UIFont.systemFont(ofSize: 12, weight: .black)
        moodPourArtwork.addArrangedSubview(moodPourRender)

        moodPourStack.axis = .horizontal
        moodPourStack.distribution = .equalSpacing
        moodPourChoice.enumerated().forEach { moodPourSelection, moodPourImage in
            let moodPourChoice = UIButton(type: .system)
            moodPourChoice.tag = moodPourSelection
            moodPourChoice.setImage(UIImage(named: moodPourImage)?.withRenderingMode(.alwaysOriginal), for: .normal)
            moodPourChoice.imageView?.contentMode = .scaleAspectFit
            moodPourChoice.accessibilityLabel = "Mood option \(moodPourSelection + 1)"
            moodPourChoice.backgroundColor = .white
            moodPourChoice.layer.cornerRadius = 11
            moodPourChoice.layer.borderWidth = moodPourSelection == 0 ? 2 : 1
            moodPourChoice.layer.borderColor = (moodPourSelection == 0 ? ChovviRoastedBrew.roastShelfCanvas : UIColor.separator).cgColor
            moodPourChoice.addTarget(self, action: #selector(moodPourSelection(_:)), for: .touchUpInside)
            moodPourChoice.translatesAutoresizingMaskIntoConstraints = false
            moodPourChoice.widthAnchor.constraint(equalToConstant: 50).isActive = true
            moodPourChoice.heightAnchor.constraint(equalTo: moodPourChoice.widthAnchor).isActive = true
            moodPourStack.addArrangedSubview(moodPourChoice)
        }
        moodPourArtwork.addArrangedSubview(moodPourStack)

        let tastingReplyCanvas = UILabel()
        tastingReplyCanvas.text = "YOUR COFFEE MOMENT"
        tastingReplyCanvas.textColor = ChovviRoastedBrew.roastShelfScroll
        tastingReplyCanvas.font = UIFont.systemFont(ofSize: 12, weight: .black)
        moodPourArtwork.addArrangedSubview(tastingReplyCanvas)

        let tastingReplyScroll = UIView()
        tastingReplyScroll.backgroundColor = .white
        tastingReplyScroll.layer.cornerRadius = 12
        tastingReplyScroll.layer.borderWidth = 1
        tastingReplyScroll.layer.borderColor = UIColor.separator.withAlphaComponent(0.5).cgColor
        tastingReplyScroll.heightAnchor.constraint(equalToConstant: 112).isActive = true
        moodPourArtwork.addArrangedSubview(tastingReplyScroll)

        moodPourState.backgroundColor = .clear
        moodPourState.textColor = ChovviRoastedBrew.roastShelfScroll
        moodPourState.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        moodPourState.delegate = self
        moodPourState.translatesAutoresizingMaskIntoConstraints = false
        tastingReplyScroll.addSubview(moodPourState)

        let tastingReplyHeader = UILabel()
        tastingReplyHeader.text = "Write something about your coffee moment..."
        tastingReplyHeader.textColor = .placeholderText
        tastingReplyHeader.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        tastingReplyHeader.translatesAutoresizingMaskIntoConstraints = false
        tastingReplyScroll.addSubview(tastingReplyHeader)
        moodPourRender.accessibilityIdentifier = "chovviGranularBrewer"
        tastingReplyHeader.accessibilityIdentifier = "chovviGranularBody"

        NSLayoutConstraint.activate([
            moodPourAction.topAnchor.constraint(equalTo: moodPourCollection.topAnchor), moodPourAction.leadingAnchor.constraint(equalTo: moodPourCollection.leadingAnchor), moodPourAction.trailingAnchor.constraint(equalTo: moodPourCollection.trailingAnchor),
            moodPourAction.bottomAnchor.constraint(equalTo: moodPourCollection.bottomAnchor), moodPourState.topAnchor.constraint(equalTo: tastingReplyScroll.topAnchor, constant: 8), moodPourState.leadingAnchor.constraint(equalTo: tastingReplyScroll.leadingAnchor, constant: 10),
            moodPourState.trailingAnchor.constraint(equalTo: tastingReplyScroll.trailingAnchor, constant: -10), moodPourState.bottomAnchor.constraint(equalTo: tastingReplyScroll.bottomAnchor, constant: -8), tastingReplyHeader.topAnchor.constraint(equalTo: moodPourState.topAnchor, constant: 8),
            tastingReplyHeader.leadingAnchor.constraint(equalTo: moodPourState.leadingAnchor, constant: 5)
        ])
    }

    @objc private func moodPourItem() {
        let moodPourSelection = UIDocumentPickerViewController(forOpeningContentTypes: [.movie], asCopy: true)
        moodPourSelection.delegate = self
        moodPourSelection.allowsMultipleSelection = false
        present(moodPourSelection, animated: true)
    }

    func documentPicker(_ moodPourImage: UIDocumentPickerViewController, didPickDocumentsAt moodPourChoice: [URL]) {
        guard let tastingReplyCanvas = moodPourChoice.first else { return }
        moodPourCanvas = tastingReplyCanvas
        moodPourRoute?.removeFromSuperview()

        let tastingReplyScroll = ChovviThermalBrew(amberRitualArtwork: tastingReplyCanvas)
        tastingReplyScroll.layer.cornerRadius = 16
        tastingReplyScroll.translatesAutoresizingMaskIntoConstraints = false
        moodPourCollection.addSubview(tastingReplyScroll)
        NSLayoutConstraint.activate([
            tastingReplyScroll.topAnchor.constraint(equalTo: moodPourCollection.topAnchor), tastingReplyScroll.leadingAnchor.constraint(equalTo: moodPourCollection.leadingAnchor), tastingReplyScroll.trailingAnchor.constraint(equalTo: moodPourCollection.trailingAnchor),
            tastingReplyScroll.bottomAnchor.constraint(equalTo: moodPourCollection.bottomAnchor)
        ])
        moodPourRoute = tastingReplyScroll
        moodPourAction.configuration = nil
        moodPourAction.setImage(UIImage(systemName: "arrow.triangle.2.circlepath"), for: .normal)
        moodPourAction.setTitle(nil, for: .normal)
        moodPourAction.backgroundColor = UIColor.black.withAlphaComponent(0.45)
        moodPourAction.tintColor = .white
        moodPourAction.layer.cornerRadius = 17
        moodPourAction.removeFromSuperview()
        moodPourCollection.addSubview(moodPourAction)
        moodPourAction.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moodPourAction.topAnchor.constraint(equalTo: moodPourCollection.topAnchor, constant: 10), moodPourAction.trailingAnchor.constraint(equalTo: moodPourCollection.trailingAnchor, constant: -10), moodPourAction.widthAnchor.constraint(equalToConstant: 34),
            moodPourAction.heightAnchor.constraint(equalTo: moodPourAction.widthAnchor)
        ])
        moodPourStatus.isHidden = true
    }

    @objc private func moodPourSelection(_ moodPourImage: UIButton) {
        moodPourScroll = moodPourImage.tag
        moodPourStack.arrangedSubviews.compactMap { $0 as? UIButton }.forEach { moodPourChoice in
            let tastingReplyCanvas = moodPourChoice.tag == moodPourScroll
            moodPourChoice.layer.borderWidth = tastingReplyCanvas ? 2 : 1
            moodPourChoice.layer.borderColor = (tastingReplyCanvas ? ChovviRoastedBrew.roastShelfCanvas : UIColor.separator).cgColor
        }
    }

    func textViewDidChange(_ moodPourImage: UITextView) {
        guard let tastingReplyCanvas = moodPourArtwork.arrangedSubviews.last?.subviews.first(where: { $0.accessibilityIdentifier == "chovviGranularBody" }) as? UILabel else { return }
        tastingReplyCanvas.isHidden = !moodPourImage.text.isEmpty
    }

    @objc private func moodPourDestination() {
        guard !moodPourPreview else { return }
        guard tastingReplySelection() else { return }
        guard moodPourCanvas != nil else {
            moodPourCard("Add a Coffee Moment", moodPourItem: "Choose a coffee recording before posting.")
            return
        }
        let moodPourItem = moodPourState.text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !moodPourItem.isEmpty else {
            moodPourCard("Describe your moment", moodPourItem: "Write a few words about this coffee moment.")
            return
        }

        moodPourPreview = true
        moodPourLabel.isEnabled = false
        moodPourLabel.setTitle("Posting...", for: .normal)
        moodPourLabel.alpha = 0.72
        ChovviThermalCalibrationView.amberRitualLayout(self, amberRitualMenu: "Publishing your Coffee Moment...", amberRitualUpdate: 1.0) { [weak self] in
            self?.moodPourImage(moodPourItem)
        }
    }

    private func moodPourImage(_ moodPourChoice: String) {
        guard let tastingReplyCanvas = moodPourCanvas else { return }
        do {
            let tastingReplyScroll = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: true
            )
            let tastingReplyHeader = tastingReplyScroll
                .appendingPathComponent("chovviGranularProfile\(UUID().uuidString)")
                .appendingPathExtension(tastingReplyCanvas.pathExtension.isEmpty ? "mov" : tastingReplyCanvas.pathExtension)
            try FileManager.default.copyItem(at: tastingReplyCanvas, to: tastingReplyHeader)

            let tastingReplyArtwork = ChovviSilkyBrew(
                chovviSilkyAcidity: "chovvi-origin-\(UUID().uuidString)",
                chovviSilkyAeropress: "chovvi-user-20",
                chovviSilkyAftertaste: tastingReplyHeader.path,
                chovviSilkyAroma: moodPourChoice,
                chovviSilkyBatch: 0,
                chovviSilkyBloom: 0,
                chovviSilkyBrewer: DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short),
                chovviSilkyBurr: self.moodPourChoice[moodPourScroll]
            )
            var tastingReplyCollection = ChovviCitrusBrew.roastArchiveSection
            tastingReplyCollection.insert(tastingReplyArtwork, at: 0)
            let tastingReplyStack = try JSONEncoder().encode(tastingReplyCollection)
            UserDefaults.standard.set(tastingReplyStack, forKey: "chovviGranularTexture")
            dismiss(animated: true)
        } catch {
            moodPourPreview = false
            moodPourLabel.isEnabled = true
            moodPourLabel.alpha = 1
            moodPourLabel.setTitle("Post", for: .normal)
            moodPourCard("Unable to post", moodPourItem: "The selected item could not be prepared. Please choose it again.")
        }
    }

    private func moodPourCard(_ moodPourRecord: String, moodPourItem: String) {
        ChovviThermalAlertView.amberRitualSelection(self, amberRitualChoice: moodPourRecord, amberRitualCanvas: moodPourItem, amberRitualArtwork: .caution)
    }

    @objc private func moodPourUpdate() {
        dismiss(animated: true)
    }

    @objc private func moodPourRecord() {
        view.endEditing(true)
    }

    @objc private func moodPourSource(_ moodPourMenu: Notification) {
        guard
            let moodPourUpdate = moodPourMenu.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
            let moodPourDestination = moodPourMenu.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        else { return }
        let moodPourCard = view.convert(moodPourUpdate, from: nil)
        let moodPourRecord = max(0, view.bounds.maxY - moodPourCard.minY - view.safeAreaInsets.bottom)
        moodPourSection?.constant = -moodPourRecord - 10
        moodPourHeader.contentInset.bottom = moodPourRecord
        moodPourHeader.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: moodPourRecord, right: 0)
        UIView.animate(withDuration: moodPourDestination) { [weak self] in self?.view.layoutIfNeeded() }
    }

    @objc private func moodPourMenu(_ moodPourUpdate: Notification) {
        let moodPourDestination = (moodPourUpdate.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0.25
        moodPourSection?.constant = -14
        moodPourHeader.contentInset.bottom = 0
        moodPourHeader.verticalScrollIndicatorInsets = .zero
        UIView.animate(withDuration: moodPourDestination) { [weak self] in self?.view.layoutIfNeeded() }
    }
}
