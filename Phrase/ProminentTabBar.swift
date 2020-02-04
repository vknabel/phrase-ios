//
//  ProminentTabBar.swift
//  Phrase
//
//  Created by Valentin Knabel on 17.11.18.
//  Copyright © 2018 Valentin Knabel. All rights reserved.
//

import Overture
import UIKit

public func marginUnits(_ n: Int) -> CGFloat {
    return CGFloat(n * 8)
}

public func prominentSubview(_ prominent: UIView) -> (UITabBarController) -> Void {
    prominent.translatesAutoresizingMaskIntoConstraints = false
    return { controller in
        controller.view.addSubview(prominent)
        NSLayoutConstraint.activate(
            [
                controller.tabBar.centerXAnchor.constraint(equalTo: prominent.centerXAnchor),
                controller.tabBar.topAnchor.constraint(equalTo: prominent.centerYAnchor, constant: marginUnits(-2)),
            ]
        )
        controller.view.bringSubviewToFront(prominent)
    }
}

public func prominentCreationButton(color: UIColor) -> (UIButton) -> Void {
    return { button in
        button.setImage(
            UIImage(named: "Create")?.withRenderingMode(.alwaysTemplate),
            for: .normal
        )
        button.backgroundColor = color.isDark ? .init(rgb: 0xe5e5e5) : .init(rgb: 0x1b1b1b)
        button.tintColor = color
        button.layer.masksToBounds = false
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: -2)
        button.layer.shadowRadius = marginUnits(1)
        button.layer.shadowColor = UIColor.black.cgColor // TODO: light mode
        button.clipsToBounds = true
        button.isUserInteractionEnabled = true
        button.sizeToFit()
        NSLayoutConstraint.activate(
            [
                button.heightAnchor.constraint(equalToConstant: 64),
                button.widthAnchor.constraint(equalToConstant: 64),
            ]
        )
    }
}
