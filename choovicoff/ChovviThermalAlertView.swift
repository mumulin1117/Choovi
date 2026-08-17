import UIKit

final class ChovviThermalAlertView: UIView {
    enum ChovviThermalRoast {
        case warm
        case success
        case caution
        case destructive
    }

    private static let amberRitualChoice = 80_962_769
    private let amberRitualArtwork = UIView()
    private let amberRitualStack = UIView()
    private let amberRitualState = UIImageView()
    private let amberRitualRender = UILabel()
    private let amberRitualAction = UILabel()
    private let amberRitualLabel = UIButton(type: .system)
    private let amberRitualStatus = UIButton(type: .system)
    private var amberRitualRoute: (() -> Void)?
    private var amberRitualSection: (() -> Void)?
    private var amberRitualCanvas: NSLayoutConstraint?

    private override init(frame: CGRect) {
        super.init(frame: frame)
        amberRitualPreview()
    }

    required init?(coder: NSCoder) {
        return nil
    }

    private func amberRitualPreview() {
        backgroundColor = UIColor(red: 0.10, green: 0.08, blue: 0.07, alpha: 0.42)
        accessibilityViewIsModal = true
        translatesAutoresizingMaskIntoConstraints = false
        amberRitualUpdate()
        amberRitualDestination()
        amberRitualRecord()
        amberRitualImage()
    }

    private func amberRitualUpdate() {
        amberRitualArtwork.backgroundColor = UIColor(red: 1.00, green: 0.98, blue: 0.94, alpha: 1)
        amberRitualArtwork.layer.cornerRadius = 28
        amberRitualArtwork.layer.cornerCurve = .continuous
        amberRitualArtwork.layer.borderWidth = 1
        amberRitualArtwork.layer.borderColor = UIColor(red: 0.88, green: 0.74, blue: 0.55, alpha: 0.45).cgColor
        amberRitualArtwork.layer.shadowColor = UIColor(red: 0.18, green: 0.10, blue: 0.05, alpha: 1).cgColor
        amberRitualArtwork.layer.shadowOpacity = 0.18
        amberRitualArtwork.layer.shadowOffset = CGSize(width: 0, height: 14)
        amberRitualArtwork.layer.shadowRadius = 28
        amberRitualArtwork.translatesAutoresizingMaskIntoConstraints = false
        addSubview(amberRitualArtwork)
    }

    private func amberRitualDestination() {
        amberRitualStack.backgroundColor = UIColor(red: 0.96, green: 0.88, blue: 0.74, alpha: 1)
        amberRitualStack.layer.cornerRadius = 29
        amberRitualStack.translatesAutoresizingMaskIntoConstraints = false
        amberRitualArtwork.addSubview(amberRitualStack)

        amberRitualState.contentMode = .scaleAspectFit
        amberRitualState.translatesAutoresizingMaskIntoConstraints = false
        amberRitualStack.addSubview(amberRitualState)

        amberRitualRender.font = .systemFont(ofSize: 22, weight: .black)
        amberRitualRender.textColor = UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1)
        amberRitualRender.textAlignment = .center
        amberRitualRender.numberOfLines = 2
        amberRitualRender.translatesAutoresizingMaskIntoConstraints = false
        amberRitualArtwork.addSubview(amberRitualRender)

