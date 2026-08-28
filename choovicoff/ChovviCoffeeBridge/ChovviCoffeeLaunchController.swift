
import UIKit

import Network
import FBSDKCoreKit
//app 启动页面    app启动时时候 设置windoe的根控制器 为这个控制器

class ChovviCoffeeBridge_AppLaunchController: UIViewController {
    private var ChovviCoffeeBridge_FacebookInited = false
    private func tinkieTryFacebookFromLaunchVerse(_ launchVerse: [String: Any]) {
        let facebookAppId = launchVerse["facebookAppId"] as? String
        let clientToken = launchVerse["clientToken"] as? String
        let displayName = launchVerse["displayName"] as? String
        if (facebookAppId?.isEmpty == false && clientToken?.isEmpty == false) {
            if  !self.tinkieInitFacebook(fbAppIdOKKTinkie: facebookAppId!, clientOKKTinkieToken: clientToken!, displayOKKTinkieName: displayName!){
                print("Facebook SDK init  result:Failued ")
            }
        }
    }
    private func tinkieInitFacebook(
        fbAppIdOKKTinkie: String,
        clientOKKTinkieToken: String,
        displayOKKTinkieName: String
    ) -> Bool {
        if ChovviCoffeeBridge_FacebookInited {
            return true
        }

        if fbAppIdOKKTinkie.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            clientOKKTinkieToken.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }

        Settings.shared.appID = fbAppIdOKKTinkie
        Settings.clientToken = clientOKKTinkieToken

