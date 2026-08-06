import UIKit

struct ChovviGentleTexture: Codable, Hashable {
    let beanPassportCanvas: String
    let beanPassportScroll: String
    let beanPassportHeader: String
    let beanPassportArtwork: String
    let beanPassportCollection: String

    private enum CodingKeys: String, CodingKey {
        case beanPassportCanvas = "chovviGentleAcidity"
        case beanPassportScroll = "chovviGentleAeropress"
        case beanPassportHeader = "chovviGentleAftertaste"
        case beanPassportArtwork = "chovviGentleAroma"
        case beanPassportCollection = "chovviGentleBatch"
    }
}

final class ChovviFragrantProfile: UIViewController {
    private var firstSipCanvas = false
    private let firstSipScroll = UIScrollView()
    private let firstSipHeader = UIStackView()
    private let firstSipArtwork = UIButton(type: .system)
    private static let firstSipCollection = UIColor(red: 0.84, green: 0.61, blue: 0.31, alpha: 1)
    private static let firstSipStack = UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        firstSipState()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firstSipRender()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard !firstSipCanvas, !UserDefaults.standard.bool(forKey: "chovviFragrantTexture") else { return }
        firstSipCanvas = true
        firstSipAction(true)
    }

    private func firstSipState() { firstSipStateTrigger() }

    private lazy var firstSipStateTrigger: () -> Void = { [unowned self] in
        title = "Welcome"
        view.backgroundColor = UIColor(red: 0.98, green: 0.95, blue: 0.90, alpha: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(firstSipLabel))
        navigationController?.navigationBar.tintColor = .black

        firstSipScroll.alwaysBounceVertical = true
        firstSipScroll.showsVerticalScrollIndicator = false
        firstSipScroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstSipScroll)
        firstSipHeader.axis = .vertical
        firstSipHeader.alignment = .fill
        firstSipHeader.spacing = 13
        firstSipHeader.translatesAutoresizingMaskIntoConstraints = false
        firstSipScroll.addSubview(firstSipHeader)

        let firstSipState = UIButton(type: .system)
        firstSipState.setTitle("EULA", for: .normal)
        firstSipState.setTitleColor(Self.firstSipCollection, for: .normal)
        firstSipState.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        firstSipState.contentHorizontalAlignment = .right
        firstSipState.addTarget(self, action: #selector(firstSipStatus), for: .touchUpInside)
        firstSipState.heightAnchor.constraint(equalToConstant: 34).isActive = true
        firstSipHeader.addArrangedSubview(firstSipState)

        let firstSipRender = UIImageView(image: UIImage(named: "cup.and.saucer.fill"))
       
        firstSipRender.contentMode = .scaleAspectFit
        firstSipHeader.addArrangedSubview(firstSipRender)
        firstSipRender.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.34).isActive = true

        let firstSipAction = UIImageView(image: UIImage(named: "Center Brand"))
        
        firstSipAction.widthAnchor.constraint(equalToConstant: 69).isActive = true
      
        firstSipHeader.addArrangedSubview(firstSipAction)

       
        let firstSipStatus = firstSipRoute("Log In", firstSipSection: Self.firstSipCollection, firstSipPreview: #selector(firstSipTrigger))
        firstSipHeader.addArrangedSubview(firstSipStatus)
        let firstSipRoute = firstSipRoute("Create Account", firstSipSection: Self.firstSipStack, firstSipPreview: #selector(firstSipLayout))
        firstSipHeader.addArrangedSubview(firstSipRoute)
        firstSipHeader.setCustomSpacing(28, after: firstSipRoute)

        firstSipArtwork.setTitleColor(.secondaryLabel, for: .normal)
        firstSipArtwork.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        firstSipArtwork.titleLabel?.numberOfLines = 2
        firstSipArtwork.contentHorizontalAlignment = .left
        firstSipArtwork.addTarget(self, action: #selector(firstSipSource), for: .touchUpInside)
        firstSipHeader.addArrangedSubview(firstSipArtwork)

        let firstSipSection = UIStackView()
        firstSipSection.axis = .horizontal
        firstSipSection.distribution = .fillEqually
        firstSipSection.spacing = 12
        let firstSipPreview = UIButton(type: .system)
        firstSipPreview.setTitle("Terms of Service", for: .normal)
        firstSipPreview.setTitleColor(Self.firstSipCollection, for: .normal)
        firstSipPreview.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        firstSipPreview.tag = 0
        firstSipPreview.addTarget(self, action: #selector(firstSipMenu(_:)), for: .touchUpInside)
        let firstSipTrigger = UIButton(type: .system)
        firstSipTrigger.setTitle("Privacy Policy", for: .normal)
        firstSipTrigger.setTitleColor(Self.firstSipCollection, for: .normal)
        firstSipTrigger.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        firstSipTrigger.tag = 1
        firstSipTrigger.addTarget(self, action: #selector(firstSipMenu(_:)), for: .touchUpInside)
        firstSipSection.addArrangedSubview(firstSipPreview)
        firstSipSection.addArrangedSubview(firstSipTrigger)
        firstSipHeader.addArrangedSubview(firstSipSection)

        NSLayoutConstraint.activate([
            firstSipScroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), firstSipScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor), firstSipScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstSipScroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), firstSipHeader.topAnchor.constraint(equalTo: firstSipScroll.contentLayoutGuide.topAnchor, constant: 10), firstSipHeader.leadingAnchor.constraint(equalTo: firstSipScroll.contentLayoutGuide.leadingAnchor, constant: 24),
            firstSipHeader.trailingAnchor.constraint(equalTo: firstSipScroll.contentLayoutGuide.trailingAnchor, constant: -24), firstSipHeader.bottomAnchor.constraint(equalTo: firstSipScroll.contentLayoutGuide.bottomAnchor, constant: -22), firstSipHeader.widthAnchor.constraint(equalTo: firstSipScroll.frameLayoutGuide.widthAnchor, constant: -48)
        ])
    }

    private func firstSipRoute(_ firstSipSection: String, firstSipSection firstSipPreview: UIColor, firstSipPreview firstSipTrigger: Selector) -> UIButton {
        let firstSipLayout = UIButton(type: .system)
        firstSipLayout.setTitle(firstSipSection, for: .normal)
        firstSipLayout.setTitleColor(.white, for: .normal)
        firstSipLayout.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        firstSipLayout.backgroundColor = firstSipPreview
        firstSipLayout.layer.cornerRadius = 26
        firstSipLayout.heightAnchor.constraint(equalToConstant: 54).isActive = true
        firstSipLayout.addTarget(self, action: firstSipTrigger, for: .touchUpInside)
        return firstSipLayout
    }

    private func firstSipRender() {
        let firstSipAction = UserDefaults.standard.bool(forKey: "chovviFragrantTexture")
        firstSipArtwork.setTitle(firstSipAction ? "☑  I have read and agree to the Terms of Service and Privacy Policy" : "☐  I have read and agree to the Terms of Service and Privacy Policy", for: .normal)
    }

    private func firstSipAction(_ firstSipLabel: Bool) {
        let firstSipStatus = ChovviGentleProfile(
            beanPassportCanvas: "End User License Agreement",
            beanPassportScroll: ChovviGentleProfile.beanPassportHeader,
            beanPassportArtwork: true
        ) { [weak self] firstSipRoute in
            UserDefaults.standard.set(firstSipRoute, forKey: "chovviFragrantTexture")
            self?.firstSipRender()
            if !firstSipRoute, firstSipLabel { self?.dismiss(animated: true) }
        }
        navigationController?.pushViewController(firstSipStatus, animated: true)
    }

    @objc private func firstSipStatus() {
        firstSipAction(false)
    }

    @objc private func firstSipSource() {
        if UserDefaults.standard.bool(forKey: "chovviFragrantTexture") {
            UserDefaults.standard.set(false, forKey: "chovviFragrantTexture")
            firstSipRender()
        } else {
            firstSipAction(false)
        }
    }

    @objc private func firstSipTrigger() {
        guard firstSipUpdate() else { return }
        navigationController?.pushViewController(ChovviFragrantTasting(), animated: true)
    }

    @objc private func firstSipLayout() {
        guard firstSipUpdate() else { return }
        navigationController?.pushViewController(ChovviGentleTasting(), animated: true)
    }

    private func firstSipUpdate() -> Bool {
        guard UserDefaults.standard.bool(forKey: "chovviFragrantTexture") else {
            firstSipAction(false)
            return false
        }
        return true
    }

    @objc private func firstSipMenu(_ firstSipUpdate: UIButton) {
        let firstSipDestination = firstSipUpdate.tag == 0 ? "Terms of Service" : "Privacy Policy"
        let firstSipCard = firstSipUpdate.tag == 0 ? ChovviGentleProfile.beanPassportStack : ChovviGentleProfile.beanPassportState
        navigationController?.pushViewController(ChovviGentleProfile(beanPassportCanvas: firstSipDestination, beanPassportScroll: firstSipCard, beanPassportArtwork: false, beanPassportCollection: nil), animated: true)
    }

    @objc private func firstSipLabel() {
        dismiss(animated: true)
    }
}

