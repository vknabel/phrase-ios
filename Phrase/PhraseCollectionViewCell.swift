//
//  PhraseCollectionViewCell.swift
//  Phrase
//
//  Created by Valentin Knabel on 17.11.18.
//  Copyright © 2018 Valentin Knabel. All rights reserved.
//

import Overture
import UIKit

class PhraseCollectionViewCell: UICollectionViewCell {
    var phrase: Phrase? {
        willSet {
            contentView.layer.cornerRadius = 8
            for view in contentView.subviews {
                view.removeFromSuperview()
            }
            backgroundColor = .clear
            guard let phrase = newValue else { return }
            with(contentView, preparePhraseView(for: phrase))
        }
    }
}
