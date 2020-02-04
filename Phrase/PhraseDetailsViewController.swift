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
        view = UIView()
        preparePhraseView(for: phrase, scale: 1.5)(view)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return phrase.backgroundColor.uiColor.isDark ? .lightContent : .default
    }
}