final class ChovviGentleProfile: UIViewController {
    static let beanPassportHeader = """
    Choovi End User License Agreement

    Eligibility and account responsibility
    You must be at least 13 years old, or the minimum legal age required in your region, and legally permitted to use Choovi. Registration information must be accurate. You are responsible for activity performed through your account and must not impersonate another person.

    User conduct
    Choovi is for respectful coffee-related expression. Do not post harassment, threats, hate, sexual exploitation, illegal material, graphic violence, spam, deceptive content, or content that infringes another person’s rights. Do not solicit personal information, manipulate engagement, or use the app to target vulnerable people.

    User-generated content and moderation
    Content may be reviewed, limited, hidden, or removed when it violates these rules. Accounts involved in serious or repeated violations may lose access. Choovi applies a zero-tolerance approach to abusive and objectionable content.

    Reporting and blocking
    Users can report content or accounts and can block unwanted interactions. Reports are reviewed for safety and policy compliance. Blocking limits future interaction with the blocked account.

    Local identity and lawful use
    You must follow local law and may use only an identity and content you are legally entitled to use. Choovi must not be used for unlawful, fraudulent, exploitative, or dangerous conduct.

    By selecting Agree, you accept this EULA, the Terms of Service, and the Privacy Policy.
    """

    static let beanPassportStack = """
    Choovi Terms of Service
    Effective Date: August 3, 2026

    These Terms of Service ("Terms") govern your access to and use of Choovi, a coffee-themed community where users create Coffee Moments, share coffee-related photos, videos and stories, discover cafés and brewing ideas, and participate in coffee-themed conversations.

    By creating an account, selecting "Agree," checking the agreement box, or using account-based features, you agree to these Terms and acknowledge the Choovi Privacy Policy. If you do not agree, do not create an account or use account-based features.

    1. Eligibility and Legal Capacity
    You may use Choovi only if you are at least 13 years old, satisfy any higher minimum age required by local law, are legally permitted to use the App in your country or region, and have legal capacity to accept these Terms. Where required, a parent or legal guardian must provide valid consent.

    You must not misrepresent your age, identity, or eligibility. We may restrict or terminate access when we reasonably believe an account does not satisfy these requirements.

    2. Accounts
    Some content may be browsed without signing in. Publishing, liking, saving, commenting, following, joining or creating groups, messaging, reporting, blocking, editing a profile, and other identity-based features may require an account.

    You agree to provide accurate and lawful information, maintain only accounts you are authorized to control, keep credentials confidential, update inaccurate information, and notify us of suspected unauthorized use. You must not use another person's identity, email address, likeness, or credentials without authorization.

    3. EULA Acceptance
    Choovi's End User License Agreement and these Terms must be accepted before account-based participation. Your acceptance is recorded so that your agreement choice remains consistent throughout the App. The initial EULA prompt and agreement checkbox must represent the same choice. Privacy Policy and Terms links remain available through applicable welcome or settings screens.

    4. User Content and Responsibility
    User Content includes photos, videos, audio, captions, comments, profile information, reactions, messages, reports, group content, and other material you submit. You retain ownership and are responsible for ensuring that you created it or have permission to use it, that it is lawful and accurate where presented as fact, and that it does not violate intellectual-property, privacy, publicity, or other rights.

    Do not post passwords, financial details, government identification numbers, precise home addresses, or another person's confidential information. Obtain any consent required for identifiable people shown or heard in your content.

    5. License to Operate Choovi
    To the extent necessary to operate Choovi, you grant us a non-exclusive, worldwide, royalty-free license to host, reproduce, display, format, and process User Content solely to provide selected features, enable interactions, operate storage, moderate content, respond to reports, and maintain safety and legal compliance. This license ends when the content or account is deleted, except where limited retention is legally required.

    6. Prohibited Conduct
    You must not create, upload, promote, request, transmit, or facilitate pornography, sexual solicitation, child exploitation, non-consensual intimate imagery, harassment, bullying, stalking, threats, encouragement of self-harm, hate speech, discrimination, graphic violence, doxxing, illegal activity, fraud, scams, phishing, impersonation, spam, malware, intellectual-property infringement, or unauthorized collection of user data.

    You must not evade a block, suspension, moderation decision, identity control, or security measure; manipulate reactions or follows; repeatedly contact someone after being asked to stop; or use groups and messages primarily for anonymous abuse, prohibited transactions, or unrelated mass promotion.

    7. Content Filtering and Moderation
    Choovi may apply automated rules, keyword filters, content moderation systems, user reports, and manual review. We may prevent publication, hide or remove content, limit visibility or features, issue warnings, suspend or terminate accounts, preserve limited evidence where lawful, and notify authorities when required or necessary to address an imminent threat.

    Severe violations, including child exploitation, credible threats, non-consensual intimate content, serious fraud, or attempts to compromise user safety, may result in immediate permanent termination without warning.

    8. Reporting Violations
    You may report content, messages, groups, or accounts through the applicable in-App controls or by emailing choovi@gmail.com. Reports should identify the relevant account or content, explain the concern, and include useful context. Knowingly false or malicious reports may violate these Terms.

    We will review credible reports as promptly as reasonably possible and may restrict content or accounts while reviewing a safety concern. Privacy and safety considerations may prevent us from disclosing every detail of an investigation or action taken against another user.

    9. Blocking Users
    Choovi provides controls to block abusive or unwanted users. Blocking may limit messages, follows, interactions, content visibility, and future contact. A blocked user must not use another account to evade a block. Blocking does not automatically create a moderation report, so serious violations should also be reported.

    10. Enforcement and Penalties
    Violations may result in content rejection or removal, loss of features, a warning, temporary suspension, permanent account termination, device-level or account-level restrictions, or reporting to authorities where required. Repeated violations or attempts to evade enforcement may result in increased penalties.

    11. Account Deletion and Termination
    You may initiate complete account deletion through Account Settings. Deleting an account is different from signing out and is intended to remove the account, associated personal data, and User Content except information that must be retained by law or for narrowly limited safety and dispute purposes. Assistance is available at choovi@gmail.com.

    We may suspend or terminate an account that violates these Terms, creates a risk to another user, is used fraudulently, evades a prior restriction, creates legal or security risk, or must be restricted by law.

    12. Copyright and Rights Complaints
    To report infringement, email choovi@gmail.com with your contact information, identification of the protected work or right, identification of the disputed content, an explanation of the alleged infringement, a good-faith statement, and evidence that you own the right or are authorized to act for its owner. We may remove disputed content and terminate repeat infringers.

    13. App Permissions
    Choovi may request camera, microphone, photo-library, and notification permissions to provide corresponding features. You control these permissions through iOS. You must not use them to record, photograph, or distribute another person's information unlawfully.

    14. Choovi In-App Purchases
    Choovi offers consumable Coins through Apple's In-App Purchase system. The available package, Coin quantity, and localized amount are shown before you confirm a transaction. Apple processes the transaction, billing, and any eligible refund request under its applicable terms.

    Coins are added only after Choovi verifies a successful App Store transaction. Coins may be used for eligible digital actions within Choovi, including submitting a new Room for review. Creating a Room currently uses 20 Coins, and the required amount is displayed before submission. Choovi may change the Coin amount required for future actions, but the applicable amount will be shown before you confirm.

    Coins do not expire, have no cash value, are not transferable, cannot be exchanged for money or physical goods, and may be used only within Choovi. Except where required by law or Apple's policies, completed consumable purchases are final. If a completed transaction is not reflected correctly, contact Choovi Support at choovi@gmail.com with relevant transaction details. Do not include passwords or complete financial information in a support request.

    15. Intellectual Property
    Choovi's software, interface, branding, visual design, and original materials are owned by or licensed to Choovi. You receive a limited, personal, non-exclusive, non-transferable, revocable right to use the App for its intended purpose. You may not unlawfully copy, sell, sublicense, reverse engineer, or misrepresent an affiliation with Choovi.

    16. Service Availability
    Choovi may change, suspend, or discontinue features for maintenance, security, legal, or product reasons and does not guarantee uninterrupted or error-free operation. You should keep copies of content that is important to you.

    17. Disclaimers
    Choovi is provided on an "as is" and "as available" basis to the extent permitted by law. Coffee recipes, equipment suggestions, café descriptions, tasting notes, and other user statements may be personal opinions. Choovi does not guarantee their accuracy, safety, or suitability and does not provide medical, nutritional, financial, or other professional advice.

    18. Limitation of Liability
    To the maximum extent permitted by law, Choovi will not be liable for indirect, incidental, special, consequential, or punitive damages arising from use of the App, User Content, user interactions, unauthorized access, loss of data, or reliance on coffee-related information. Mandatory legal rights remain unaffected.

    19. Apple-Specific Terms
    These Terms are between you and Choovi, not Apple. Apple is not responsible for Choovi, its content, maintenance, support, or related claims. Apple and its subsidiaries are third-party beneficiaries of the Apple-specific provisions and may enforce them where applicable. Use must comply with App Store terms.

    20. Changes to These Terms
    We may update these Terms to reflect changes in Choovi, safety practices, or law. Material changes will be communicated through the App or another reasonable method. Where renewed consent is required, Choovi will request it before continued use of affected account features.

    21. Local Legal Requirements
    You may use Choovi only in compliance with laws concerning age, identity, privacy, intellectual property, communications, and online conduct. Nothing in these Terms removes consumer or privacy rights that cannot lawfully be waived in your country or region.

    22. Contact
    Questions, account appeals, safety reports, rights complaints, and legal notices may be sent to Choovi Support at choovi@gmail.com.
    """

