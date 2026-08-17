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
        firstSipScroll.rootViewController = ChovviCocoaBrew()
        window = firstSipScroll
        firstSipScroll.makeKeyAndVisible()
    }

   

}
