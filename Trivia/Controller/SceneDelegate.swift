//
//  SceneDelegate.swift
//  Trivia
//
//  Created by Pallavi on 19/01/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

