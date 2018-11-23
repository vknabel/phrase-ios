//
//  ConversationsTableViewController.swift
//  Phrase
//
//  Created by Valentin Knabel on 17.11.18.
//  Copyright © 2018 Valentin Knabel. All rights reserved.
//

import UIKit

class ConversationsTableViewController: UITableViewController {
    var conversations = mockedConversationsPhrases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNibCellType(ConversationTableViewCell.self)
        tableView.separatorStyle = .none
        tableView.separatorInset = .zero
        tableView.backgroundColor = .black
        tableView.insetsLayoutMarginsFromSafeArea = true
        tableView.insetsContentViewsToSafeArea = true
        tableView.contentInset = .init(top: marginUnits(1), left: 0, bottom: marginUnits(3), right: 0)
        tableView.indicatorStyle = .white
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: ConversationTableViewCell.self, for: indexPath)
        cell.conversation = conversations[indexPath.item]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = PhraseDetailsViewController(phrase: conversations[indexPath.item].phrase)
        present(details, animated: true) {
            sleep(2)
            details.dismiss(animated: true)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension UITableView {
    func registerCellType<C: UITableViewCell>(_ cell: C.Type) {
        register(cell, forCellReuseIdentifier: String(describing: cell))
    }
    
    func registerNibCellType<C: UITableViewCell>(_ cell: C.Type) {
        register(
            UINib(nibName: String(describing: ConversationTableViewCell.self), bundle: nil),
            forCellReuseIdentifier: String(describing: ConversationTableViewCell.self)
        )
    }
    
    func dequeueCell<C: UITableViewCell>(type: C.Type, for indexPath: IndexPath) -> C {
        return dequeueReusableCell(withIdentifier: String(describing: type), for: indexPath) as! C
    }
}
