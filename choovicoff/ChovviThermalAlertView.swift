import UIKit

final class ChovviThermalAlertView: UIView {
    enum ChovviThermalRoast {
        case warm
        case success
        case caution
        case destructive
    }

    private static let goldenRitualChoice = 80_962_769
    private let goldenRitualArtwork = UIView()
    private let goldenRitualStack = UIView()
    private let goldenRitualState = UIImageView()
    private let goldenRitualRender = UILabel()
    private let goldenRitualAction = UILabel()
    private let goldenRitualLabel = UIButton(type: .system)
    private let goldenRitualStatus = UIButton(type: .system)
    private var goldenRitualRoute: (() -> Void)?
    private var goldenRitualSection: (() -> Void)?
    private var goldenRitualCanvas: NSLayoutConstraint?

    private override init(frame: CGRect) {
        super.init(frame: frame)
        goldenRitualPreview()
    }

    required init?(coder: NSCoder) {
        return nil
    }

    private func goldenRitualPreview() {
        backgroundColor = UIColor(red: 0.10, green: 0.08, blue: 0.07, alpha: 0.42)
        accessibilityViewIsModal = true
        translatesAutoresizingMaskIntoConstraints = false
        goldenRitualUpdate()
        goldenRitualDestination()
        goldenRitualRecord()
        goldenRitualImage()
    }

    private func goldenRitualUpdate() {
        goldenRitualArtwork.backgroundColor = UIColor(red: 1.00, green: 0.98, blue: 0.94, alpha: 1)
        goldenRitualArtwork.layer.cornerRadius = 28
        goldenRitualArtwork.layer.cornerCurve = .continuous
        goldenRitualArtwork.layer.borderWidth = 1
        goldenRitualArtwork.layer.borderColor = UIColor(red: 0.88, green: 0.74, blue: 0.55, alpha: 0.45).cgColor
        goldenRitualArtwork.layer.shadowColor = UIColor(red: 0.18, green: 0.10, blue: 0.05, alpha: 1).cgColor
        goldenRitualArtwork.layer.shadowOpacity = 0.18
        goldenRitualArtwork.layer.shadowOffset = CGSize(width: 0, height: 14)
        goldenRitualArtwork.layer.shadowRadius = 28
        goldenRitualArtwork.translatesAutoresizingMaskIntoConstraints = false
        addSubview(goldenRitualArtwork)
    }

    private func goldenRitualDestination() {
        goldenRitualStack.backgroundColor = UIColor(red: 0.96, green: 0.88, blue: 0.74, alpha: 1)
        goldenRitualStack.layer.cornerRadius = 29
        goldenRitualStack.translatesAutoresizingMaskIntoConstraints = false
        goldenRitualArtwork.addSubview(goldenRitualStack)

        goldenRitualState.contentMode = .scaleAspectFit
        goldenRitualState.translatesAutoresizingMaskIntoConstraints = false
        goldenRitualStack.addSubview(goldenRitualState)

        goldenRitualRender.font = .systemFont(ofSize: 22, weight: .black)
        goldenRitualRender.textColor = UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1)
        goldenRitualRender.textAlignment = .center
        goldenRitualRender.numberOfLines = 2
        goldenRitualRender.translatesAutoresizingMaskIntoConstraints = false
        goldenRitualArtwork.addSubview(goldenRitualRender)

