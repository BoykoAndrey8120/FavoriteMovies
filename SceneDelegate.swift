//
//  SceneDelegate.swift
//  FavoriteMovies
//
//  Created by Andrey Boyko on 31.08.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
  
        guard let _ = (scene as? UIWindowScene) else { return }
        window = UIWindow()
        guard let windowScene = (scene as? UIWindowScene) else { return }

                let window = UIWindow(windowScene: windowScene)
                window.rootViewController = HomeViewController()
                self.window = window
                window.makeKeyAndVisible()
    }
}

