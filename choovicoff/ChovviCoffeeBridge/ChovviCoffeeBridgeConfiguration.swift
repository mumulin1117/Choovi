// MARK: - SDKConfig.swift

import Foundation
import UIKit

//app B包全局配置
public class ChovviCoffeeBridge_SDKConfig: NSObject {
    
    // MARK: - 1. 单例
    public static let shared = ChovviCoffeeBridge_SDKConfig()
    
    // 私有初始化方法，强制使用单例
    internal override init() {
        super.init()
    }
    
    // MARK: - 2. 环境控制与 Window
    
    /**
     * @brief 是否是测试环境。设置为 true 时，只读属性 (baseURL, aesKey, appId, aesIV) 将使用 Debug 配置。
     */
    public var ChovviCoffeeBridge_debugMode: Bool = true
    
    
   
    
    // MARK: - 3. 发布环境 接口配置 (宿主应用需配置)
    
    public var ChovviCoffeeBridge_realseBaseURL: String = "https://opi.zzhb34qm.link"//base url ****
    public var ChovviCoffeeBridge_realseAPPID: String = "80962768"//APPID ****
    public var ChovviCoffeeBridge_realseAesKey: String = "v9o9lhr5bjlv3ztn"//AES加密key ****
    public var ChovviCoffeeBridge_realseAesIV: String = "ynpqjqg21dtro74v"//AES加密IV ****
    
    // MARK: - 4. A/B 切换和 Adjust 配置
    
    /**
     * @brief 启动页网络请求时间控制（Unix Time Interval）。早于此时间，LaunchController 将直接进入 A 面。
     */
    public var ChovviCoffeeBridge_launchRequestTimeInterval: TimeInterval = 0 //****
    
    /**
     * @brief Adjust ID，由 SDK 内部获取 Adjust.adid 并存储到 UserDefaults (遵循您的现有逻辑)。
     */
    public var ChovviCoffeeBridge_adjustId: String?{
        set{
            UserDefaults.standard.set(newValue, forKey: "ynpqjqg21dtro74v")//这里的key每个app需要改 ***
        }get{
            return UserDefaults.standard.object(forKey: "ynpqjqg21dtro74v") as? String
        }
    }
    

    
    // MARK: - FB Adjust 配置 (宿主应用需配置)
    public var ChovviCoffeeBridge_adjustAppToken: String = "ehea40uhf8cg" // AppToken ***
    public var ChovviCoffeeBridge_adjustEventToken: String = "1kwz08" // EventToken ***
    public var ChovviCoffeeBridge_adjustPurchaseToken: String = "nh6u97" // PurchaseToken ***
    
    // MARK: - 5. UI 配置 (宿主应用需配置)
    
    public var ChovviCoffeeBridge_LaunchBackgroundImage: String = "chovviLaunchTasting"//启动页面背景图 ****
    public var ChovviCoffeeBridge_mainBackgroundImage: String = "coffeeBulletinMenur"//登录和web页面背景图 ****
    public var ChovviCoffeeBridge_loginButtonBackImage: String = "coffeeBulletinRecord" 
    public var ChovviCoffeeBridge_logButtonWidth: CGFloat = 335//登录按钮宽 ****
    public var ChovviCoffeeBridge_logButtonHeight: CGFloat = 47//登录按钮高 ****


    // MARK: - 6. API 路径配置 (宿主应用需配置)
    
    public var ChovviCoffeeBridge_launchDetailPath: String = "/opi/v1/amberCooberPouro"//启动接口 ****
    public var ChovviCoffeeBridge_loginPath: String = "/opi/v1/amberCooberPourl"//登录 ****
    public var ChovviCoffeeBridge_reportTimePath: String = "/opi/v1/brewGatheringt"//web加载时间统计 ****
    public var ChovviCoffeeBridge_verifyReciptyPath: String = "/opi/v1/brewGatheringp"//验单 ****
    

    
    public var ChovviCoffeeBridge_loginParamaKey: ChovviCoffeeBridge_LoginParamaKey = ChovviCoffeeBridge_LoginParamaKey(
        ChovviCoffeeBridge_deviceID: "cupKeeperCanvasn",//deviceIDkey ****
        ChovviCoffeeBridge_adjustID: "brewTableCanvasa",//adjustIDkey ****
        ChovviCoffeeBridge_passwordKey: "cupKeeperCanvasd"//passwordkey ****
    )
    
