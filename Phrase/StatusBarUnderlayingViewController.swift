//
//  StatusBarUnderlayingViewController.swift
//  Phrase
//
//  Created by Valentin Knabel on 19.11.18.
//  Copyright © 2018 Valentin Knabel. All rights reserved.
//

import UIKit

class StatusBarUnderlayingViewController<Child: UIViewController>: UIViewController {
    let childViewController: Child
    init(embed viewController: Child) {
        childViewController = viewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        
        addChild(childViewController)
        view.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
        
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            childViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            childViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            childViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            childViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        view.addStatusBarUnderlay()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle  {
        return .lightContent
    }
}