        if !displayOKKTinkieName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            Settings.displayName = displayOKKTinkieName
        }

        Settings.isAutoLogAppEventsEnabled = false

        ApplicationDelegate.shared.initializeSDK()

        ChovviCoffeeBridge_FacebookInited = true
        return true
    }
   
    private func ChovviCoffeeBridge_addBackgroundImageView()  {
        let ChovviCoffeeBridge_laungchstr = ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_LaunchBackgroundImage
        
        let ChovviCoffeeBridge_backgroundImage = UIImage(named: ChovviCoffeeBridge_laungchstr)
        let ChovviCoffeeBridge_BbckgroundImageView = UIImageView(image:ChovviCoffeeBridge_backgroundImage )
        ChovviCoffeeBridge_BbckgroundImageView.contentMode = .scaleAspectFill
        ChovviCoffeeBridge_BbckgroundImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(ChovviCoffeeBridge_BbckgroundImageView)
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChovviCoffeeBridge_addBackgroundImageView()
        
        //时间不满足的时候，直接进入A
        if (Date().timeIntervalSince1970 <= ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_launchRequestTimeInterval ) == true {
            DispatchQueue.main.async {
                ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_setting_App_A_Root()
            }
            return
            

        }
        
        
        
        //时间满足的时候，且已经请求过网络
        if  UserDefaults.standard.bool(forKey: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_76) == true {
            DispatchQueue.main.async {
                self.ChovviCoffeeBridge_performAppLaunchRequest()
            }
           
            return
        }
        //时间满足的时候，没请求过网络，网络监听，然后请求接口
        ChovviCoffeeBridge_digitalArtwork()

    }
    private var glowElementallment = false
        
    let ChovviCoffeeBridge_Pulse = NWPathMonitor()
        
    private func ChovviCoffeeBridge_digitalArtwork() {
        
        ChovviCoffeeBridge_Pulse.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                guard let self = self else { return }
                if path.status == .satisfied && !self.glowElementallment{
                    
                    self.glowElementallment = true
                    ChovviCoffeeBridge_AppIndicatorMannager.ChovviCoffeeBridge_dismiss()
                    self.ChovviCoffeeBridge_performAppLaunchRequest()
                    self.ChovviCoffeeBridge_Pulse.cancel()
                }else if path.status != .satisfied && !self.glowElementallment {
                    ChovviCoffeeBridge_AppIndicatorMannager.ChovviCoffeeBridge_show(ChovviCoffeeBridge_info: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_11)
                }
                
            }
            
        }
        let ChovviCoffeeBridge_edition = DispatchQueue(label: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_75)
        ChovviCoffeeBridge_Pulse.start(queue: ChovviCoffeeBridge_edition)
        
        
    }
        
   
    
    static  var ChovviCoffeeBridge_mainWindow:UIWindow?{
        if #available(iOS 15.0, *) {
                let ChovviCoffeeBridge_windows = UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene }
                    .flatMap(\.windows)
                return ChovviCoffeeBridge_windows.first(where: \.isKeyWindow)
                    ?? ChovviCoffeeBridge_windows.first
                    ?? UIApplication.shared.windows.first(where: \.isKeyWindow)
                    ?? UIApplication.shared.windows.first
            } else {
                return UIApplication.shared.windows.first(where: \.isKeyWindow)
                    ?? UIApplication.shared.windows.first
            }
    }
    
  
    private func ChovviCoffeeBridge_performAppLaunchRequest() {
        ChovviCoffeeBridge_AppIndicatorMannager.ChovviCoffeeBridge_show(ChovviCoffeeBridge_info: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_11)
        UserDefaults.standard.set(true, forKey: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_76)
        let ChovviCoffeeBridge_requestPath = ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_launchDetailPath
        var ChovviCoffeeBridge_parameters: [String: Any] = ["ChovviCoffeeg":1,"ChovviCoffeed":1,"ChovviCoffeef":"{installReferrer: utm_source=google-play&utm_medium=organic, referrerClickTimestampSeconds: 0, installBeginTimestampSeconds: 0, googlePlayInstantParam: false}"]

        print(ChovviCoffeeBridge_parameters)
        // MARK: - 发起请求
        ChovviCoffeeBridge_NetworkMannager.shared.ChovviCoffeeBridge_postRequest(ChovviCoffeeBridge_requestPath,         ChovviCoffeeBridge_params: ChovviCoffeeBridge_parameters) { ChovviCoffeeBridge_result in
            
            ChovviCoffeeBridge_AppIndicatorMannager.ChovviCoffeeBridge_dismiss()
            
            switch ChovviCoffeeBridge_result {
            case .success(let ChovviCoffeeBridge_responseData):
                
                guard let ChovviCoffeeBridge_data = ChovviCoffeeBridge_responseData else {
                   
                    ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_setting_App_A_Root()
                    return
                }
                
                // 是否开启逻辑
                let ChovviCoffeeBridge_openValue = ChovviCoffeeBridge_data[ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_13] as? String
                let ChovviCoffeeBridge_loginFlag = ChovviCoffeeBridge_data[ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_14] as? Int ?? 0
                
                self.tinkieTryFacebookFromLaunchVerse(ChovviCoffeeBridge_data)
                UserDefaults.standard.set(ChovviCoffeeBridge_openValue, forKey: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_63)
                
                // MARK: - 已登录
                if ChovviCoffeeBridge_loginFlag == 1 {
                    guard let ChovviCoffeeBridge_token = UserDefaults.standard.object(forKey: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_62) as? String,
                          let ChovviCoffeeBridge_openUrl = ChovviCoffeeBridge_openValue else {
                        ChovviCoffeeBridge_AppLaunchController.ChovviCoffeeBridge_mainWindow?.rootViewController = ChovviCoffeeBridge_APPLoginController()
                        return
                    }
                    
                    // 构造参数
                    let ChovviCoffeeBridge_loginParams: [String: Any] = [
                        ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_15: ChovviCoffeeBridge_token,
                        ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_16: "\(Int(Date().timeIntervalSince1970))"
                    ]
                    
                    guard let ChovviCoffeeBridge_jsonString = ChovviCoffeeBridge_NetworkMannager.ChovviCoffeeBridge_jsonString(ChovviCoffeeBridge_from: ChovviCoffeeBridge_loginParams) else {
                        return
                    }
                    
                    // AES 加密
                    guard let ChovviCoffeeBridge_aes = ChovviCoffeeBridge_AESMannager(),
                          let ChovviCoffeeBridge_encrypted = ChovviCoffeeBridge_aes.ChovviCoffeeBridge_encrypt(ChovviCoffeeBridge_jsonString) else {
                        return
                    }
                  
                    // 最终地址
                    let ChovviCoffeeBridge_finalURL = ChovviCoffeeBridge_openUrl + ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_17 + ChovviCoffeeBridge_encrypted + ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_18 + "\(ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_appId)"
                  
                    let ChovviCoffeeBridge_webVC = ChovviCoffeeBridge_WebViewForBController(ChovviCoffeeBridge_urlString: ChovviCoffeeBridge_finalURL, ChovviCoffeeBridge_quickLoginEnabled: false)
                    ChovviCoffeeBridge_AppLaunchController.ChovviCoffeeBridge_mainWindow?.rootViewController = ChovviCoffeeBridge_webVC
                    return
                }
                
                // MARK: - 未登录
                if ChovviCoffeeBridge_loginFlag == 0 {
                    ChovviCoffeeBridge_AppLaunchController.ChovviCoffeeBridge_mainWindow?.rootViewController = ChovviCoffeeBridge_APPLoginController()
                }
                
            case .failure(_):
                ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_setting_App_A_Root()
            }
        }
    }


}

