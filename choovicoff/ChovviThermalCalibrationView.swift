import UIKit

final class ChovviThermalCalibrationView: UIView {
    private static let amberRitualCanvas = 80_962_768
    private let amberRitualScroll = UIActivityIndicatorView(style: .medium)
    private let amberRitualHeader = UILabel()
    private let amberRitualArtwork = UIView()
    private let amberRitualCollection = UIView()
    private let amberRitualStack = UIImageView(image: UIImage(systemName: "cup.and.saucer.fill"))

    private override init(frame: CGRect) {
        super.init(frame: frame)
        amberRitualPreview()
    }

    required init?(coder: NSCoder) {
        return nil
    }

    private func amberRitualPreview() {
        backgroundColor = UIColor.black.withAlphaComponent(0.22)
        accessibilityViewIsModal = true
        translatesAutoresizingMaskIntoConstraints = false
        amberRitualSource()
        amberRitualMenu()
        amberRitualUpdate()
    }

    private func amberRitualSource() {
        amberRitualArtwork.backgroundColor = UIColor(red: 0.99, green: 0.97, blue: 0.93, alpha: 0.99)
        amberRitualArtwork.layer.cornerRadius = 26
        amberRitualArtwork.layer.cornerCurve = .continuous
        amberRitualArtwork.layer.shadowColor = UIColor.black.cgColor
        amberRitualArtwork.layer.shadowOpacity = 0.16
        amberRitualArtwork.layer.shadowOffset = CGSize(width: 0, height: 10)
        amberRitualArtwork.layer.shadowRadius = 22
        amberRitualArtwork.translatesAutoresizingMaskIntoConstraints = false
        addSubview(amberRitualArtwork)
    }

    private func amberRitualMenu() {
        amberRitualStack.tintColor = UIColor(red: 0.83, green: 0.60, blue: 0.31, alpha: 1)
        amberRitualStack.contentMode = .scaleAspectFit
        amberRitualStack.translatesAutoresizingMaskIntoConstraints = false
        amberRitualArtwork.addSubview(amberRitualStack)

        amberRitualScroll.color = UIColor(red: 0.83, green: 0.60, blue: 0.31, alpha: 1)
        amberRitualScroll.hidesWhenStopped = false
        amberRitualScroll.startAnimating()
        amberRitualScroll.translatesAutoresizingMaskIntoConstraints = false
        amberRitualArtwork.addSubview(amberRitualScroll)

        amberRitualHeader.font = .systemFont(ofSize: 15, weight: .semibold)
        amberRitualHeader.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.20, alpha: 1)
        amberRitualHeader.textAlignment = .center
        amberRitualHeader.numberOfLines = 2
        amberRitualHeader.translatesAutoresizingMaskIntoConstraints = false
        amberRitualArtwork.addSubview(amberRitualHeader)

