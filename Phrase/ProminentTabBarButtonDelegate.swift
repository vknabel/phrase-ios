//
//  ProminentTabBarButtonDelegate.swift
//  Phrase
//
//  Created by Valentin Knabel on 15.02.19.
//  Copyright © 2019 Valentin Knabel. All rights reserved.
//

import UIKit

final class ProminentTabBarButtonDelegate: NSObject, UINavigationControllerDelegate,UITabBarControllerDelegate, UITabBarDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController.hidesBottomBarWhenPushed {
            Theme.prominentButton.isHidden = true
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if !viewController.hidesBottomBarWhenPushed {
            Theme.prominentButton.isHidden = false // TODO: bugfix with layout. Maybe subclass TabBarController
        }
    }
}