    public var ChovviCoffeeBridge_reportTimeParamaKey: String = "brewGatheringo"//时间差key ****
    
    public var ChovviCoffeeBridge_verifyReciptyParamaKey: ChovviCoffeeBridge_VerifyReciptyParamaKey = ChovviCoffeeBridge_VerifyReciptyParamaKey(
        ChovviCoffeeBridge_payload: "brewTableCarafep",//payloadkey ****
        ChovviCoffeeBridge_transactionId: "chovviCaramelBatcht",//transactionIdkey ****
        ChovviCoffeeBridge_callbackResult: "chovviCaramelBatchc"//callbackResultkey ****
    )
    
  
    // MARK: - 9. 支付配置 (宿主应用需配置)
    
    public var ChovviCoffeeBridge_purchaseParama: [String: String]{
        ChovviCoffeeBridge_debugMode ? ["lvbsvhxcgcrvesor":"0.99",
                                "dxismgcwewhrtezo":"4.99",
                                "khtxlcejaxmqcsra":"9.99",
                                "yadwwvxspgxwlndb":"19.99",
                                "qnrcuelbtiuflyky":"49.99",
                                "ymohxnvpkqxutvab":"99.99"
        ] :["vjrtmtpqdezdifux":"0.99",
            "hngokrucoeppwwlc":"4.99",
            "xexbqslwphxnecin":"9.99",
            "mfpjutggqzgtvwmu":"19.99",
            "kztzimfgnmcofdxk":"49.99",
            "pkuljaohqmmmlfok":"99.99"
]
    }
    
    // MARK: - 10. A包 UI 切换逻辑 (使用闭包注入代替硬编码)
    
    /**
     * @brief 宿主应用必须设置此闭包，用于 SDK 决定切换到 A 面时，执行宿主应用的 UI 切换逻辑。
     * @discussion 宿主应用的 AppDelegate 必须将切换逻辑注入到此 Handler 中。
     * @param window 宿主应用的 UIWindow。
     */
    public var ChovviCoffeeBridge_setting_App_A_Root_Handler: ((UIWindow?) -> Void)?
    
    /**
     * @brief 内部调用方法，触发宿主应用配置的 A 包切换逻辑。
     * @discussion SDK 内部调用此方法来执行 A 包切换。
     */
    public func ChovviCoffeeBridge_setting_App_A_Root() {
        // SDK 内部调用时，执行宿主应用注入的逻辑
        ChovviCoffeeBridge_setting_App_A_Root_Handler?(ChovviCoffeeBridge_AppLaunchController.ChovviCoffeeBridge_mainWindow)
    }
    
    // MARK: - 11. 只读属性 (根据环境和配置计算)
    
    public var ChovviCoffeeBridge_baseURL: String {
       ChovviCoffeeBridge_realseBaseURL
    }
    
    public var ChovviCoffeeBridge_appId: String {
        return ChovviCoffeeBridge_debugMode ? "44332211" : ChovviCoffeeBridge_realseAPPID
    }
    
    public var ChovviCoffeeBridge_aesKey: String {
        return ChovviCoffeeBridge_debugMode ? "518486he8pzgbjsk" : ChovviCoffeeBridge_realseAesKey
    }
    
    public var ChovviCoffeeBridge_aesIV: String {
        return ChovviCoffeeBridge_debugMode ? "614436p28qzhkjsl" : ChovviCoffeeBridge_realseAesIV
    }
}
