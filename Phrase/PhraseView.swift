//
//  PhraseView.swift
//  Phrase
//
//  Created by Valentin Knabel on 01.10.19.
//  Copyright © 2019 Valentin Knabel. All rights reserved.
//

import UIKit
import Overture

final class PhraseView: UIView {
    var phrase: Phrase?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func apply() {
        
    }
}

final class LineView: UIView {
    var line: Line?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

func preparePhraseView(for phrase: Phrase, scale: CGFloat = 1.0, swapColors: Bool = false) -> (UIView) -> Void {
    return { containerView in
        let partViews = phrase.lines.map { line -> UILabel in
            let changes = concat(
                mut(\UILabel.font, UIFont(name: line.fontType.rawValue, size: line.size.cgFloat * scale)),
                mut(\.text, line.content),
                mut(\.textColor, swapColors ? phrase.backgroundColor.uiColor : phrase.foregroundColor.uiColor)
            )
            var label = UILabel()
            changes(&label)
            return label
        }
        let phraseView = update(
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
