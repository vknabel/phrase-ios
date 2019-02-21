//
//  Mocks.swift
//  Phrase
//
//  Created by Valentin Knabel on 17.11.18.
//  Copyright © 2018 Valentin Knabel. All rights reserved.
//

import Foundation

let mockedPhrases = [
    (Color.purple, Color.lavender),
    (Color.yellow, Color.black),
    (Color.cyan, Color.black),
    (Color.red, Color.orange),
    (Color.blue, Color.lemonGrass),
    (Color.grey, Color.black),
]
.map { mock in
    Phrase(
        backgroundColor: mock.0,
        foregroundColor: mock.1,
        lines: [
            Line(
                content: "One Hello",
                size: .medium,
                fontType: .langdon
            ),
            Line(
                content: "World",
                size: .medium,
                fontType: .langdon
            ),
            Line(
                content: "A Day",
                size: .medium,
                fontType: .langdon
            ),
        ]
    )
}

let mockedConversationsPhrases = [
    (Color.purple, Color.lavender),
    (Color.yellow, Color.black),
    (Color.cyan, Color.black),
    (Color.red, Color.orange),
    (Color.blue, Color.lemonGrass),
    (Color.grey, Color.black),
]
.map { mock in
    Conversation(
        messagePreview: "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        author: User(name: "codergeek121", fontType: .sourceSansPro),
        phrase: Phrase(
            backgroundColor: mock.0,
            foregroundColor: mock.1,
            lines: [
                Line(
                    content: "One Hello",
                    size: .medium,
                    fontType: .langdon
                ),
                Line(
                    content: "World",
                    size: .medium,
                    fontType: .langdon
                ),
                Line(
                    content: "A Day",
                    size: .medium,
                    fontType: .langdon
                ),
            ]
        )
    )
}

let mockedPhrase = mockedPhrases.randomElement()!

let mockedMessages = Array([
    Message(text: "Hallo", phraseID: 1, sendByAuthor: true),
    Message(text: "Hi", phraseID: 1, sendByAuthor: false),
    Message(text: "Was geht?", phraseID: 1, sendByAuthor: true),
    Message(text: "Nix.", phraseID: 1, sendByAuthor: false),
    Message(text: "Lorem ipsum dolor sit amet", phraseID: 1, sendByAuthor: true),
    Message(text: "Cool", phraseID: 1, sendByAuthor: false),
].reversed())
