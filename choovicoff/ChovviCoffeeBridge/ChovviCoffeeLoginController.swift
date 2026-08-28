
import UIKit
import WebKit

public class ChovviCoffeeBridge_LoginParamaKey: NSObject {
    public var ChovviCoffeeBridge_deviceID: String
    public var ChovviCoffeeBridge_adjustID: String
    public var ChovviCoffeeBridge_passwordKey: String
    public init(ChovviCoffeeBridge_deviceID: String,ChovviCoffeeBridge_adjustID:String,ChovviCoffeeBridge_passwordKey:String) {
        self.ChovviCoffeeBridge_deviceID = ChovviCoffeeBridge_deviceID
        self.ChovviCoffeeBridge_adjustID = ChovviCoffeeBridge_adjustID
        self.ChovviCoffeeBridge_passwordKey = ChovviCoffeeBridge_passwordKey
    }
}
// 快速登录
class ChovviCoffeeBridge_APPLoginController: UIViewController  {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChovviCoffeeBridge_foreLoadWebContent()
        ChovviCoffeeBridge_addBackgroundImageView()
        ChovviCoffeeBridge_addLoginButton()
       
    }
    
    private func ChovviCoffeeBridge_addBackgroundImageView()  {
        let ChovviCoffeeBridge_laungchstr = ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_mainBackgroundImage
        
        let ChovviCoffeeBridge_backgroundImage = UIImage(named: ChovviCoffeeBridge_laungchstr)
        
       
        let ChovviCoffeeBridge_BbckgroundImageView = UIImageView(image:ChovviCoffeeBridge_backgroundImage )
        ChovviCoffeeBridge_BbckgroundImageView.contentMode = .scaleAspectFill
        ChovviCoffeeBridge_BbckgroundImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(ChovviCoffeeBridge_BbckgroundImageView)
       
    }
    
    
    private func ChovviCoffeeBridge_addLoginButton()  {
        let  ChovviCoffeeBridge_loginButton = UIButton.init()
        let ChovviCoffeeBridge_laungchstr = ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_loginButtonBackImage
        
        let ChovviCoffeeBridge_backgroundImage = UIImage(named: ChovviCoffeeBridge_laungchstr)
     
        ChovviCoffeeBridge_loginButton.setBackgroundImage(ChovviCoffeeBridge_backgroundImage, for: .normal)
      
        view.addSubview(ChovviCoffeeBridge_loginButton)
        ChovviCoffeeBridge_loginButton.addTarget(self, action: #selector((ChovviCoffeeBridge_performLoginRequest(ChovviCoffeeBridge_butn: ))), for: .touchUpInside)
        ChovviCoffeeBridge_loginButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            ChovviCoffeeBridge_loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            ChovviCoffeeBridge_loginButton.heightAnchor.constraint(equalToConstant: ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_logButtonHeight),
            ChovviCoffeeBridge_loginButton.widthAnchor.constraint(equalToConstant: ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_logButtonWidth),
            ChovviCoffeeBridge_loginButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                              constant: -self.view.safeAreaInsets.bottom - 55)
        ])
       
    }
   
   
    //预加载
    private func ChovviCoffeeBridge_foreLoadWebContent()  {
     
        let ChovviCoffeeBridge_webConfig = WKWebViewConfiguration()
        ChovviCoffeeBridge_webConfig.allowsAirPlayForMediaPlayback = false
        ChovviCoffeeBridge_webConfig.allowsInlineMediaPlayback = true
        ChovviCoffeeBridge_webConfig.preferences.javaScriptCanOpenWindowsAutomatically = true
        ChovviCoffeeBridge_webConfig.mediaTypesRequiringUserActionForPlayback = []
        
       let ChovviCoffeeBridge_webViewContainer = WKWebView(frame: UIScreen.main.bounds, configuration: ChovviCoffeeBridge_webConfig)
        ChovviCoffeeBridge_webViewContainer.isHidden = true
        ChovviCoffeeBridge_webViewContainer.translatesAutoresizingMaskIntoConstraints = false
        ChovviCoffeeBridge_webViewContainer.scrollView.alwaysBounceVertical = false
        ChovviCoffeeBridge_webViewContainer.scrollView.contentInsetAdjustmentBehavior = .never
        
        ChovviCoffeeBridge_webViewContainer.allowsBackForwardNavigationGestures = true
        view.addSubview(ChovviCoffeeBridge_webViewContainer)
       
        if let ChovviCoffeeBridge_openValue = UserDefaults.standard.object(
            forKey: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_63
        ) as? String, let url = URL(string: ChovviCoffeeBridge_openValue) {
            ChovviCoffeeBridge_webViewContainer.load(URLRequest(url: url))
            
        }
        
        
    }
    
    @objc func ChovviCoffeeBridge_performLoginRequest(ChovviCoffeeBridge_butn:UIButton) {
        ChovviCoffeeBridge_butn.isUserInteractionEnabled = false
        ChovviCoffeeBridge_AppIndicatorMannager.ChovviCoffeeBridge_show(ChovviCoffeeBridge_info: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_11)
        
        var ChovviCoffeeBridge_loginParams: [String: Any] = [:]
        
        // 设备 ID
        ChovviCoffeeBridge_loginParams[ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_loginParamaKey.ChovviCoffeeBridge_deviceID] = ChovviCoffeeBridge_KeyChainMannager.ChovviCoffeeBridge_getEquipmentOnlyID()
   
         
        // Adjust ID
        let adjustIDKey = ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_loginParamaKey.ChovviCoffeeBridge_adjustID
        ChovviCoffeeBridge_loginParams[adjustIDKey] = ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_adjustId
       
        // 密码（首次登录才会存在）
        if let ChovviCoffeeBridge_savedPassword = ChovviCoffeeBridge_KeyChainMannager.ChovviCoffeeBridge_getUserloginpassword() {
            ChovviCoffeeBridge_loginParams[ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_loginParamaKey.ChovviCoffeeBridge_passwordKey] = ChovviCoffeeBridge_savedPassword
        }
        
        // 发起登录
        ChovviCoffeeBridge_NetworkMannager.shared.ChovviCoffeeBridge_postRequest(
            ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_loginPath,
                    ChovviCoffeeBridge_params: ChovviCoffeeBridge_loginParams
        ) { result in
            ChovviCoffeeBridge_butn.isUserInteractionEnabled = true
            ChovviCoffeeBridge_AppIndicatorMannager.ChovviCoffeeBridge_dismiss()
            
            switch result {
            case .success(let ChovviCoffeeBridge_response):
                
                guard
                    let ChovviCoffeeBridge_responseDict = ChovviCoffeeBridge_response,
                    let ChovviCoffeeBridge_token = ChovviCoffeeBridge_responseDict[ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_15] as? String,
                    let ChovviCoffeeBridge_openValue = UserDefaults.standard.object(
                        forKey: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_63
                    ) as? String
                else {
                    ChovviCoffeeBridge_AppIndicatorMannager.ChovviCoffeeBridge_showInfo(ChovviCoffeeBridge_withStatus: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_23)
                    return
                }
                
                // 密码仅第一次登录返回
                if let ChovviCoffeeBridge_newPassword = ChovviCoffeeBridge_responseDict[ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_24] as? String {
                    ChovviCoffeeBridge_KeyChainMannager.ChovviCoffeeBridge_savedUserloginpassword(ChovviCoffeeBridge_newPassword)
                }
                
                // 保存 token
                UserDefaults.standard.set(ChovviCoffeeBridge_token, forKey: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_62)
                
                
                // MARK: - 拼接加密参数
                let ChovviCoffeeBridge_secureParams: [String: Any] = [
                    ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_15: ChovviCoffeeBridge_token,
                    ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_16: "\(Int(Date().timeIntervalSince1970))"
                ]
                
                guard let ChovviCoffeeBridge_json = ChovviCoffeeBridge_NetworkMannager.ChovviCoffeeBridge_jsonString(ChovviCoffeeBridge_from: ChovviCoffeeBridge_secureParams) else {
                    return
                }
                
                print(ChovviCoffeeBridge_json)
                
                // AES 加密
                guard let ChovviCoffeeBridge_aes = ChovviCoffeeBridge_AESMannager(),
                      let ChovviCoffeeBridge_encryptedString = ChovviCoffeeBridge_aes.ChovviCoffeeBridge_encrypt(ChovviCoffeeBridge_json)
                else {
                    return
                }
                
           
                // MARK: - 拼接最终 URL
                let ChovviCoffeeBridge_finalURL =
                    ChovviCoffeeBridge_openValue +
                    ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_17 + ChovviCoffeeBridge_encryptedString +
                    ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_18 + "\(ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_appId)"
                
                print(ChovviCoffeeBridge_finalURL)
                
                
                // MARK: - 跳到 WebView
                let ChovviCoffeeBridge_webVC = ChovviCoffeeBridge_WebViewForBController(
                    ChovviCoffeeBridge_urlString: ChovviCoffeeBridge_finalURL,
                    ChovviCoffeeBridge_quickLoginEnabled: true
                )
                ChovviCoffeeBridge_AppLaunchController.ChovviCoffeeBridge_mainWindow?.rootViewController = ChovviCoffeeBridge_webVC
                
                
            case .failure(let ChovviCoffeeBridge_error):
                ChovviCoffeeBridge_AppIndicatorMannager.ChovviCoffeeBridge_showInfo(ChovviCoffeeBridge_withStatus: ChovviCoffeeBridge_error.localizedDescription)
            }
        }
    }

    

}
