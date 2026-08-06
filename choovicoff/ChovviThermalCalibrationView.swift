import UIKit

final class ChovviThermalCalibrationView: UIView {
    private static let goldenRitualCanvas = 80_962_768
    private let goldenRitualScroll = UIActivityIndicatorView(style: .medium)
    private let goldenRitualHeader = UILabel()
    private let goldenRitualArtwork = UIView()
    private let goldenRitualCollection = UIView()
    private let goldenRitualStack = UIImageView(image: UIImage(systemName: "cup.and.saucer.fill"))

    private override init(frame: CGRect) {
        super.init(frame: frame)
        goldenRitualPreview()
    }

    required init?(coder: NSCoder) {
        return nil
    }

    private func goldenRitualPreview() {
        backgroundColor = UIColor.black.withAlphaComponent(0.22)
        accessibilityViewIsModal = true
        translatesAutoresizingMaskIntoConstraints = false
        goldenRitualSource()
        goldenRitualMenu()
        goldenRitualUpdate()
    }

    private func goldenRitualSource() {
        goldenRitualArtwork.backgroundColor = UIColor(red: 0.99, green: 0.97, blue: 0.93, alpha: 0.99)
        goldenRitualArtwork.layer.cornerRadius = 26
        goldenRitualArtwork.layer.cornerCurve = .continuous
        goldenRitualArtwork.layer.shadowColor = UIColor.black.cgColor
        goldenRitualArtwork.layer.shadowOpacity = 0.16
        goldenRitualArtwork.layer.shadowOffset = CGSize(width: 0, height: 10)
        goldenRitualArtwork.layer.shadowRadius = 22
        goldenRitualArtwork.translatesAutoresizingMaskIntoConstraints = false
        addSubview(goldenRitualArtwork)
    }

    private func goldenRitualMenu() {
        goldenRitualStack.tintColor = UIColor(red: 0.83, green: 0.60, blue: 0.31, alpha: 1)
        goldenRitualStack.contentMode = .scaleAspectFit
        goldenRitualStack.translatesAutoresizingMaskIntoConstraints = false
        goldenRitualArtwork.addSubview(goldenRitualStack)

        goldenRitualScroll.color = UIColor(red: 0.83, green: 0.60, blue: 0.31, alpha: 1)
        goldenRitualScroll.hidesWhenStopped = false
        goldenRitualScroll.startAnimating()
        goldenRitualScroll.translatesAutoresizingMaskIntoConstraints = false
        goldenRitualArtwork.addSubview(goldenRitualScroll)

        goldenRitualHeader.font = .systemFont(ofSize: 15, weight: .semibold)
        goldenRitualHeader.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.20, alpha: 1)
        goldenRitualHeader.textAlignment = .center
        goldenRitualHeader.numberOfLines = 2
        goldenRitualHeader.translatesAutoresizingMaskIntoConstraints = false
        goldenRitualArtwork.addSubview(goldenRitualHeader)

