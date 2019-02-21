//
//  MessageTableViewCell.swift
//  Phrase
//
//  Created by Valentin Knabel on 15.02.19.
//  Copyright © 2019 Valentin Knabel. All rights reserved.
//

import UIKit
import Overture

class MessageTableViewCell: UITableViewCell {
    @IBOutlet var container: UIView!
    @IBOutlet var contentsLabel: UILabel!
    
    var authorContraints: [NSLayoutConstraint]!
    var ownerConstraints: [NSLayoutConstraint]!
    
    var message: Message? {
        didSet {
            refresh()
        }
    }
    var conversation: Conversation? {
        didSet {
            refresh()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        container.layer.cornerRadius = 8
        
        authorContraints = contentView.constraints
            .filter { $0.identifier == "author" }
        ownerConstraints = contentView.constraints
            .filter { $0.identifier == "owner" }
        
        refresh()
    }

    func refresh() {
        guard let contentsLabel = contentsLabel, let container = container, let message = message, let conversation = conversation else {return}
        
        authorContraints.forEach(mut(\.isActive, message.sendByAuthor))
        ownerConstraints.forEach(mut(\.isActive, !(message.sendByAuthor)))
        
        contentsLabel.text = message.text
        contentsLabel.textColor = message.sendByAuthor
            ? conversation.phrase.backgroundColor.uiColor
            : conversation.phrase.foregroundColor.uiColor
        contentsLabel.font = UIFont(name: conversation.author.fontType.rawValue, size: 19) // TODO: bold
        container.backgroundColor = message.sendByAuthor
            ? conversation.phrase.foregroundColor.uiColor
            : conversation.phrase.backgroundColor.uiColor
    }
}

