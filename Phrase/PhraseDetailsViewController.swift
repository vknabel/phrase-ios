//
//  PhraseDetailsViewController.swift
//  Phrase
//
//  Created by Valentin Knabel on 17.11.18.
//  Copyright © 2018 Valentin Knabel. All rights reserved.
//

import Overture
import UIKit

class PhraseDetailsViewController: UIViewController {
    private let phrase: Phrase
    
    init(phrase: Phrase) {
        self.phrase = phrase
        super.init(nibName: nil, bundle: nil)
        
        Theme.setCurrentPhrase(phrase)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = with(UIView(), preparePhraseView(for: phrase, scale: 1.5))
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return phrase.backgroundColor.uiColor.isDark ? .lightContent : .default
    }
}

func preparePhraseView(for phrase: Phrase, scale: CGFloat = 1.0, swapColors: Bool = false) -> (UIView) -> Void {
    return { containerView in
        let partViews = phrase.lines.map { line -> UILabel in
            return with(
                UILabel(), concat(
                    mut(\.font, UIFont(name: line.fontType.rawValue, size: line.size.cgFloat * scale)),
                    mut(\.text, line.content),
                    mut(\.textColor, swapColors ? phrase.backgroundColor.uiColor : phrase.foregroundColor.uiColor)
                )
            )
        }
        let phraseView = with(
            UIStackView(arrangedSubviews: partViews), concat(
                mut(\.alignment, .center),
                mut(\.axis, .vertical),
                mut(\.distribution, .equalSpacing),
                mut(\.translatesAutoresizingMaskIntoConstraints, false)
            )
        )
        containerView.backgroundColor = swapColors ? phrase.foregroundColor.uiColor : phrase.backgroundColor.uiColor
        containerView.addSubview(phraseView)
        
        NSLayoutConstraint.activate(
            [
                phraseView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
                phraseView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
            ]
        )
    }
}
