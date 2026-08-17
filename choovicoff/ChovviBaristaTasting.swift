import PhotosUI
import UIKit

final class ChovviBaristaTasting: UIViewController, PHPickerViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate {
    private let beanIdentityCanvas = UIScrollView()
    private let beanIdentityScroll = UIStackView()
    private let beanIdentityHeader = UIButton(type: .custom)
    private let beanIdentityArtwork = UITextField()
    private let beanIdentityCollection = UITextView()
    private let beanIdentityStack = UILabel()
    private var beanIdentityState: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        beanIdentityRender()
        beanIdentityAction()
        beanIdentityTrigger()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func beanIdentityRender() { beanIdentityRenderTrigger() }

    private lazy var beanIdentityRenderTrigger: () -> Void = { [unowned self] in
        view.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.99, alpha: 1)
        beanIdentityCanvas.alwaysBounceVertical = true
        beanIdentityCanvas.keyboardDismissMode = .interactive
        beanIdentityCanvas.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(beanIdentityCanvas)

        beanIdentityScroll.axis = .vertical
        beanIdentityScroll.spacing = 12
        beanIdentityScroll.translatesAutoresizingMaskIntoConstraints = false
        beanIdentityCanvas.addSubview(beanIdentityScroll)

        let beanIdentityLabel = UIView()
        beanIdentityLabel.heightAnchor.constraint(equalToConstant: 62).isActive = true
        let beanIdentityStatus = UIButton(type: .system)
        beanIdentityStatus.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        beanIdentityStatus.tintColor = .black
        beanIdentityStatus.backgroundColor = .white
        beanIdentityStatus.layer.cornerRadius = 25
        beanIdentityStatus.layer.borderWidth = 1
        beanIdentityStatus.layer.borderColor = UIColor.systemGray5.cgColor
        beanIdentityStatus.addTarget(self, action: #selector(beanIdentityRoute), for: .touchUpInside)
        beanIdentityStatus.translatesAutoresizingMaskIntoConstraints = false
        beanIdentityLabel.addSubview(beanIdentityStatus)
        let beanIdentitySection = UILabel()
        beanIdentitySection.text = String.chovviUnmask("E0dHihtX GPDrvoDfAiNlYeq")
        beanIdentitySection.font = .systemFont(ofSize: 28, weight: .black)
        beanIdentitySection.textColor = UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1)
        beanIdentitySection.translatesAutoresizingMaskIntoConstraints = false
        beanIdentityLabel.addSubview(beanIdentitySection)
        NSLayoutConstraint.activate([
            beanIdentityStatus.leadingAnchor.constraint(equalTo: beanIdentityLabel.leadingAnchor), beanIdentityStatus.centerYAnchor.constraint(equalTo: beanIdentityLabel.centerYAnchor), beanIdentityStatus.widthAnchor.constraint(equalToConstant: 50),
            beanIdentityStatus.heightAnchor.constraint(equalTo: beanIdentityStatus.widthAnchor), beanIdentitySection.leadingAnchor.constraint(equalTo: beanIdentityStatus.trailingAnchor, constant: 16), beanIdentitySection.centerYAnchor.constraint(equalTo: beanIdentityStatus.centerYAnchor),
            beanIdentitySection.trailingAnchor.constraint(lessThanOrEqualTo: beanIdentityLabel.trailingAnchor)
        ])
        beanIdentityScroll.addArrangedSubview(beanIdentityLabel)
        beanIdentityScroll.setCustomSpacing(42, after: beanIdentityLabel)