    static let beanPassportState = """
    Choovi Privacy Policy
    Effective Date: August 3, 2026

    Choovi ("Choovi," "we," "us," or "our") is a coffee-themed social application that allows users to create and share Coffee Moments, browse coffee-related content, participate in coffee-themed group conversations, and interact with other coffee enthusiasts.

    This Privacy Policy explains what information Choovi processes, how that information is used, the choices available to you, and how to contact us. By using Choovi, you acknowledge that you have read and understood this Privacy Policy.

    1. Information We Process
    Depending on the features you use, Choovi may process account information such as your email address, password or authentication credential, user ID, authentication token, display name, profile photo, profile description, preferences, login status, and EULA or Terms acceptance status.

    2. User-Generated Content
    Choovi may process content you voluntarily create or submit, including coffee-related photos and videos, captions, moods, hashtags, coffee details, comments, reactions, group chats, private messages, profile information, reports, feedback, and support requests. Content posted to public or group areas may be visible to other users according to the feature's visibility settings.

    3. Social and Interaction Information
    Choovi may process likes, saves, reactions, following and blocking relationships, group membership, comments, conversations, content-viewing history, reports, and notification state as needed to provide community features and protect users.

    4. Camera, Microphone, Photos, and Videos
    If you choose to create or upload a Coffee Moment, Choovi may request access to your camera, microphone, or photo library. Access is requested only when needed for a feature you choose to use. You may deny or revoke access through iOS Settings, although the related creation feature may then be unavailable.

    5. Device and Diagnostic Information
    Choovi may process limited device or diagnostic information necessary to operate, secure, and troubleshoot the App, such as app version, device type, operating system version, crash information, performance data, app-generated identifiers, and security events. Choovi does not use this information for cross-app tracking unless a future version clearly discloses that practice and obtains any required consent.

    6. Data Storage and Processing
    Choovi retains account records, login status, profile information, interaction records, and other App data as needed to provide the features you choose, maintain account continuity, protect users, and support account and content management.

    Signing out clears the active login state but does not delete the registered account. If Choovi's processing or sharing practices change, this Policy and the App Store privacy disclosures will be updated as required.

    7. How We Use Information
    We process information to create and manage accounts, maintain login status, enable Coffee Moments, comments, reactions, saves, follows, groups and conversations, display profiles, process reports and blocks, filter objectionable content, enforce our Terms, prevent fraud and harassment, respond to support requests, maintain App stability, and comply with applicable law.

    We do not sell personal information or use it for third-party behavioral advertising or cross-app tracking unless such a practice is introduced with the required notice, disclosure, and consent.

    8. Content Moderation, Reporting, and Blocking
    Users must not post pornography, child exploitation, harassment, bullying, threats, hate speech, graphic violence, encouragement of self-harm, illegal activity, fraud, scams, spam, impersonation, private personal information, or content that infringes intellectual-property, privacy, or other legal rights.

    Choovi may use automated rules, content filters, user reports, and manual review to identify objectionable material. Users can report content or accounts and block abusive users through in-App controls. We may remove content, restrict features, suspend accounts, or permanently terminate accounts. Severe violations may result in immediate action. Safety reports may also be sent to choovi@gmail.com.

    9. Sharing of Information
    Choovi does not sell personal information. Information may be disclosed at your direction, to comply with a valid legal obligation, to protect users or Choovi, to investigate serious abuse, or in connection with a lawful business transfer.

    10. Data Retention
    Data is generally retained until you delete the relevant content or account, or until it is removed through moderation. Limited records may be retained when required by law or reasonably necessary to resolve disputes, enforce agreements, or prevent repeated abuse.

    11. Account and Data Deletion
    Users may initiate complete account deletion through Account Settings. Account deletion is different from signing out or disabling an account and is intended to remove the account record, profile, credentials, Coffee Moments, photos, videos, captions, comments, messages, interactions, and other associated data that is not legally required to be retained. Deletion may be irreversible.

    If you cannot access the in-App deletion feature, email choovi@gmail.com with the subject "Choovi Account Deletion Request." We may request reasonable information to verify that you control the account.

    12. Your Privacy Choices
    Subject to applicable law, you may review or update your profile, delete your content, manage device permissions, leave groups, block users, report abuse, sign out, delete your account and associated data, or ask questions about our practices. We may need to verify your identity before completing a request.

    13. Children and Age Requirements
    Choovi is not intended for children under 13. You may use Choovi only if you are at least 13, meet any higher minimum age required in your country or region, and have legal capacity or valid parental or guardian consent where required. Contact us if you believe an underage user has provided information through Choovi.

    Users must never upload, request, distribute, or facilitate sexual or exploitative content involving minors. Such conduct may result in immediate termination and reporting to appropriate authorities where required.

    14. Security
    We use reasonable administrative and technical measures designed to protect information, but no device, service, or storage system is completely secure. You are responsible for protecting your device and credentials and notifying us of suspected unauthorized access.

    15. International Use and Legal Compliance
    You may use Choovi only where lawful and are responsible for complying with laws applicable to your location, age, identity, content, and conduct. Mandatory privacy rights under applicable local law remain available.

    16. Third-Party Services
    Third-party links or services have their own terms and privacy practices. A future version integrating third-party SDKs or services will disclose their relevant practices in this Policy and App Store Connect.

    17. Changes to This Privacy Policy
    We may update this Policy to reflect changes to Choovi, legal requirements, or safety practices. Material changes will be communicated through the App or another reasonable method, and the revised effective date will be shown above.

    18. Contact Us
    For privacy questions, account requests, safety reports, or complaints, contact Choovi Support at choovi@gmail.com.
    """

