//
//  StatusBarUnderlayView.swift
//  Phrase
//
//  Created by Valentin Knabel on 19.11.18.
//  Copyright © 2018 Valentin Knabel. All rights reserved.
//

import UIKit

extension UIView {
    func addStatusBarUnderlay() {
        let statusbarUnderlay = UIView()
        statusbarUnderlay.backgroundColor = Theme.backgroundColor
        statusbarUnderlay.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(statusbarUnderlay)
        statusbarUnderlay.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        statusbarUnderlay.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        statusbarUnderlay.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        statusbarUnderlay.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}
