
import AdjustSdk
import FBSDKCoreKit
import WebKit
import UIKit


public class ChovviCoffeeBridge_VerifyReciptyParamaKey: NSObject {
    public var ChovviCoffeeBridge_payload: String
    public var ChovviCoffeeBridge_transactionId: String
    public var ChovviCoffeeBridge_callbackResult: String

    public init(ChovviCoffeeBridge_payload: String, ChovviCoffeeBridge_transactionId: String, ChovviCoffeeBridge_callbackResult: String) {
        self.ChovviCoffeeBridge_payload = ChovviCoffeeBridge_payload
        self.ChovviCoffeeBridge_transactionId = ChovviCoffeeBridge_transactionId
        self.ChovviCoffeeBridge_callbackResult = ChovviCoffeeBridge_callbackResult
    }
}
//app B包主页面

class ChovviCoffeeBridge_WebViewForBController: UIViewController ,WKNavigationDelegate, WKUIDelegate,WKScriptMessageHandler {
    private var ChovviCoffeeBridge_webViewContainer:WKWebView?
   
    var ChovviCoffeeBridge_pageLoadStartTime:TimeInterval = Date().timeIntervalSince1970
    
    private  var ChovviCoffeeBridge_isQuickLoginEnabled = false
    private var ChovviCoffeeBridge_hasRequestedNotificationAfterLoad = false
    private var ChovviCoffeeBridge_initialURLString:String
    