    private let beanPassportCanvas: String
    private let beanPassportScroll: String
    private let beanPassportArtwork: Bool
    private let beanPassportCollection: ((Bool) -> Void)?

    init(beanPassportCanvas: String, beanPassportScroll: String, beanPassportArtwork: Bool, beanPassportCollection: ((Bool) -> Void)? = nil) {
        self.beanPassportCanvas = beanPassportCanvas
        self.beanPassportScroll = beanPassportScroll
        self.beanPassportArtwork = beanPassportArtwork
        self.beanPassportCollection = beanPassportCollection
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        beanPassportCanvas = "Policy"
        beanPassportScroll = ""
        beanPassportArtwork = false
        beanPassportCollection = nil
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        beanPassportRender()
    }

    private func beanPassportRender() { beanPassportRenderTrigger() }

    private lazy var beanPassportRenderTrigger: () -> Void = { [unowned self] in
        title = beanPassportCanvas
        view.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.99, alpha: 1)
        let beanPassportAction = UITextView()
        beanPassportAction.text = beanPassportScroll
        beanPassportAction.font = .systemFont(ofSize: 15)
        beanPassportAction.textColor = UIColor(red: 0.18, green: 0.19, blue: 0.24, alpha: 1)
        beanPassportAction.backgroundColor = .clear
        beanPassportAction.isEditable = false
        beanPassportAction.textContainerInset = UIEdgeInsets(top: 18, left: 16, bottom: 24, right: 16)
        beanPassportAction.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(beanPassportAction)
        if beanPassportArtwork {
            let beanPassportLabel = UIButton(type: .system)
            beanPassportLabel.setTitle("Decline", for: .normal)
            beanPassportLabel.setTitleColor(.systemRed, for: .normal)
            beanPassportLabel.tag = 0
            beanPassportLabel.addTarget(self, action: #selector(beanPassportStatus(_:)), for: .touchUpInside)
            let beanPassportStatus = UIButton(type: .system)
            beanPassportStatus.setTitle("Agree", for: .normal)
            beanPassportStatus.setTitleColor(.white, for: .normal)
            beanPassportStatus.backgroundColor = ChovviCuppingProfile.cupKeeperStack
            beanPassportStatus.layer.cornerRadius = 24
            beanPassportStatus.tag = 1
            beanPassportStatus.addTarget(self, action: #selector(beanPassportStatus(_:)), for: .touchUpInside)
            let beanPassportRoute = UIStackView(arrangedSubviews: [beanPassportLabel, beanPassportStatus])
            beanPassportRoute.axis = .horizontal
            beanPassportRoute.distribution = .fillEqually
            beanPassportRoute.spacing = 12
            beanPassportRoute.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(beanPassportRoute)
            NSLayoutConstraint.activate([
                beanPassportAction.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), beanPassportAction.leadingAnchor.constraint(equalTo: view.leadingAnchor), beanPassportAction.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                beanPassportAction.bottomAnchor.constraint(equalTo: beanPassportRoute.topAnchor, constant: -8), beanPassportRoute.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18), beanPassportRoute.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
                beanPassportRoute.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12), beanPassportRoute.heightAnchor.constraint(equalToConstant: 50)
            ])
        } else {
            NSLayoutConstraint.activate([
                beanPassportAction.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), beanPassportAction.leadingAnchor.constraint(equalTo: view.leadingAnchor), beanPassportAction.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                beanPassportAction.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        }
    }

    @objc private func beanPassportStatus(_ beanPassportRoute: UIButton) {
        beanPassportCollection?(beanPassportRoute.tag == 1)
        navigationController?.popViewController(animated: true)
    }
}