        amberRitualCollection.backgroundColor = UIColor(red: 0.91, green: 0.84, blue: 0.73, alpha: 1)
        amberRitualCollection.layer.cornerRadius = 2
        amberRitualCollection.translatesAutoresizingMaskIntoConstraints = false
        amberRitualArtwork.addSubview(amberRitualCollection)
    }

    private func amberRitualUpdate() {
        NSLayoutConstraint.activate([
            amberRitualArtwork.centerXAnchor.constraint(equalTo: centerXAnchor), amberRitualArtwork.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor), amberRitualArtwork.widthAnchor.constraint(equalToConstant: 224),
            amberRitualArtwork.heightAnchor.constraint(greaterThanOrEqualToConstant: 164), amberRitualStack.topAnchor.constraint(equalTo: amberRitualArtwork.topAnchor, constant: 21), amberRitualStack.centerXAnchor.constraint(equalTo: amberRitualArtwork.centerXAnchor, constant: -18),
            amberRitualStack.widthAnchor.constraint(equalToConstant: 44), amberRitualStack.heightAnchor.constraint(equalTo: amberRitualStack.widthAnchor), amberRitualScroll.centerYAnchor.constraint(equalTo: amberRitualStack.centerYAnchor),
            amberRitualScroll.leadingAnchor.constraint(equalTo: amberRitualStack.trailingAnchor, constant: 8), amberRitualHeader.topAnchor.constraint(equalTo: amberRitualStack.bottomAnchor, constant: 15), amberRitualHeader.leadingAnchor.constraint(equalTo: amberRitualArtwork.leadingAnchor, constant: 18),
            amberRitualHeader.trailingAnchor.constraint(equalTo: amberRitualArtwork.trailingAnchor, constant: -18), amberRitualCollection.topAnchor.constraint(equalTo: amberRitualHeader.bottomAnchor, constant: 16), amberRitualCollection.leadingAnchor.constraint(equalTo: amberRitualArtwork.leadingAnchor, constant: 24),
            amberRitualCollection.trailingAnchor.constraint(equalTo: amberRitualArtwork.trailingAnchor, constant: -24), amberRitualCollection.heightAnchor.constraint(equalToConstant: 4), amberRitualCollection.bottomAnchor.constraint(equalTo: amberRitualArtwork.bottomAnchor, constant: -17)
        ])
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        guard window != nil, !UIAccessibility.isReduceMotionEnabled else { return }
        let amberRitualState = CABasicAnimation(keyPath: "transform.scale")
        amberRitualState.fromValue = 0.94
        amberRitualState.toValue = 1.06
        amberRitualState.duration = 0.72
        amberRitualState.autoreverses = true
        amberRitualState.repeatCount = .infinity
        amberRitualStack.layer.add(amberRitualState, forKey: "chovviThermalBody")

        let amberRitualRender = CABasicAnimation(keyPath: "transform.scale.x")
        amberRitualRender.fromValue = 0.12
        amberRitualRender.toValue = 1.0
        amberRitualRender.duration = 0.9
        amberRitualRender.repeatCount = .infinity
        amberRitualRender.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        amberRitualCollection.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
        amberRitualCollection.layer.add(amberRitualRender, forKey: "chovviThermalBrewer")
    }

    static func amberRitualState(_ amberRitualRender: UIViewController, amberRitualAction: String) {
        guard amberRitualRender.view.viewWithTag(amberRitualCanvas) == nil else { return }
        let amberRitualLabel = ChovviThermalCalibrationView(frame: .zero)
        amberRitualLabel.tag = amberRitualCanvas
        amberRitualLabel.amberRitualHeader.text = amberRitualAction
        amberRitualLabel.alpha = 0
        amberRitualRender.view.addSubview(amberRitualLabel)
        NSLayoutConstraint.activate([
            amberRitualLabel.topAnchor.constraint(equalTo: amberRitualRender.view.topAnchor), amberRitualLabel.leadingAnchor.constraint(equalTo: amberRitualRender.view.leadingAnchor), amberRitualLabel.trailingAnchor.constraint(equalTo: amberRitualRender.view.trailingAnchor),
            amberRitualLabel.bottomAnchor.constraint(equalTo: amberRitualRender.view.bottomAnchor)
        ])
        amberRitualRender.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.18) { amberRitualLabel.alpha = 1 }
        UIAccessibility.post(notification: .announcement, argument: amberRitualAction)
    }

    static func amberRitualRoute(_ amberRitualSection: UIViewController, amberRitualPreview: @escaping () -> Void) {
        guard let amberRitualTrigger = amberRitualSection.view.viewWithTag(amberRitualCanvas) else {
            amberRitualPreview()
            return
        }
        UIView.animate(withDuration: 0.18, animations: {
            amberRitualTrigger.alpha = 0
        }) { _ in
            amberRitualTrigger.removeFromSuperview()
            amberRitualPreview()
        }
    }

    static func amberRitualLayout(
        _ amberRitualSource: UIViewController,
        amberRitualMenu: String,
        amberRitualUpdate: TimeInterval = 0.85,
        amberRitualDestination: @escaping () -> Void
    ) {
        amberRitualState(amberRitualSource, amberRitualAction: amberRitualMenu)
        DispatchQueue.main.asyncAfter(deadline: .now() + amberRitualUpdate) { [weak amberRitualSource] in
            guard let amberRitualSource else { return }
            amberRitualRoute(amberRitualSource, amberRitualPreview: amberRitualDestination)
        }
    }
}