    init(ChovviCoffeeBridge_urlString:String,ChovviCoffeeBridge_quickLoginEnabled:Bool) {
        ChovviCoffeeBridge_initialURLString = ChovviCoffeeBridge_urlString
        
        ChovviCoffeeBridge_isQuickLoginEnabled = ChovviCoffeeBridge_quickLoginEnabled
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 禁用侧滑返回手势
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        // 注册 JS 消息处理
        let ChovviCoffeeBridge_userContentController = ChovviCoffeeBridge_webViewContainer?.configuration.userContentController
        ChovviCoffeeBridge_userContentController?.add(self, name: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_54)
        ChovviCoffeeBridge_userContentController?.add(self, name: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_55)
        ChovviCoffeeBridge_userContentController?.add(self, name: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_56)
        ChovviCoffeeBridge_userContentController?.add(self, name: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_71)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // 恢复侧滑返回手势
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        // 移除 JS 消息处理
        ChovviCoffeeBridge_webViewContainer?.configuration.userContentController.removeAllScriptMessageHandlers()
    }

 
    private func ChovviCoffeeBridge_addBackgroundImageView()  {
        let ChovviCoffeeBridge_laungchstr = ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_mainBackgroundImage
        
        let ChovviCoffeeBridge_backgroundImage = UIImage(named: ChovviCoffeeBridge_laungchstr)
       
        let ChovviCoffeeBridge_BbckgroundImageView = UIImageView(image:ChovviCoffeeBridge_backgroundImage )
        ChovviCoffeeBridge_BbckgroundImageView.contentMode = .scaleAspectFill
        ChovviCoffeeBridge_BbckgroundImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(ChovviCoffeeBridge_BbckgroundImageView)
       
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1️⃣ 添加背景图
        ChovviCoffeeBridge_addBackgroundImageView()
     
        // 2️⃣ 首次登录快速登录按钮
        if ChovviCoffeeBridge_isQuickLoginEnabled == true {
            ChovviCoffeeBridge_addLoginButton()
          
        }
        
        // 3️⃣ 配置 WebView
        let ChovviCoffeeBridge_webConfig = WKWebViewConfiguration()
        ChovviCoffeeBridge_webConfig.allowsAirPlayForMediaPlayback = false
        ChovviCoffeeBridge_webConfig.allowsInlineMediaPlayback = true
        ChovviCoffeeBridge_webConfig.preferences.javaScriptCanOpenWindowsAutomatically = true
        ChovviCoffeeBridge_webConfig.mediaTypesRequiringUserActionForPlayback = []
        
        ChovviCoffeeBridge_webViewContainer = WKWebView(frame: UIScreen.main.bounds, configuration: ChovviCoffeeBridge_webConfig)
        ChovviCoffeeBridge_webViewContainer?.isHidden = true
        ChovviCoffeeBridge_webViewContainer?.translatesAutoresizingMaskIntoConstraints = false
        ChovviCoffeeBridge_webViewContainer?.scrollView.alwaysBounceVertical = false
        ChovviCoffeeBridge_webViewContainer?.scrollView.contentInsetAdjustmentBehavior = .never
        ChovviCoffeeBridge_webViewContainer?.navigationDelegate = self
        ChovviCoffeeBridge_webViewContainer?.uiDelegate = self
        ChovviCoffeeBridge_webViewContainer?.allowsBackForwardNavigationGestures = true
        
        // 4️⃣ 加载 URL 并记录时间戳
        if let ChovviCoffeeBridge_url = URL(string: ChovviCoffeeBridge_initialURLString) {
            ChovviCoffeeBridge_webViewContainer?.load(URLRequest(url: ChovviCoffeeBridge_url))
            ChovviCoffeeBridge_pageLoadStartTime = Date().timeIntervalSince1970
        }
        
        view.addSubview(ChovviCoffeeBridge_webViewContainer!)
        
        // 5️⃣ 显示加载提示
        ChovviCoffeeBridge_AppIndicatorMannager.ChovviCoffeeBridge_show(ChovviCoffeeBridge_info: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_11)
    }
    private func ChovviCoffeeBridge_addLoginButton()  {
        let  ChovviCoffeeBridge_loginButton = UIButton.init()
        let ChovviCoffeeBridge_laungchstr = ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_loginButtonBackImage
        
        let ChovviCoffeeBridge_backgroundImage = UIImage(named: ChovviCoffeeBridge_laungchstr)
     
        ChovviCoffeeBridge_loginButton.setBackgroundImage(ChovviCoffeeBridge_backgroundImage, for: .normal)
  
        
       
        ChovviCoffeeBridge_loginButton.isUserInteractionEnabled = false
        
        view.addSubview(ChovviCoffeeBridge_loginButton)
       
        ChovviCoffeeBridge_loginButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            ChovviCoffeeBridge_loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            ChovviCoffeeBridge_loginButton.heightAnchor.constraint(equalToConstant: ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_logButtonHeight),
            ChovviCoffeeBridge_loginButton.widthAnchor.constraint(equalToConstant: ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_logButtonWidth),
            ChovviCoffeeBridge_loginButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                              constant: -self.view.safeAreaInsets.bottom - 55)
        ])
       
    }
   
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for window: WKWindowFeatures, completionHandler: @escaping (WKWebView?) -> Void) {
        completionHandler(nil)
      
    
    }
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

        if let url = navigationAction.request.url,
           let scheme = url.scheme?.lowercased(),
           scheme != "http" && scheme != "https" && scheme != "file" && scheme != "about" {

//            UIApplication.shared.open(url, options: [:]) { [weak webView] success in
//                let state = success ? "success" : "failed"
//                let js = """
//                window.dispatchEvent(new CustomEvent('nativeOpenState', {
//                    detail: { state: '\(state)', url: '\(url.absoluteString)' }
//                }));
//                """
//                DispatchQueue.main.async {
//                    webView?.evaluateJavaScript(js, completionHandler: nil)
//                }
//            }

            decisionHandler(.cancel)
            return
        }

        decisionHandler(.allow)
    }
    
    deinit {
        self.ChovviCoffeeBridge_webViewContainer?.configuration.userContentController.removeScriptMessageHandler(forName: "openBrowser")
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
       
            if(navigationAction.targetFrame == nil || navigationAction.targetFrame?.isMainFrame != nil) {
             
                if let chuckleChoreographer = navigationAction.request.url {
                    UIApplication.shared.open(chuckleChoreographer,options: [:]) { bool in
                       
                    }
                }
            }
            
       
          return nil
    }
    
    
    func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping @MainActor (WKPermissionDecision) -> Void) {
        decisionHandler(.grant)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        // 1️⃣ 页面加载完成，显示加载指示器并隐藏遮罩
        ChovviCoffeeBridge_webViewContainer?.isHidden = false
        ChovviCoffeeBridge_AppIndicatorMannager.ChovviCoffeeBridge_dismiss()
        ChovviCoffeeBridge_requestNotificationAfterWebLoadIfNeeded()

        // 2️⃣ 首次加载标记复位
        if ChovviCoffeeBridge_isQuickLoginEnabled == true {
            ChovviCoffeeBridge_isQuickLoginEnabled = false
        }

        // 3️⃣ 上报页面停留时间
        let ChovviCoffeeBridge_reportURL = ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_reportTimePath
        let ChovviCoffeeBridge_params: [String: Any] = [
            ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_reportTimeParamaKey:
                "\(Int(Date().timeIntervalSince1970 * 1000 - self.ChovviCoffeeBridge_pageLoadStartTime * 1000))"
        ]

        ChovviCoffeeBridge_NetworkMannager.shared.ChovviCoffeeBridge_postRequest(ChovviCoffeeBridge_reportURL,         ChovviCoffeeBridge_params: ChovviCoffeeBridge_params)
    }

    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {

        // -------------------------------
        // 充值支付业务
        // -------------------------------
        if message.name == ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_54,
           let ChovviCoffeeBridge_payload = message.body as? [String: Any] {

            let ChovviCoffeeBridge_productID = ChovviCoffeeBridge_payload[ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_57] as? String ?? ""
            let ChovviCoffeeBridge_orderCode = ChovviCoffeeBridge_payload[ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_58] as? String ?? ""

            view.isUserInteractionEnabled = false
            ChovviCoffeeBridge_AppIndicatorMannager.ChovviCoffeeBridge_show(ChovviCoffeeBridge_info: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_59)

            ChovviCoffeeBridge_AppStorePurchaseMananager.shared.ChovviCoffeeBridge_startPurchase(ChovviCoffeeBridge_productID: ChovviCoffeeBridge_productID) { result in
                ChovviCoffeeBridge_AppIndicatorMannager.ChovviCoffeeBridge_dismiss()
                self.view.isUserInteractionEnabled = true

                switch result {

                case .success:
                    // 1. 获取本地票据 + 交易号
                    guard let ChovviCoffeeBridge_receiptData = ChovviCoffeeBridge_AppStorePurchaseMananager.shared.ChovviCoffeeBridge_obtainLocalReceipt(),
                          let ChovviCoffeeBridge_transactionID = ChovviCoffeeBridge_AppStorePurchaseMananager.shared.ChovviCoffeeBridge_transactionID else {
                        ChovviCoffeeBridge_AppIndicatorMannager.ChovviCoffeeBridge_showInfo(ChovviCoffeeBridge_withStatus: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_60)
                        return
                    }

                    // 2. 转 orderCode 为 JSON 字符串
                    guard let ChovviCoffeeBridge_jsonData = try? JSONSerialization.data(
                            withJSONObject: [ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_58: ChovviCoffeeBridge_orderCode],
                            options: [.prettyPrinted]
                          ),
                          let orderCodeJSONString = String(data: ChovviCoffeeBridge_jsonData, encoding: .utf8) else {
                        ChovviCoffeeBridge_AppIndicatorMannager.ChovviCoffeeBridge_showInfo(ChovviCoffeeBridge_withStatus: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_60)
                        return
                    }

                    // 3. 请求后端验票据
                    ChovviCoffeeBridge_NetworkMannager.shared.ChovviCoffeeBridge_postRequest(
                        ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_verifyReciptyPath,
                                ChovviCoffeeBridge_params: [
                            ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_verifyReciptyParamaKey.ChovviCoffeeBridge_payload:
                                ChovviCoffeeBridge_receiptData.base64EncodedString(),

                            ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_verifyReciptyParamaKey.ChovviCoffeeBridge_transactionId:
                                ChovviCoffeeBridge_transactionID,

                            ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_verifyReciptyParamaKey.ChovviCoffeeBridge_callbackResult:
                                orderCodeJSONString
                        ],
                                ChovviCoffeeBridge_isPaymentFlow: true
                    ) { result in
                        
                        self.view.isUserInteractionEnabled = true

                        switch result {
                        case .success:
                            self.ChovviCoffeeBridge_reportPurchaseAnalytics(ChovviCoffeeBridge_transactionID: ChovviCoffeeBridge_transactionID, ChovviCoffeeBridge_productID: ChovviCoffeeBridge_productID)
                            ChovviCoffeeBridge_AppIndicatorMannager.ChovviCoffeeBridge_showSuccess(ChovviCoffeeBridge_withStatus: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_30)
                           
                        case .failure:
                            ChovviCoffeeBridge_AppIndicatorMannager.ChovviCoffeeBridge_showInfo(ChovviCoffeeBridge_withStatus: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_60)
                        }
                    }


                case .failure(let error):
                    self.view.isUserInteractionEnabled = true
                    ChovviCoffeeBridge_AppIndicatorMannager.ChovviCoffeeBridge_showInfo(ChovviCoffeeBridge_withStatus: error.localizedDescription)
                }
            }

            return
        }


        // -------------------------------
        // 登出
        // -------------------------------
        if message.name == ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_55 {

            UserDefaults.standard.set(nil, forKey: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_62)

            let ChovviCoffeeBridge_nav = ChovviCoffeeBridge_APPLoginController()
            ChovviCoffeeBridge_AppLaunchController.ChovviCoffeeBridge_mainWindow?.rootViewController = ChovviCoffeeBridge_nav

            return
        }


        // -------------------------------
        // 页面加载完成
        // -------------------------------
        if message.name == ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_56 {
            ChovviCoffeeBridge_webViewContainer?.isHidden = false
            ChovviCoffeeBridge_AppIndicatorMannager.ChovviCoffeeBridge_dismiss()
            ChovviCoffeeBridge_requestNotificationAfterWebLoadIfNeeded()
        }
        //打开浏览器
        if message.name == ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_71,
           let ChovviCoffeeBridge_body = message.body as? [String: Any],
           let ChovviCoffeeBridge_urlString = ChovviCoffeeBridge_body[ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_72] as? String,
            let ChovviCoffeeBridge_url = URL(string: ChovviCoffeeBridge_urlString)
        
        {
            UIApplication.shared.open(ChovviCoffeeBridge_url, options: [:]){ [weak self] success in
                let state = success ? "success" : "failed"
                let js = """
                window.dispatchEvent(new CustomEvent('nativeOpenState', {
                    detail: { state: '\(state)', url: '\(ChovviCoffeeBridge_url.absoluteString)' }
                }));
                """
                DispatchQueue.main.async {
                    self?.ChovviCoffeeBridge_webViewContainer?.evaluateJavaScript(js, completionHandler: nil)
                }
            }
       
        }
    }

 
    private func ChovviCoffeeBridge_requestNotificationAfterWebLoadIfNeeded() {
        guard !ChovviCoffeeBridge_hasRequestedNotificationAfterLoad else { return }
        ChovviCoffeeBridge_hasRequestedNotificationAfterLoad = true
        ChovviCoffeeBridge_SDK.shared.ChovviCoffeeBridge_requestNotifacation()
    }


    private func ChovviCoffeeBridge_reportPurchaseAnalytics(ChovviCoffeeBridge_transactionID:String,ChovviCoffeeBridge_productID:String) {
        guard let ChovviCoffeeBridge_priceTuple = ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_purchaseParama.first(where: { $0.0 == ChovviCoffeeBridge_productID }),
              let ChovviCoffeeBridge_priceValue = Double(ChovviCoffeeBridge_priceTuple.1) else { return }
        
        let ChovviCoffeeBridge_fbParams: [String: Any] = [
            ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_73: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_74
        ]
   
        AppEvents.logPurchase(ChovviCoffeeBridge_priceValue,
                              currency: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_66,
                              parameters: ChovviCoffeeBridge_fbParams)
       
        let ChovviCoffeeBridge_adjustEvent = ADJEvent(eventToken: ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_adjustPurchaseToken)
        ChovviCoffeeBridge_adjustEvent?.setProductId(ChovviCoffeeBridge_productID)
        ChovviCoffeeBridge_adjustEvent?.setTransactionId(ChovviCoffeeBridge_transactionID)
        ChovviCoffeeBridge_adjustEvent?.setRevenue(ChovviCoffeeBridge_priceValue, currency: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_66)

        Adjust.trackEvent(ChovviCoffeeBridge_adjustEvent)
      
    }
}
    