        goldenRitualAction.font = .systemFont(ofSize: 15, weight: .medium)
        goldenRitualAction.textColor = UIColor(red: 0.38, green: 0.37, blue: 0.44, alpha: 1)
        goldenRitualAction.textAlignment = .center
        goldenRitualAction.numberOfLines = 0
        goldenRitualAction.translatesAutoresizingMaskIntoConstraints = false
        goldenRitualArtwork.addSubview(goldenRitualAction)
    }

    private func goldenRitualRecord() {
        [goldenRitualLabel, goldenRitualStatus].forEach { goldenRitualTrigger in
            goldenRitualTrigger.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            goldenRitualTrigger.layer.cornerRadius = 15
            goldenRitualTrigger.layer.cornerCurve = .continuous
            goldenRitualTrigger.translatesAutoresizingMaskIntoConstraints = false
            goldenRitualArtwork.addSubview(goldenRitualTrigger)
        }
        goldenRitualCanvas = goldenRitualLabel.heightAnchor.constraint(equalToConstant: 50)
        goldenRitualCanvas?.isActive = true
        goldenRitualStatus.heightAnchor.constraint(equalToConstant: 50).isActive = true
        goldenRitualLabel.addTarget(self, action: #selector(goldenRitualTrigger), for: .touchUpInside)
        goldenRitualStatus.addTarget(self, action: #selector(goldenRitualLayout), for: .touchUpInside)
    }

    private func goldenRitualImage() {
        NSLayoutConstraint.activate([
            goldenRitualArtwork.centerXAnchor.constraint(equalTo: centerXAnchor), goldenRitualArtwork.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor), goldenRitualArtwork.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            goldenRitualArtwork.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -24), goldenRitualArtwork.widthAnchor.constraint(lessThanOrEqualToConstant: 336), 
            goldenRitualStack.topAnchor.constraint(equalTo: goldenRitualArtwork.topAnchor, constant: 24), goldenRitualStack.centerXAnchor.constraint(equalTo: goldenRitualArtwork.centerXAnchor), goldenRitualStack.widthAnchor.constraint(equalToConstant: 58),
            goldenRitualStack.heightAnchor.constraint(equalTo: goldenRitualStack.widthAnchor), goldenRitualState.centerXAnchor.constraint(equalTo: goldenRitualStack.centerXAnchor), goldenRitualState.centerYAnchor.constraint(equalTo: goldenRitualStack.centerYAnchor),
            goldenRitualState.widthAnchor.constraint(equalToConstant: 29), goldenRitualState.heightAnchor.constraint(equalTo: goldenRitualState.widthAnchor), 
            goldenRitualRender.topAnchor.constraint(equalTo: goldenRitualStack.bottomAnchor, constant: 15), goldenRitualRender.leadingAnchor.constraint(equalTo: goldenRitualArtwork.leadingAnchor, constant: 24), goldenRitualRender.trailingAnchor.constraint(equalTo: goldenRitualArtwork.trailingAnchor, constant: -24),
            goldenRitualAction.topAnchor.constraint(equalTo: goldenRitualRender.bottomAnchor, constant: 9), goldenRitualAction.leadingAnchor.constraint(equalTo: goldenRitualArtwork.leadingAnchor, constant: 24), goldenRitualAction.trailingAnchor.constraint(equalTo: goldenRitualArtwork.trailingAnchor, constant: -24),
             goldenRitualStatus.topAnchor.constraint(equalTo: goldenRitualAction.bottomAnchor, constant: 22), goldenRitualStatus.leadingAnchor.constraint(equalTo: goldenRitualArtwork.leadingAnchor, constant: 20),
            goldenRitualStatus.trailingAnchor.constraint(equalTo: goldenRitualArtwork.trailingAnchor, constant: -20), goldenRitualLabel.topAnchor.constraint(equalTo: goldenRitualStatus.bottomAnchor, constant: 10), goldenRitualLabel.leadingAnchor.constraint(equalTo: goldenRitualStatus.leadingAnchor),
            goldenRitualLabel.trailingAnchor.constraint(equalTo: goldenRitualStatus.trailingAnchor), goldenRitualLabel.bottomAnchor.constraint(equalTo: goldenRitualArtwork.bottomAnchor, constant: -20)
        ])
        let goldenRitualTrigger = goldenRitualArtwork.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -48)
        goldenRitualTrigger.priority = .defaultHigh
        goldenRitualTrigger.isActive = true
    }

    private func goldenRitualSource(_ goldenRitualMenu: ChovviThermalRoast) {
        let goldenRitualUpdate: UIColor
        let goldenRitualDestination: String
        switch goldenRitualMenu {
        case .warm:
            goldenRitualUpdate = UIColor(red: 0.84, green: 0.61, blue: 0.32, alpha: 1)
            goldenRitualDestination = "cup.and.saucer.fill"
        case .success:
            goldenRitualUpdate = UIColor(red: 0.39, green: 0.59, blue: 0.39, alpha: 1)
            goldenRitualDestination = "checkmark"
        case .caution:
            goldenRitualUpdate = UIColor(red: 0.91, green: 0.58, blue: 0.18, alpha: 1)
            goldenRitualDestination = "exclamationmark"
        case .destructive:
            goldenRitualUpdate = UIColor(red: 0.76, green: 0.29, blue: 0.25, alpha: 1)
            goldenRitualDestination = "hand.raised.fill"
        }
        goldenRitualStack.backgroundColor = goldenRitualUpdate.withAlphaComponent(0.16)
        goldenRitualState.image = UIImage(systemName: goldenRitualDestination)
        goldenRitualState.tintColor = goldenRitualUpdate
        goldenRitualStatus.backgroundColor = goldenRitualUpdate
        goldenRitualStatus.setTitleColor(.white, for: .normal)
    }

    @objc private func goldenRitualTrigger() {
        goldenRitualCard(goldenRitualRoute)
    }

    @objc private func goldenRitualLayout() {
        goldenRitualCard(goldenRitualSection)
    }

    private func goldenRitualCard(_ goldenRitualRecord: (() -> Void)?) {
        isUserInteractionEnabled = false
        let goldenRitualItem = UIAccessibility.isReduceMotionEnabled ? 0.01 : 0.2
        UIView.animate(withDuration: goldenRitualItem, animations: {
            self.alpha = 0
            self.goldenRitualArtwork.transform = CGAffineTransform(scaleX: 0.94, y: 0.94)
        }) { _ in
            self.removeFromSuperview()
            goldenRitualRecord?()
        }
    }

    static func goldenRitualSelection(
        _ goldenRitualImage: UIViewController,
        goldenRitualChoice: String,
        goldenRitualCanvas: String,
        goldenRitualScroll: String = "",
        goldenRitualHeader: String = "Got It",
        goldenRitualArtwork: ChovviThermalRoast = .warm,
        goldenRitualCollection: (() -> Void)? = nil,
        goldenRitualStack: (() -> Void)? = nil
    ) {
        goldenRitualImage.view.endEditing(true)
        goldenRitualImage.view.viewWithTag(goldenRitualChoiceHash)?.removeFromSuperview()
        let goldenRitualState = ChovviThermalAlertView(frame: .zero)
        goldenRitualState.tag = goldenRitualChoiceHash
        goldenRitualState.goldenRitualRender.text = goldenRitualChoice
        goldenRitualState.goldenRitualAction.text = goldenRitualCanvas
        goldenRitualState.goldenRitualLabel.setTitle(goldenRitualScroll, for: .normal)
        goldenRitualState.goldenRitualLabel.isHidden = goldenRitualScroll.isEmpty
        goldenRitualState.goldenRitualCanvas?.constant = goldenRitualScroll.isEmpty ? 0 : 50
        goldenRitualState.goldenRitualLabel.setTitleColor(UIColor(red: 0.38, green: 0.37, blue: 0.44, alpha: 1), for: .normal)
        goldenRitualState.goldenRitualLabel.backgroundColor = UIColor(red: 0.94, green: 0.92, blue: 0.88, alpha: 1)
        goldenRitualState.goldenRitualStatus.setTitle(goldenRitualHeader, for: .normal)
        goldenRitualState.goldenRitualRoute = goldenRitualCollection
        goldenRitualState.goldenRitualSection = goldenRitualStack
        goldenRitualState.goldenRitualSource(goldenRitualArtwork)
        goldenRitualState.alpha = 0
        goldenRitualState.goldenRitualArtwork.transform = CGAffineTransform(scaleX: 0.86, y: 0.86).translatedBy(x: 0, y: 14)
        goldenRitualImage.view.addSubview(goldenRitualState)
        NSLayoutConstraint.activate([
            goldenRitualState.topAnchor.constraint(equalTo: goldenRitualImage.view.topAnchor), goldenRitualState.leadingAnchor.constraint(equalTo: goldenRitualImage.view.leadingAnchor), goldenRitualState.trailingAnchor.constraint(equalTo: goldenRitualImage.view.trailingAnchor),
            goldenRitualState.bottomAnchor.constraint(equalTo: goldenRitualImage.view.bottomAnchor)
        ])
        goldenRitualImage.view.layoutIfNeeded()
        let goldenRitualRender = UIAccessibility.isReduceMotionEnabled ? 0.01 : 0.34
        UIView.animate(withDuration: goldenRitualRender, delay: 0, usingSpringWithDamping: 0.78, initialSpringVelocity: 0.55) {
            goldenRitualState.alpha = 1
            goldenRitualState.goldenRitualArtwork.transform = .identity
        }
        switch goldenRitualArtwork {
        case .success:
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        case .caution, .destructive:
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
        case .warm:
            UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        }
        UIAccessibility.post(notification: .screenChanged, argument: goldenRitualState.goldenRitualRender)
    }

    private static var goldenRitualChoiceHash: Int { goldenRitualChoice }
}
