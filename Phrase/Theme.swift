//
//  Theme.swift
//  Phrase
//
//  Created by Valentin Knabel on 17.11.18.
//  Copyright © 2018 Valentin Knabel. All rights reserved.
//

import Overture
import UIKit

class Theme {
    private(set) static var tintColor: UIColor = mockedPhrases.randomElement()!.backgroundColor.uiColor {
        didSet {
            DispatchQueue.main.async {
                prominentCreationButton(color: tintColor)(prominentButton)
                UIApplication.shared.delegate?.window??.tintColor = tintColor
            }
        }
    }

    static let prominentButton = with(RoundButton(), prominentCreationButton(color: tintColor))

    static func setCurrentPhrase(_ phrase: Phrase) {
        tintColor = phrase.backgroundColor.uiColor
    }
}
