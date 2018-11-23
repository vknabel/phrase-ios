//
//  ConversationTableViewCell.swift
//  Phrase
//
//  Created by Valentin Knabel on 17.11.18.
//  Copyright © 2018 Valentin Knabel. All rights reserved.
//

import UIKit
import Overture

@objc class ConversationTableViewCell: UITableViewCell {
    @IBOutlet weak var conversationContainer: UIView!
    @IBOutlet weak var phraseContainer: UIView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var latestMessageLabel: UILabel!
    
    var conversation: Conversation? {
        didSet {
            if phraseContainer != nil {
                refresh()
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        refresh()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        refresh()
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        refresh()
    }
    
    private func refresh() {
        selectedBackgroundView = UIView()
        conversationContainer.layer.cornerRadius = 8
        guard let conversation = conversation else {
            conversationContainer.backgroundColor = .clear
            phraseContainer.backgroundColor = .clear
            return
        }
        with(phraseContainer, preparePhraseView(for: conversation.phrase, scale: 0.5))
        conversationContainer.backgroundColor = conversation.phrase.backgroundColor.uiColor
        if isSelected || isHighlighted {
            backgroundColor  = conversation.phrase.backgroundColor.uiColor
            selectedBackgroundView?.backgroundColor = conversation.phrase.backgroundColor.uiColor
        } else {
            backgroundColor = .clear
        }
        userLabel.text = conversation.author.name
        userLabel.textColor = conversation.phrase.foregroundColor.uiColor
        userLabel.font = UIFont(name: conversation.author.fontType.rawValue, size: 19) // TODO: bold
        
        latestMessageLabel.text = conversation.messagePreview
        latestMessageLabel.textColor = conversation.phrase.foregroundColor.uiColor
        latestMessageLabel.font = UIFont(name: conversation.author.fontType.rawValue, size: 15)
    }
}