        goldenRitualCollection.backgroundColor = UIColor(red: 0.91, green: 0.84, blue: 0.73, alpha: 1)
        goldenRitualCollection.layer.cornerRadius = 2
        goldenRitualCollection.translatesAutoresizingMaskIntoConstraints = false
        goldenRitualArtwork.addSubview(goldenRitualCollection)
    }

    private func goldenRitualUpdate() {
        NSLayoutConstraint.activate([
            goldenRitualArtwork.centerXAnchor.constraint(equalTo: centerXAnchor), goldenRitualArtwork.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor), goldenRitualArtwork.widthAnchor.constraint(equalToConstant: 224),
            goldenRitualArtwork.heightAnchor.constraint(greaterThanOrEqualToConstant: 164), goldenRitualStack.topAnchor.constraint(equalTo: goldenRitualArtwork.topAnchor, constant: 21), goldenRitualStack.centerXAnchor.constraint(equalTo: goldenRitualArtwork.centerXAnchor, constant: -18),
            goldenRitualStack.widthAnchor.constraint(equalToConstant: 44), goldenRitualStack.heightAnchor.constraint(equalTo: goldenRitualStack.widthAnchor), goldenRitualScroll.centerYAnchor.constraint(equalTo: goldenRitualStack.centerYAnchor),
            goldenRitualScroll.leadingAnchor.constraint(equalTo: goldenRitualStack.trailingAnchor, constant: 8), goldenRitualHeader.topAnchor.constraint(equalTo: goldenRitualStack.bottomAnchor, constant: 15), goldenRitualHeader.leadingAnchor.constraint(equalTo: goldenRitualArtwork.leadingAnchor, constant: 18),
            goldenRitualHeader.trailingAnchor.constraint(equalTo: goldenRitualArtwork.trailingAnchor, constant: -18), goldenRitualCollection.topAnchor.constraint(equalTo: goldenRitualHeader.bottomAnchor, constant: 16), goldenRitualCollection.leadingAnchor.constraint(equalTo: goldenRitualArtwork.leadingAnchor, constant: 24),
            goldenRitualCollection.trailingAnchor.constraint(equalTo: goldenRitualArtwork.trailingAnchor, constant: -24), goldenRitualCollection.heightAnchor.constraint(equalToConstant: 4), goldenRitualCollection.bottomAnchor.constraint(equalTo: goldenRitualArtwork.bottomAnchor, constant: -17)
        ])
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        guard window != nil, !UIAccessibility.isReduceMotionEnabled else { return }
        let goldenRitualState = CABasicAnimation(keyPath: "transform.scale")
        goldenRitualState.fromValue = 0.94
        goldenRitualState.toValue = 1.06
        goldenRitualState.duration = 0.72
        goldenRitualState.autoreverses = true
        goldenRitualState.repeatCount = .infinity
        goldenRitualStack.layer.add(goldenRitualState, forKey: "chovviThermalBody")

        let goldenRitualRender = CABasicAnimation(keyPath: "transform.scale.x")
        goldenRitualRender.fromValue = 0.12
        goldenRitualRender.toValue = 1.0
        goldenRitualRender.duration = 0.9
        goldenRitualRender.repeatCount = .infinity
        goldenRitualRender.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        goldenRitualCollection.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
        goldenRitualCollection.layer.add(goldenRitualRender, forKey: "chovviThermalBrewer")
    }

    static func goldenRitualState(_ goldenRitualRender: UIViewController, goldenRitualAction: String) {
        guard goldenRitualRender.view.viewWithTag(goldenRitualCanvas) == nil else { return }
        let goldenRitualLabel = ChovviThermalCalibrationView(frame: .zero)
        goldenRitualLabel.tag = goldenRitualCanvas
        goldenRitualLabel.goldenRitualHeader.text = goldenRitualAction
        goldenRitualLabel.alpha = 0
        goldenRitualRender.view.addSubview(goldenRitualLabel)
        NSLayoutConstraint.activate([
            goldenRitualLabel.topAnchor.constraint(equalTo: goldenRitualRender.view.topAnchor), goldenRitualLabel.leadingAnchor.constraint(equalTo: goldenRitualRender.view.leadingAnchor), goldenRitualLabel.trailingAnchor.constraint(equalTo: goldenRitualRender.view.trailingAnchor),
            goldenRitualLabel.bottomAnchor.constraint(equalTo: goldenRitualRender.view.bottomAnchor)
        ])
        goldenRitualRender.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.18) { goldenRitualLabel.alpha = 1 }
        UIAccessibility.post(notification: .announcement, argument: goldenRitualAction)
    }

    static func goldenRitualRoute(_ goldenRitualSection: UIViewController, goldenRitualPreview: @escaping () -> Void) {
        guard let goldenRitualTrigger = goldenRitualSection.view.viewWithTag(goldenRitualCanvas) else {
            goldenRitualPreview()
            return
        }
        UIView.animate(withDuration: 0.18, animations: {
            goldenRitualTrigger.alpha = 0
        }) { _ in
            goldenRitualTrigger.removeFromSuperview()
            goldenRitualPreview()
        }
    }

    static func goldenRitualLayout(
        _ goldenRitualSource: UIViewController,
        goldenRitualMenu: String,
        goldenRitualUpdate: TimeInterval = 0.85,
        goldenRitualDestination: @escaping () -> Void
    ) {
        goldenRitualState(goldenRitualSource, goldenRitualAction: goldenRitualMenu)
        DispatchQueue.main.asyncAfter(deadline: .now() + goldenRitualUpdate) { [weak goldenRitualSource] in
            guard let goldenRitualSource else { return }
            goldenRitualRoute(goldenRitualSource, goldenRitualPreview: goldenRitualDestination)
        }
    }
}
