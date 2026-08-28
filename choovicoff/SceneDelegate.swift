//
//  SceneDelegate.swift
//  choovicoff
//
//  Created by choovicoff on 2026/7/3.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let firstSipCanvas = scene as? UIWindowScene else { return }
        let firstSipScroll = UIWindow(windowScene: firstSipCanvas)
        ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_setting_App_A_Root_Handler = { chovviWindow in
            chovviWindow?.rootViewController = ChovviCocoaBrew()
        }
        firstSipScroll.rootViewController = ChovviCoffeeBridge_SDK.shared.ChovviCoffeeBridge_getLaunchViewController()
        window = firstSipScroll
       
        ChovviCoffeeBridge_SDK.shared.ChovviCoffeeBridge_initializeSDK(with: firstSipScroll)
        
        firstSipScroll.makeKeyAndVisible()
    }

   

}
