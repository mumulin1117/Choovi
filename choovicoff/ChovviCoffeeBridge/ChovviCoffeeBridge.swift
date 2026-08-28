

// MARK: - ChovviCoffeeBridge_SDK.swift (SDK 主入口)

import UIKit
import AdjustSdk
import FBSDKCoreKit
import UserNotifications



public class ChovviCoffeeBridge_SDK: NSObject, AdjustDelegate {


    // MARK: - 1. 单例
     static let shared = ChovviCoffeeBridge_SDK()
    private var ChovviCoffeeBridge_notificationRequestStarted = false
    
    // MARK: - 暴露配置类
    public var ChovviCoffeeBridge_config: ChovviCoffeeBridge_SDKConfig {
        return ChovviCoffeeBridge_SDKConfig.shared
    }
    
    
    
    private override init() {
        super.init()
    }
    
    // MARK: - 2. 配置与初始化
   
    public func ChovviCoffeeBridge_initializeSDK(with mainWindow:UIWindow) {
        
          
        // 2. Adjust SDK 初始化 (来自 AppDelegate+Config.swift)
        self.ChovviCoffeeBridge_trackInitialEvent()
        
        // 3. 屏幕保护 (来自 AppDelegate+Config.swift)
        self.ChovviCoffeeBridge_addSecrectProtect(with: mainWindow)

    }
    
 
    public func ChovviCoffeeBridge_getLaunchViewController() -> UIViewController {
    
        return ChovviCoffeeBridge_AppLaunchController()
    }

    
 
    @objc public func ChovviCoffeeBridge_didRegisterForRemoteNotifications(deviceToken: Data) {
     
        let ChovviCoffeeBridge_pushtoken = deviceToken.map { String(format: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_1, $0) }.joined()
  
        UserDefaults.standard.set(ChovviCoffeeBridge_pushtoken, forKey: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_61)
        
    }
    
    
    // MARK: - 内部配置方法 (从 AppDelegate+Config 抽取)
    
    private func ChovviCoffeeBridge_trackInitialEvent() {
      
        Adjust.addGlobalCallbackParameter(ChovviCoffeeBridge_KeyChainMannager.ChovviCoffeeBridge_getEquipmentOnlyID(), forKey: "ta_distinct_id")
        
        guard let ChovviCoffeeBridge_config = self.ChovviCoffeeBridge_configureAdjust() else { return }
        Adjust.initSdk(ChovviCoffeeBridge_config)
        Adjust.attribution { _ in
            let ChovviCoffeeBridge_initEvent = ADJEvent(eventToken: ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_adjustEventToken)
            Adjust.trackEvent(ChovviCoffeeBridge_initEvent)
        }
     
        Adjust.adid { ChovviCoffeeBridge_adId in
            ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_adjustId = ChovviCoffeeBridge_adId
        }
    }

    private func ChovviCoffeeBridge_configureAdjust() -> ADJConfig? {
       
        let ChovviCoffeeBridge_environment = ADJEnvironmentProduction
        let ChovviCoffeeBridge_config = ADJConfig(appToken: ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_adjustAppToken, environment: ChovviCoffeeBridge_environment)
        ChovviCoffeeBridge_config?.logLevel = .verbose
        ChovviCoffeeBridge_config?.delegate = self
        ChovviCoffeeBridge_config?.enableSendingInBackground()
        return ChovviCoffeeBridge_config
    }
    
    func ChovviCoffeeBridge_requestNotifacation() {
        guard !ChovviCoffeeBridge_notificationRequestStarted else { return }
        ChovviCoffeeBridge_notificationRequestStarted = true
        let ChovviCoffeeBridge_notificationCenter = UNUserNotificationCenter.current()
        ChovviCoffeeBridge_notificationCenter.delegate = self
        ChovviCoffeeBridge_notificationCenter.getNotificationSettings { [weak self] ChovviCoffeeBridge_settings in
            switch ChovviCoffeeBridge_settings.authorizationStatus {
            case .notDetermined:
                ChovviCoffeeBridge_notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                    DispatchQueue.main.async {
                        if granted {
                            UIApplication.shared.registerForRemoteNotifications()
                        }
                    }
                }
            case .authorized, .provisional, .ephemeral:
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            case .denied:
                break
            @unknown default:
                self?.ChovviCoffeeBridge_notificationRequestStarted = false
            }
        }
    }
    
     private func ChovviCoffeeBridge_addSecrectProtect(with mainWindow:UIWindow)  {
        
        if (Date().timeIntervalSince1970 < ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_launchRequestTimeInterval ) == true {

            return

        }
        
        let ChovviCoffeeBridge_texf = UITextField()
        ChovviCoffeeBridge_texf.isSecureTextEntry = true
     
        if (!mainWindow.subviews.contains(ChovviCoffeeBridge_texf))  {
            mainWindow.addSubview(ChovviCoffeeBridge_texf)
            
            ChovviCoffeeBridge_texf.centerYAnchor.constraint(equalTo: mainWindow.centerYAnchor).isActive = true
           
            ChovviCoffeeBridge_texf.centerXAnchor.constraint(equalTo: mainWindow.centerXAnchor).isActive = true
            
            mainWindow.layer.superlayer?.addSublayer(ChovviCoffeeBridge_texf.layer)
           
            
            if #available(iOS 17.0, *) {
                
                ChovviCoffeeBridge_texf.layer.sublayers?.last?.addSublayer(mainWindow.layer)
            } else {
               
                ChovviCoffeeBridge_texf.layer.sublayers?.first?.addSublayer(mainWindow.layer)
            }
        }
    }
    
    
    
}

extension ChovviCoffeeBridge_SDK: UNUserNotificationCenterDelegate {
    
    nonisolated public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
       
        completionHandler([.alert, .sound, .badge])
    }
    
    nonisolated public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
      
        completionHandler()
    }
}
