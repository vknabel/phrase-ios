//
//  PhrasesCollectionViewController.swift
//  Phrase
//
//  Created by Valentin Knabel on 17.11.18.
//  Copyright © 2018 Valentin Knabel. All rights reserved.
//

import Overture
import UIKit

class PhrasesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    private let phrases: [Phrase]
    
    init(phrases: [Phrase]) {
        self.phrases = phrases
        let layout = UICollectionViewFlowLayout()
        layout.sectionInsetReference = .fromSafeArea
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = marginUnits(2)
        layout.minimumLineSpacing = marginUnits(2)
        super.init(collectionViewLayout: layout)
        
        collectionView.registerCellType(PhraseCollectionViewCell.self)
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.indicatorStyle = .white
        collectionView.contentInset = .init(
            top: marginUnits(2),
            left: marginUnits(2),
            bottom: marginUnits(3),
            right: marginUnits(2)
        )
        
        view.addStatusBarUnderlay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return phrases.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: PhraseCollectionViewCell.self, for: indexPath)
        cell.phrase = phrases[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width
        let cellWidth = (width - 3 * marginUnits(2)) / 2
        let cellHeight = 1.5 * cellWidth
        return .init(width: cellWidth, height: cellHeight)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let phrase = phrases[indexPath.item]
        let details = PhraseDetailsViewController(phrase: phrase)
        present(details, animated: true) {
            sleep(2)
            sleep(2)
            details.dismiss(animated: true)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension UICollectionView {
    func registerCellType<C: UICollectionViewCell>(_ cell: C.Type) {
        register(cell, forCellWithReuseIdentifier: String(describing: cell))
    }
    
    func dequeueCell<C: UICollectionViewCell>(type: C.Type, for indexPath: IndexPath) -> C {
        return dequeueReusableCell(withReuseIdentifier: String(describing: type), for: indexPath) as! C
    }
}
