//
//  ConversationViewController.swift
//  Phrase
//
//  Created by Valentin Knabel on 31.01.19.
//  Copyright © 2019 Valentin Knabel. All rights reserved.
//

import UIKit
import Overture

class ConversationViewController: UIViewController {
    lazy var messagesViewController = { MessagesTableViewController(conversation: self.conversation) }()
    lazy var writingViewController = { UIViewController() }()
    lazy var keyboardHeight = {
        writingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    }()
    var subscriptions: [AnyObject] = []
    let conversation: Conversation
    
    init(conversation: Conversation) {
        self.conversation = conversation
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = Theme.backgroundColor
        navigationItem.titleView = updateObject(UIView(), preparePhraseView(
            for: conversation.phrase,
            scale: 0.3,
            swapColors: true
        ))
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = Theme.backgroundColor
        navigationController?.navigationBar.shadowImage = UIImage()

        addChild(messagesViewController)
        view.addSubview(messagesViewController.view)
        messagesViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(writingViewController)
        view.addSubview(writingViewController.view)
        writingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messagesViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            messagesViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            messagesViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            
            writingViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            writingViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboardHeight,
            
            messagesViewController.view.bottomAnchor.constraint(equalTo: writingViewController.view.topAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Theme.setCurrentPhrase(conversation.phrase)

        subscriptions.append(NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: .main,
            using: { [weak self] notification in
                guard let self = self, let animationCurve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt, let endFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect, let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {return}
                
                self.view.setNeedsLayout()
                UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: animationCurve), animations: {
                    self.keyboardHeight.constant = -endFrame.height
                    self.view.layoutIfNeeded()
                })
            }
        ))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if traitCollection.userInterfaceStyle == .dark {
            return .lightContent
        } else if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .lightContent
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