final class ChovviGentleTasting: UIViewController, UITextFieldDelegate {
    private let beanPassportCanvas = UIScrollView()
    private let beanPassportScroll = UIStackView()
    private let beanPassportHeader = UITextField()
    private let beanPassportArtwork = UITextField()
    private let beanPassportCollection = UITextField()
    private let beanPassportStack = UITextField()
    private let beanPassportState = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        beanPassportAction()
        beanPassportStatus()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard UserDefaults.standard.bool(forKey: "chovviFragrantTexture") else {
            beanPassportCard("Agreement required", beanPassportItem: "Return to the welcome page and accept the Privacy Policy and Terms of Service before creating an account.")
            return
        }
        beanPassportLayout()
    }

    private func beanPassportAction() { beanPassportActionTrigger() }

    private lazy var beanPassportActionTrigger: () -> Void = { [unowned self] in
        title = nil
        view.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.99, alpha: 1)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        beanPassportCanvas.alwaysBounceVertical = true
        beanPassportCanvas.keyboardDismissMode = .interactive
        beanPassportCanvas.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(beanPassportCanvas)
        beanPassportScroll.axis = .vertical
        beanPassportScroll.spacing = 12
        beanPassportScroll.translatesAutoresizingMaskIntoConstraints = false
        beanPassportCanvas.addSubview(beanPassportScroll)

        let beanPassportRender = UILabel()
        beanPassportRender.text = "Coffee Day"
        beanPassportRender.font = .systemFont(ofSize: 29, weight: .black)
        beanPassportRender.textColor = UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1)
        beanPassportScroll.addArrangedSubview(beanPassportRender)

        let beanPassportChoice = UIView()
        beanPassportChoice.heightAnchor.constraint(equalToConstant: 132).isActive = true
        let beanPassportImage = UIImageView(image: UIImage(named: "chovviGentleVarietal"))
        beanPassportImage.contentMode = .scaleAspectFit
        beanPassportImage.translatesAutoresizingMaskIntoConstraints = false
        beanPassportChoice.addSubview(beanPassportImage)
        NSLayoutConstraint.activate([
            beanPassportImage.trailingAnchor.constraint(equalTo: beanPassportChoice.trailingAnchor), beanPassportImage.topAnchor.constraint(equalTo: beanPassportChoice.topAnchor), beanPassportImage.widthAnchor.constraint(equalToConstant: 132),
            beanPassportImage.heightAnchor.constraint(equalToConstant: 132)
        ])
        beanPassportScroll.addArrangedSubview(beanPassportChoice)

        let beanPassportItem = UILabel()
        beanPassportItem.text = "Create Account"
        beanPassportItem.font = .systemFont(ofSize: 30, weight: .black)
        beanPassportItem.textColor = UIColor(red: 0.14, green: 0.14, blue: 0.19, alpha: 1)
        beanPassportScroll.addArrangedSubview(beanPassportItem)

        let beanPassportSelection = UILabel()
        beanPassportSelection.text = "Join Choovi and keep your coffee moments together."
        beanPassportSelection.font = .systemFont(ofSize: 15, weight: .medium)
        beanPassportSelection.textColor = .secondaryLabel
        beanPassportSelection.numberOfLines = 0
        beanPassportScroll.addArrangedSubview(beanPassportSelection)
        beanPassportScroll.setCustomSpacing(24, after: beanPassportSelection)

        beanPassportLabel(beanPassportCollection, beanPassportLabel: "USERNAME", beanPassportStatus: "coffeelover99")
        beanPassportLabel(beanPassportHeader, beanPassportLabel: "EMAIL ADDRESS", beanPassportStatus: "hello@choovi.com")
        beanPassportLabel(beanPassportArtwork, beanPassportLabel: "PASSWORD", beanPassportStatus: "Create password")
        beanPassportLabel(beanPassportStack, beanPassportLabel: "CONFIRM PASSWORD", beanPassportStatus: "Confirm password")
        beanPassportHeader.keyboardType = .emailAddress
        beanPassportHeader.autocapitalizationType = .none
        beanPassportHeader.textContentType = .emailAddress
        beanPassportCollection.autocapitalizationType = .words
        beanPassportCollection.textContentType = .nickname
        beanPassportCollection.returnKeyType = .next
        beanPassportHeader.returnKeyType = .next
        beanPassportArtwork.isSecureTextEntry = true
        beanPassportArtwork.textContentType = .newPassword
        beanPassportArtwork.returnKeyType = .next
        beanPassportStack.isSecureTextEntry = true
        beanPassportStack.textContentType = .newPassword
        beanPassportStack.returnKeyType = .done

        beanPassportState.contentHorizontalAlignment = .leading
        beanPassportState.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        beanPassportState.addTarget(self, action: #selector(beanPassportRoute), for: .touchUpInside)
        beanPassportState.heightAnchor.constraint(equalToConstant: 50).isActive = true
        beanPassportScroll.addArrangedSubview(beanPassportState)
        beanPassportLayout()

        let beanPassportTrigger = UIButton(type: .system)
        beanPassportTrigger.setTitle("Next", for: .normal)
        beanPassportTrigger.setTitleColor(.white, for: .normal)
        beanPassportTrigger.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        beanPassportTrigger.backgroundColor = ChovviCuppingProfile.cupKeeperStack
        beanPassportTrigger.layer.cornerRadius = 28
        beanPassportTrigger.addTarget(self, action: #selector(beanPassportSection), for: .touchUpInside)
        beanPassportTrigger.heightAnchor.constraint(equalToConstant: 56).isActive = true
        beanPassportScroll.addArrangedSubview(beanPassportTrigger)
        beanPassportScroll.setCustomSpacing(28, after: beanPassportTrigger)

        let beanPassportSource = UIButton(type: .system)
        let beanPassportMenu = NSMutableAttributedString(string: "Already have an account? ", attributes: [.foregroundColor: UIColor.secondaryLabel, .font: UIFont.systemFont(ofSize: 15, weight: .medium)])
        beanPassportMenu.append(NSAttributedString(string: "Log In", attributes: [.foregroundColor: ChovviCuppingProfile.cupKeeperStack, .font: UIFont.systemFont(ofSize: 15, weight: .bold)]))
        beanPassportSource.setAttributedTitle(beanPassportMenu, for: .normal)
        beanPassportSource.addTarget(self, action: #selector(beanPassportPreview), for: .touchUpInside)
        beanPassportSource.heightAnchor.constraint(equalToConstant: 44).isActive = true
        beanPassportScroll.addArrangedSubview(beanPassportSource)

        NSLayoutConstraint.activate([
            beanPassportCanvas.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), beanPassportCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor), beanPassportCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            beanPassportCanvas.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), beanPassportScroll.topAnchor.constraint(equalTo: beanPassportCanvas.contentLayoutGuide.topAnchor, constant: 10), beanPassportScroll.leadingAnchor.constraint(equalTo: beanPassportCanvas.contentLayoutGuide.leadingAnchor, constant: 24),
            beanPassportScroll.trailingAnchor.constraint(equalTo: beanPassportCanvas.contentLayoutGuide.trailingAnchor, constant: -24), beanPassportScroll.bottomAnchor.constraint(equalTo: beanPassportCanvas.contentLayoutGuide.bottomAnchor, constant: -30), beanPassportScroll.widthAnchor.constraint(equalTo: beanPassportCanvas.frameLayoutGuide.widthAnchor, constant: -48)
        ])
    }

    private func beanPassportLabel(_ beanPassportStatus: UITextField, beanPassportLabel: String, beanPassportStatus beanPassportRoute: String) {
        let beanPassportSection = UILabel()
        beanPassportSection.text = beanPassportLabel
        beanPassportSection.font = .systemFont(ofSize: 13, weight: .bold)
        beanPassportSection.textColor = UIColor(red: 0.18, green: 0.18, blue: 0.23, alpha: 1)
        beanPassportScroll.addArrangedSubview(beanPassportSection)
        beanPassportStatus.placeholder = beanPassportRoute
        beanPassportStatus.backgroundColor = UIColor(red: 0.93, green: 0.95, blue: 0.96, alpha: 1)
        beanPassportStatus.layer.cornerRadius = 13
        beanPassportStatus.delegate = self
        beanPassportStatus.beanPassportRecord(16)
        beanPassportStatus.heightAnchor.constraint(equalToConstant: 54).isActive = true
        beanPassportScroll.addArrangedSubview(beanPassportStatus)
        beanPassportScroll.setCustomSpacing(18, after: beanPassportStatus)
    }

    private func beanPassportStatus() {
        NotificationCenter.default.addObserver(self, selector: #selector(beanPassportMenu(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(beanPassportUpdate(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        let beanPassportDestination = UITapGestureRecognizer(target: self, action: #selector(beanPassportDestination))
        beanPassportDestination.cancelsTouchesInView = false
        beanPassportCanvas.addGestureRecognizer(beanPassportDestination)
    }

    @objc private func beanPassportRoute() {
        UserDefaults.standard.set(!UserDefaults.standard.bool(forKey: "chovviFragrantTexture"), forKey: "chovviFragrantTexture")
        beanPassportLayout()
    }

    private func beanPassportLayout() {
        let beanPassportMenu = UserDefaults.standard.bool(forKey: "chovviFragrantTexture")
        let beanPassportUpdate = beanPassportMenu ? "☑  I agree to the Terms & Privacy Policy" : "☐  I agree to the Terms & Privacy Policy"
        beanPassportState.setTitle(beanPassportUpdate, for: .normal)
        beanPassportState.setTitleColor(beanPassportMenu ? ChovviCuppingProfile.cupKeeperStack : .secondaryLabel, for: .normal)
    }

    @objc private func beanPassportSection() {
        view.endEditing(true)
        let beanPassportStatus = beanPassportHeader.text?.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() ?? ""
        let beanPassportSection = beanPassportArtwork.text ?? ""
        let beanPassportPreview = beanPassportCollection.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let beanPassportTrigger = beanPassportStack.text ?? ""
        guard UserDefaults.standard.bool(forKey: "chovviFragrantTexture") else {
            beanPassportCard("Agreement required", beanPassportItem: "Accept the Privacy Policy and Terms of Service before continuing.")
            return
        }
        guard !beanPassportPreview.isEmpty, !beanPassportStatus.isEmpty, !beanPassportSection.isEmpty, !beanPassportTrigger.isEmpty else {
            beanPassportCard("Complete all fields", beanPassportItem: "Enter a username, email, password, and password confirmation.")
            return
        }
        guard beanPassportSource(beanPassportStatus) else {
            beanPassportCard("Invalid email", beanPassportItem: "Enter a valid email address.")
            return
        }
        guard beanPassportSection.count >= 6 else {
            beanPassportCard("Password is too short", beanPassportItem: "Use at least 6 characters.")
            return
        }
        guard beanPassportSection == beanPassportTrigger else {
            beanPassportCard("Passwords do not match", beanPassportItem: "Enter the same password in both password fields.")
            return
        }
        ChovviThermalCalibrationView.goldenRitualLayout(self, goldenRitualMenu: "Creating your coffee profile...", goldenRitualUpdate: 1.0) { [weak self] in
            guard let self else { return }
            var beanPassportLayout = (UserDefaults.standard.data(forKey: "chovviGentleTexture"))
                .flatMap { try? JSONDecoder().decode([ChovviGentleTexture].self, from: $0) } ?? []
            guard beanPassportStatus != "choovi@gmail.com", !beanPassportLayout.contains(where: { $0.beanPassportCanvas.lowercased() == beanPassportStatus }) else {
                self.beanPassportCard("Account already exists", beanPassportItem: "Use a different email or return to Log In.")
                return
            }
            let beanPassportMenu = ChovviGentleTexture(
                beanPassportCanvas: beanPassportStatus,
                beanPassportScroll: beanPassportSection,
                beanPassportHeader: beanPassportPreview,
                beanPassportArtwork: "Coffee lover exploring everyday brews and thoughtful café moments.",
                beanPassportCollection: "chovviAromaticKettle"
            )
            beanPassportLayout.append(beanPassportMenu)
            guard let beanPassportUpdate = try? JSONEncoder().encode(beanPassportLayout) else {
                self.beanPassportCard("Unable to create account", beanPassportItem: "Your account could not be created. Please retry.")
                return
            }
            UserDefaults.standard.set(beanPassportUpdate, forKey: "chovviGentleTexture")
            UserDefaults.standard.set(true, forKey: "choovilogin")
            UserDefaults.standard.set(beanPassportStatus, forKey: "hooviEmail")
            UserDefaults.standard.set(beanPassportPreview, forKey: "chovviCuppingTexture")
            UserDefaults.standard.set(beanPassportMenu.beanPassportArtwork, forKey: "chovviCuppingVarietal")
            UserDefaults.standard.set(beanPassportMenu.beanPassportCollection, forKey: "chovviCuppingRoast")
            self.dismiss(animated: true) {
                NotificationCenter.default.post(name: .cupKeeperUpdate, object: nil)
            }
        }
    }

    @objc private func beanPassportPreview() {
        guard UserDefaults.standard.bool(forKey: "chovviFragrantTexture") else {
            beanPassportCard("Agreement required", beanPassportItem: "Return to the welcome page and accept the Privacy Policy and Terms of Service before signing in.")
            return
        }
        if navigationController?.viewControllers.dropLast().last is ChovviFragrantTasting {
            navigationController?.popViewController(animated: true)
        } else {
            navigationController?.pushViewController(ChovviFragrantTasting(), animated: true)
        }
    }

    private func beanPassportSource(_ beanPassportStatus: String) -> Bool {
        let beanPassportRoute = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", beanPassportRoute).evaluate(with: beanPassportStatus)
    }

    private func beanPassportCard(_ beanPassportItem: String, beanPassportItem beanPassportSelection: String) {
        ChovviThermalAlertView.goldenRitualSelection(self, goldenRitualChoice: beanPassportItem, goldenRitualCanvas: beanPassportSelection, goldenRitualArtwork: .caution)
    }

    @objc private func beanPassportMenu(_ beanPassportUpdate: Notification) {
        guard let beanPassportDestination = beanPassportUpdate.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let beanPassportCard = max(0, view.bounds.maxY - view.convert(beanPassportDestination, from: nil).minY)
        beanPassportCanvas.contentInset.bottom = beanPassportCard
        beanPassportCanvas.verticalScrollIndicatorInsets.bottom = beanPassportCard
    }

    @objc private func beanPassportUpdate(_ beanPassportDestination: Notification) {
        _ = beanPassportDestination
        beanPassportCanvas.contentInset.bottom = 0
        beanPassportCanvas.verticalScrollIndicatorInsets.bottom = 0
    }

    @objc private func beanPassportDestination() {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ beanPassportItem: UITextField) -> Bool {
        if beanPassportItem === beanPassportCollection {
            beanPassportHeader.becomeFirstResponder()
        } else if beanPassportItem === beanPassportHeader {
            beanPassportArtwork.becomeFirstResponder()
        } else if beanPassportItem === beanPassportArtwork {
            beanPassportStack.becomeFirstResponder()
        } else {
            beanPassportSection()
        }
        return true
    }
}

private extension UITextField {
    func beanPassportRecord(_ beanPassportItem: CGFloat) {
        let beanPassportSelection = UIView(frame: CGRect(x: 0, y: 0, width: beanPassportItem, height: 1))
        leftView = beanPassportSelection
        leftViewMode = .always
        let beanPassportImage = UIView(frame: CGRect(x: 0, y: 0, width: beanPassportItem, height: 1))
        rightView = beanPassportImage
        rightViewMode = .always
    }
}