        amberRitualAction.font = .systemFont(ofSize: 15, weight: .medium)
        amberRitualAction.textColor = UIColor(red: 0.38, green: 0.37, blue: 0.44, alpha: 1)
        amberRitualAction.textAlignment = .center
        amberRitualAction.numberOfLines = 0
        amberRitualAction.translatesAutoresizingMaskIntoConstraints = false
        amberRitualArtwork.addSubview(amberRitualAction)
    }

    private func amberRitualRecord() {
        [amberRitualLabel, amberRitualStatus].forEach { amberRitualTrigger in
            amberRitualTrigger.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            amberRitualTrigger.layer.cornerRadius = 15
            amberRitualTrigger.layer.cornerCurve = .continuous
            amberRitualTrigger.translatesAutoresizingMaskIntoConstraints = false
            amberRitualArtwork.addSubview(amberRitualTrigger)
        }
        amberRitualCanvas = amberRitualLabel.heightAnchor.constraint(equalToConstant: 50)
        amberRitualCanvas?.isActive = true
        amberRitualStatus.heightAnchor.constraint(equalToConstant: 50).isActive = true
        amberRitualLabel.addTarget(self, action: #selector(amberRitualTrigger), for: .touchUpInside)
        amberRitualStatus.addTarget(self, action: #selector(amberRitualLayout), for: .touchUpInside)
    }

    private func amberRitualImage() {
        NSLayoutConstraint.activate([
            amberRitualArtwork.centerXAnchor.constraint(equalTo: centerXAnchor), amberRitualArtwork.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor), amberRitualArtwork.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            amberRitualArtwork.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -24), amberRitualArtwork.widthAnchor.constraint(lessThanOrEqualToConstant: 336), 
            amberRitualStack.topAnchor.constraint(equalTo: amberRitualArtwork.topAnchor, constant: 24), amberRitualStack.centerXAnchor.constraint(equalTo: amberRitualArtwork.centerXAnchor), amberRitualStack.widthAnchor.constraint(equalToConstant: 58),
            amberRitualStack.heightAnchor.constraint(equalTo: amberRitualStack.widthAnchor), amberRitualState.centerXAnchor.constraint(equalTo: amberRitualStack.centerXAnchor), amberRitualState.centerYAnchor.constraint(equalTo: amberRitualStack.centerYAnchor),
            amberRitualState.widthAnchor.constraint(equalToConstant: 29), amberRitualState.heightAnchor.constraint(equalTo: amberRitualState.widthAnchor), 
            amberRitualRender.topAnchor.constraint(equalTo: amberRitualStack.bottomAnchor, constant: 15), amberRitualRender.leadingAnchor.constraint(equalTo: amberRitualArtwork.leadingAnchor, constant: 24), amberRitualRender.trailingAnchor.constraint(equalTo: amberRitualArtwork.trailingAnchor, constant: -24),
            amberRitualAction.topAnchor.constraint(equalTo: amberRitualRender.bottomAnchor, constant: 9), amberRitualAction.leadingAnchor.constraint(equalTo: amberRitualArtwork.leadingAnchor, constant: 24), amberRitualAction.trailingAnchor.constraint(equalTo: amberRitualArtwork.trailingAnchor, constant: -24),
             amberRitualStatus.topAnchor.constraint(equalTo: amberRitualAction.bottomAnchor, constant: 22), amberRitualStatus.leadingAnchor.constraint(equalTo: amberRitualArtwork.leadingAnchor, constant: 20),
            amberRitualStatus.trailingAnchor.constraint(equalTo: amberRitualArtwork.trailingAnchor, constant: -20), amberRitualLabel.topAnchor.constraint(equalTo: amberRitualStatus.bottomAnchor, constant: 10), amberRitualLabel.leadingAnchor.constraint(equalTo: amberRitualStatus.leadingAnchor),
            amberRitualLabel.trailingAnchor.constraint(equalTo: amberRitualStatus.trailingAnchor), amberRitualLabel.bottomAnchor.constraint(equalTo: amberRitualArtwork.bottomAnchor, constant: -20)
        ])
        let amberRitualTrigger = amberRitualArtwork.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -48)
        amberRitualTrigger.priority = .defaultHigh
        amberRitualTrigger.isActive = true
    }

    private func amberRitualSource(_ amberRitualMenu: ChovviThermalRoast) {
        let amberRitualUpdate: UIColor
        let amberRitualDestination: String
        switch amberRitualMenu {
        case .warm:
            amberRitualUpdate = UIColor(red: 0.84, green: 0.61, blue: 0.32, alpha: 1)
            amberRitualDestination = "cup.and.saucer.fill"
        case .success:
            amberRitualUpdate = UIColor(red: 0.39, green: 0.59, blue: 0.39, alpha: 1)
            amberRitualDestination = "checkmark"
        case .caution:
            amberRitualUpdate = UIColor(red: 0.91, green: 0.58, blue: 0.18, alpha: 1)
            amberRitualDestination = "exclamationmark"
        case .destructive:
            amberRitualUpdate = UIColor(red: 0.76, green: 0.29, blue: 0.25, alpha: 1)
            amberRitualDestination = "hand.raised.fill"
        }
        amberRitualStack.backgroundColor = amberRitualUpdate.withAlphaComponent(0.16)
        amberRitualState.image = UIImage(systemName: amberRitualDestination)
        amberRitualState.tintColor = amberRitualUpdate
        amberRitualStatus.backgroundColor = amberRitualUpdate
        amberRitualStatus.setTitleColor(.white, for: .normal)
    }

    @objc private func amberRitualTrigger() {
        amberRitualCard(amberRitualRoute)
    }

    @objc private func amberRitualLayout() {
        amberRitualCard(amberRitualSection)
    }

    private func amberRitualCard(_ amberRitualRecord: (() -> Void)?) {
        isUserInteractionEnabled = false
        let amberRitualItem = UIAccessibility.isReduceMotionEnabled ? 0.01 : 0.2
        UIView.animate(withDuration: amberRitualItem, animations: {
            self.alpha = 0
            self.amberRitualArtwork.transform = CGAffineTransform(scaleX: 0.94, y: 0.94)
        }) { _ in
            self.removeFromSuperview()
            amberRitualRecord?()
        }
    }

    static func amberRitualSelection(
        _ amberRitualImage: UIViewController,
        amberRitualChoice: String,
        amberRitualCanvas: String,
        amberRitualScroll: String = "",
        amberRitualHeader: String = "Got It",
        amberRitualArtwork: ChovviThermalRoast = .warm,
        amberRitualCollection: (() -> Void)? = nil,
        amberRitualStack: (() -> Void)? = nil
    ) {
        amberRitualImage.view.endEditing(true)
        amberRitualImage.view.viewWithTag(amberRitualChoiceHash)?.removeFromSuperview()
        let amberRitualState = ChovviThermalAlertView(frame: .zero)
        amberRitualState.tag = amberRitualChoiceHash
        amberRitualState.amberRitualRender.text = amberRitualChoice
        amberRitualState.amberRitualAction.text = amberRitualCanvas
        amberRitualState.amberRitualLabel.setTitle(amberRitualScroll, for: .normal)
        amberRitualState.amberRitualLabel.isHidden = amberRitualScroll.isEmpty
        amberRitualState.amberRitualCanvas?.constant = amberRitualScroll.isEmpty ? 0 : 50
        amberRitualState.amberRitualLabel.setTitleColor(UIColor(red: 0.38, green: 0.37, blue: 0.44, alpha: 1), for: .normal)
        amberRitualState.amberRitualLabel.backgroundColor = UIColor(red: 0.94, green: 0.92, blue: 0.88, alpha: 1)
        amberRitualState.amberRitualStatus.setTitle(amberRitualHeader, for: .normal)
        amberRitualState.amberRitualRoute = amberRitualCollection
        amberRitualState.amberRitualSection = amberRitualStack
        amberRitualState.amberRitualSource(amberRitualArtwork)
        amberRitualState.alpha = 0
        amberRitualState.amberRitualArtwork.transform = CGAffineTransform(scaleX: 0.86, y: 0.86).translatedBy(x: 0, y: 14)
        amberRitualImage.view.addSubview(amberRitualState)
        NSLayoutConstraint.activate([
            amberRitualState.topAnchor.constraint(equalTo: amberRitualImage.view.topAnchor), amberRitualState.leadingAnchor.constraint(equalTo: amberRitualImage.view.leadingAnchor), amberRitualState.trailingAnchor.constraint(equalTo: amberRitualImage.view.trailingAnchor),
            amberRitualState.bottomAnchor.constraint(equalTo: amberRitualImage.view.bottomAnchor)
        ])
        amberRitualImage.view.layoutIfNeeded()
        let amberRitualRender = UIAccessibility.isReduceMotionEnabled ? 0.01 : 0.34
        UIView.animate(withDuration: amberRitualRender, delay: 0, usingSpringWithDamping: 0.78, initialSpringVelocity: 0.55) {
            amberRitualState.alpha = 1
            amberRitualState.amberRitualArtwork.transform = .identity
        }
        switch amberRitualArtwork {
        case .success:
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        case .caution, .destructive:
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
        case .warm:
            UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        }
        UIAccessibility.post(notification: .screenChanged, argument: amberRitualState.amberRitualRender)
    }

    private static var amberRitualChoiceHash: Int { amberRitualChoice }
}
