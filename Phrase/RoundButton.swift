//
//  RoundButton.swift
//  Phrase
//
//  Created by Valentin Knabel on 17.11.18.
//  Copyright © 2018 Valentin Knabel. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
        layer.cornerRadius = frame.size.width / 2
    }
}
