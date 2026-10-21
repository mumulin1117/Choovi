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

        window = firstSipScroll
//        firstSipScroll.rootViewController = ChovviCocoaBrew()
        
        window?.makeKeyAndVisible()
        
        chovviBotanicalAcidity.cckuiForestActionButton.vieQuietTrailCloseTapped(uviaTrailRoster:firstSipScroll) {
        
//            let uviaForestWindow = UIWindow(windowScene: firstSipCanvas)
//            let cckuiRouteCoordinator = UviaForresWelcominer(uviaForestWindow: uviaForestWindow)
//            self.uviaForestRouteCoordinator = cckuiRouteCoordinator
            return ChovviCocoaBrew()//cckuiRouteCoordinator.uviaForestCircleStart()
        }
        
    }

   

}