        let beanIdentityPreview = UIView()
        beanIdentityPreview.heightAnchor.constraint(equalToConstant: 178).isActive = true
        beanIdentityHeader.imageView?.contentMode = .scaleAspectFill
        beanIdentityHeader.contentHorizontalAlignment = .fill
        beanIdentityHeader.contentVerticalAlignment = .fill
        beanIdentityHeader.clipsToBounds = true
        beanIdentityHeader.layer.cornerRadius = 72
        beanIdentityHeader.backgroundColor = UIColor(red: 0.93, green: 0.94, blue: 0.95, alpha: 1)
        beanIdentityHeader.addTarget(self, action: #selector(beanIdentitySource), for: .touchUpInside)
        beanIdentityHeader.translatesAutoresizingMaskIntoConstraints = false
        beanIdentityPreview.addSubview(beanIdentityHeader)
        let beanIdentityLayout = UIButton(type: .system)
        beanIdentityLayout.setImage(UIImage(systemName: String.chovviUnmask("cdaVmJexrPao.YfGielTl3")), for: .normal)
        beanIdentityLayout.tintColor = .white
        beanIdentityLayout.backgroundColor = UIColor(red: 1, green: 0.52, blue: 0, alpha: 1)
        beanIdentityLayout.layer.cornerRadius = 21
        beanIdentityLayout.addTarget(self, action: #selector(beanIdentitySource), for: .touchUpInside)
        beanIdentityLayout.translatesAutoresizingMaskIntoConstraints = false
        beanIdentityPreview.addSubview(beanIdentityLayout)
        NSLayoutConstraint.activate([
            beanIdentityHeader.centerXAnchor.constraint(equalTo: beanIdentityPreview.centerXAnchor), beanIdentityHeader.topAnchor.constraint(equalTo: beanIdentityPreview.topAnchor), beanIdentityHeader.widthAnchor.constraint(equalToConstant: 144),
            beanIdentityHeader.heightAnchor.constraint(equalTo: beanIdentityHeader.widthAnchor), beanIdentityLayout.trailingAnchor.constraint(equalTo: beanIdentityHeader.trailingAnchor, constant: 4), beanIdentityLayout.bottomAnchor.constraint(equalTo: beanIdentityHeader.bottomAnchor, constant: 2),
            beanIdentityLayout.widthAnchor.constraint(equalToConstant: 42), beanIdentityLayout.heightAnchor.constraint(equalTo: beanIdentityLayout.widthAnchor)
        ])
        beanIdentityScroll.addArrangedSubview(beanIdentityPreview)
        beanIdentityScroll.setCustomSpacing(30, after: beanIdentityPreview)

        let beanIdentityTrigger = UILabel()
        beanIdentityTrigger.text = String.chovviUnmask("UNSkEnRFNgArMQEC")
        beanIdentityTrigger.font = .systemFont(ofSize: 13, weight: .bold)
        beanIdentityTrigger.textColor = UIColor(red: 0.18, green: 0.18, blue: 0.23, alpha: 1)
        beanIdentityScroll.addArrangedSubview(beanIdentityTrigger)
        beanIdentityArtwork.backgroundColor = UIColor(red: 0.93, green: 0.95, blue: 0.96, alpha: 1)
        beanIdentityArtwork.layer.cornerRadius = 13
        beanIdentityArtwork.placeholder = "coffeelover99"
        beanIdentityArtwork.returnKeyType = .next
        beanIdentityArtwork.delegate = self
        beanIdentityArtwork.beanIdentityRecord(16)
        beanIdentityArtwork.heightAnchor.constraint(equalToConstant: 54).isActive = true
        beanIdentityScroll.addArrangedSubview(beanIdentityArtwork)
        beanIdentityScroll.setCustomSpacing(16, after: beanIdentityArtwork)

        let beanIdentityMenu = UILabel()
        beanIdentityMenu.text = "DESCRIPTION"
        beanIdentityMenu.font = .systemFont(ofSize: 13, weight: .bold)
        beanIdentityMenu.textColor = UIColor(red: 0.18, green: 0.18, blue: 0.23, alpha: 1)
        beanIdentityScroll.addArrangedSubview(beanIdentityMenu)
        let beanIdentityUpdate = UIView()
        beanIdentityUpdate.backgroundColor = UIColor(red: 0.93, green: 0.95, blue: 0.96, alpha: 1)
        beanIdentityUpdate.layer.cornerRadius = 13
        beanIdentityUpdate.heightAnchor.constraint(equalToConstant: 120).isActive = true
        beanIdentityCollection.backgroundColor = .clear
        beanIdentityCollection.font = .systemFont(ofSize: 16, weight: .regular)
        beanIdentityCollection.textColor = UIColor(red: 0.18, green: 0.18, blue: 0.23, alpha: 1)
        beanIdentityCollection.delegate = self
        beanIdentityCollection.translatesAutoresizingMaskIntoConstraints = false
        beanIdentityUpdate.addSubview(beanIdentityCollection)
        beanIdentityStack.text = String.chovviUnmask("H2oRwT PwuoruKlmdL sysoduF alQi7k1ez jtRoZ MiHn7tqrsosdquicpeR Ny7okuRrDsreslmfK?Y")
        beanIdentityStack.font = .systemFont(ofSize: 16, weight: .regular)
        beanIdentityStack.textColor = .placeholderText
        beanIdentityStack.numberOfLines = 0
        beanIdentityStack.translatesAutoresizingMaskIntoConstraints = false
        beanIdentityUpdate.addSubview(beanIdentityStack)
        NSLayoutConstraint.activate([
            beanIdentityCollection.topAnchor.constraint(equalTo: beanIdentityUpdate.topAnchor, constant: 10), beanIdentityCollection.leadingAnchor.constraint(equalTo: beanIdentityUpdate.leadingAnchor, constant: 12), beanIdentityCollection.trailingAnchor.constraint(equalTo: beanIdentityUpdate.trailingAnchor, constant: -12),
            beanIdentityCollection.bottomAnchor.constraint(equalTo: beanIdentityUpdate.bottomAnchor, constant: -10), beanIdentityStack.topAnchor.constraint(equalTo: beanIdentityUpdate.topAnchor, constant: 18), beanIdentityStack.leadingAnchor.constraint(equalTo: beanIdentityUpdate.leadingAnchor, constant: 16),
            beanIdentityStack.trailingAnchor.constraint(lessThanOrEqualTo: beanIdentityUpdate.trailingAnchor, constant: -16)
        ])
        beanIdentityScroll.addArrangedSubview(beanIdentityUpdate)
        beanIdentityScroll.setCustomSpacing(42, after: beanIdentityUpdate)

        let beanIdentityDestination = UIButton(type: .system)
        beanIdentityDestination.setTitle("Save", for: .normal)
        beanIdentityDestination.setTitleColor(.white, for: .normal)
        beanIdentityDestination.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        beanIdentityDestination.backgroundColor = ChovviCuppingBrew.cupKeeperStack
        beanIdentityDestination.layer.cornerRadius = 28
        beanIdentityDestination.addTarget(self, action: #selector(beanIdentityCard), for: .touchUpInside)
        beanIdentityDestination.heightAnchor.constraint(equalToConstant: 56).isActive = true
        beanIdentityScroll.addArrangedSubview(beanIdentityDestination)

        NSLayoutConstraint.activate([
            beanIdentityCanvas.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), beanIdentityCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor), beanIdentityCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            beanIdentityCanvas.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), beanIdentityScroll.topAnchor.constraint(equalTo: beanIdentityCanvas.contentLayoutGuide.topAnchor, constant: 18), beanIdentityScroll.leadingAnchor.constraint(equalTo: beanIdentityCanvas.contentLayoutGuide.leadingAnchor, constant: 24),
            beanIdentityScroll.trailingAnchor.constraint(equalTo: beanIdentityCanvas.contentLayoutGuide.trailingAnchor, constant: -24), beanIdentityScroll.bottomAnchor.constraint(equalTo: beanIdentityCanvas.contentLayoutGuide.bottomAnchor, constant: -34), beanIdentityScroll.widthAnchor.constraint(equalTo: beanIdentityCanvas.frameLayoutGuide.widthAnchor, constant: -48)
        ])
    }

    private func beanIdentityAction() {
        NotificationCenter.default.addObserver(self, selector: #selector(beanIdentityItem(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(beanIdentitySelection(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        let beanIdentityImage = UITapGestureRecognizer(target: self, action: #selector(beanIdentityChoice))
        beanIdentityImage.cancelsTouchesInView = false
        beanIdentityCanvas.addGestureRecognizer(beanIdentityImage)
    }

    private func beanIdentityTrigger() {
        let beanIdentityLabel = ChovviCitrusBrew.roastArchiveCanvas.first { $0.chovviBotanicalAcidity == String.chovviUnmask("cXhiocvnvQil-runsTe3rC-82r0z") }!
        beanIdentityArtwork.text = UserDefaults.standard.string(forKey: String.chovviUnmask("c8hooVvLv3iMCxuJpNpTi5nhg5TmeXxsthuxree1")) ?? beanIdentityLabel.chovviBotanicalAeropress
        beanIdentityCollection.text = UserDefaults.standard.string(forKey: "chovviCuppingVarietal") ?? beanIdentityLabel.chovviBotanicalBatch
        let beanIdentityStatus = UserDefaults.standard.string(forKey: "chovviCuppingRoast") ?? beanIdentityLabel.chovviBotanicalAroma
        beanIdentityHeader.setImage(beanIdentityImage(beanIdentityStatus), for: .normal)
        beanIdentityStack.isHidden = !beanIdentityCollection.text.isEmpty
    }

    @objc private func beanIdentityRoute() {
        dismiss(animated: true)
    }

    @objc private func beanIdentitySource() {
        var beanIdentityMenu = PHPickerConfiguration(photoLibrary: .shared())
        beanIdentityMenu.filter = .images
        beanIdentityMenu.selectionLimit = 1
        let beanIdentityUpdate = PHPickerViewController(configuration: beanIdentityMenu)
        beanIdentityUpdate.delegate = self
        present(beanIdentityUpdate, animated: true)
    }

    func picker(_ beanIdentityRecord: PHPickerViewController, didFinishPicking beanIdentityItem: [PHPickerResult]) {
        beanIdentityRecord.dismiss(animated: true)
        guard let beanIdentitySelection = beanIdentityItem.first?.itemProvider,
              beanIdentitySelection.canLoadObject(ofClass: UIImage.self) else { return }
        beanIdentitySelection.loadObject(ofClass: UIImage.self) { [weak self] beanIdentityImage, _ in
            guard let beanIdentityChoice = beanIdentityImage as? UIImage else { return }
            DispatchQueue.main.async {
                self?.beanIdentityState = beanIdentityChoice
                self?.beanIdentityHeader.setImage(beanIdentityChoice, for: .normal)
            }
        }
    }

    @objc private func beanIdentityCard() {
        view.endEditing(true)
        guard UserDefaults.standard.bool(forKey: String.chovviUnmask("cChmojoTvriWlQoPg5iAnB")) else {
            beanIdentityMenu("Sign in required", beanIdentityMenu: String.chovviUnmask("STi4gZn3 WiQnx UakgXaLiMnM CbdeQfzoErgea UuiprdtaptYiBnEgp qymoru5rC 3pZrDoZfaiVlveG.l"))
            return
        }
        let beanIdentityLabel = beanIdentityArtwork.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let beanIdentityStatus = beanIdentityCollection.text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !beanIdentityLabel.isEmpty, !beanIdentityStatus.isEmpty else {
            beanIdentityMenu("Complete both fields", beanIdentityMenu: String.chovviUnmask("Azd4d5 TaL BucsfeRrUnjalm1e0 oadnudL qav DswhRokrQtN hdLensTcprxi1prtRivoMn1.g"))
            return
        }
        guard beanIdentityLabel.count <= 30, beanIdentityStatus.count <= 180 else {
            beanIdentityMenu(String.chovviUnmask("PUr2orfEiSl2er 7iws4 rtKo1o5 plFoQnYgH"), beanIdentityMenu: String.chovviUnmask("Uts8e0 LurpU 5tsoZ m3S0v fcPhxamrRaActtXe2rZsl AfnoKrF Kt6hUeC wupsueprZnqafmeeK SaHnTdp k1I8v0s IcehmaHrLabcwtLeIrps3 dfWotrs Yt5h5eK od2e0sOcMrJiXpytAiFo2n9.U"))
            return
        }
        let beanIdentityRoute = beanIdentityState.flatMap { beanIdentityDestination($0) }
            ?? UserDefaults.standard.string(forKey: "chovviCuppingRoast")
            ?? "chovviAromaticKettle"
        UserDefaults.standard.set(beanIdentityLabel, forKey: String.chovviUnmask("cuhKoSvYvxiLCVupphpEizn8gbTIe5xQtruor9eL"))
        UserDefaults.standard.set(beanIdentityStatus, forKey: "chovviCuppingVarietal")
        UserDefaults.standard.set(beanIdentityRoute, forKey: "chovviCuppingRoast")
        let beanIdentitySection = UserDefaults.standard.string(forKey: "hooviEmail")?.lowercased() ?? ""
        var beanIdentityPreview = UserDefaults.standard.data(forKey: String.chovviUnmask("c2h6oLvhvMiJGIe9nmtWlJeSTteWxAtduBrGe2"))
            .flatMap { try? JSONDecoder().decode([ChovviGentleTexture].self, from: $0) } ?? []
        if let beanIdentityTrigger = beanIdentityPreview.firstIndex(where: { $0.beanPassportCanvas.lowercased() == beanIdentitySection }) {
            let beanIdentityLayout = beanIdentityPreview[beanIdentityTrigger]
            beanIdentityPreview[beanIdentityTrigger] = ChovviGentleTexture(
                beanPassportCanvas: beanIdentityLayout.beanPassportCanvas,
                beanPassportScroll: beanIdentityLayout.beanPassportScroll,
                beanPassportHeader: beanIdentityLabel,
                beanPassportArtwork: beanIdentityStatus,
                beanPassportCollection: beanIdentityRoute
            )
            if let beanIdentitySource = try? JSONEncoder().encode(beanIdentityPreview) {
                UserDefaults.standard.set(beanIdentitySource, forKey: String.chovviUnmask("cohwoEvav0iZGWeVndthlTewTzeAxOtkuYrheY"))
            }
        }
        dismiss(animated: true)
    }

    private func beanIdentityDestination(_ beanIdentityItem: UIImage) -> String? {
        guard let beanIdentitySelection = beanIdentityItem.jpegData(compressionQuality: 0.84),
              let beanIdentityImage = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let beanIdentityChoice = beanIdentityImage.appendingPathComponent(String.chovviUnmask("pvrIomfpiXlmer-F") + UUID().uuidString + String.chovviUnmask(".yjEpRg6"))
        try? beanIdentitySelection.write(to: beanIdentityChoice, options: .atomic)
        return beanIdentityChoice.path
    }

    private func beanIdentityImage(_ beanIdentityChoice: String) -> UIImage? {
        beanIdentityChoice.hasPrefix("/") ? UIImage(contentsOfFile: beanIdentityChoice) : UIImage(named: beanIdentityChoice)
    }

    private func beanIdentityMenu(_ beanIdentityUpdate: String, beanIdentityMenu beanIdentityDestination: String) {
        ChovviThermalAlertView.amberRitualSelection(self, amberRitualChoice: beanIdentityUpdate, amberRitualCanvas: beanIdentityDestination)
    }

    @objc private func beanIdentityItem(_ beanIdentitySelection: Notification) {
        guard let beanIdentityImage = beanIdentitySelection.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let beanIdentityChoice = max(0, view.bounds.maxY - view.convert(beanIdentityImage, from: nil).minY)
        beanIdentityCanvas.contentInset.bottom = beanIdentityChoice
        beanIdentityCanvas.verticalScrollIndicatorInsets.bottom = beanIdentityChoice
    }

    @objc private func beanIdentitySelection(_ beanIdentityImage: Notification) {
        _ = beanIdentityImage
        beanIdentityCanvas.contentInset.bottom = 0
        beanIdentityCanvas.verticalScrollIndicatorInsets.bottom = 0
    }

    @objc private func beanIdentityChoice() {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ beanIdentityItem: UITextField) -> Bool {
        beanIdentityCollection.becomeFirstResponder()
        return true
    }

    func textViewDidChange(_ beanIdentityItem: UITextView) {
        beanIdentityStack.isHidden = !beanIdentityItem.text.isEmpty
    }
}

private extension UITextField {
    func beanIdentityRecord(_ beanIdentityItem: CGFloat) {
        let beanIdentitySelection = UIView(frame: CGRect(x: 0, y: 0, width: beanIdentityItem, height: 1))
        leftView = beanIdentitySelection
        leftViewMode = .always
        let beanIdentityImage = UIView(frame: CGRect(x: 0, y: 0, width: beanIdentityItem, height: 1))
        rightView = beanIdentityImage
        rightViewMode = .always
    }
}
