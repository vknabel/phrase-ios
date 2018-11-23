//
//  DomainModel.swift
//  Phrase
//
//  Created by Valentin Knabel on 17.11.18.
//  Copyright © 2018 Valentin Knabel. All rights reserved.
//

import Foundation

struct User: Codable {
    var name: String
    var fontType: FontType
}

final class Phrase: Codable {
    typealias ID = Int
    var id: Int?
    var lines: [Line]
    var backgroundColor: Color
    var foregroundColor: Color

    init(id: Int? = nil, backgroundColor: Color, foregroundColor: Color, lines: [Line]) {
        self.id = id
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.lines = lines
    }
}

struct Conversation: Codable {
    var messagePreview: String
    var author: User
    var phrase: Phrase
}

final class Message: Codable {
    typealias ID = Int
    var id: Int?
    var text: String
    var phraseID: Phrase.ID
    var sendByAuthor: Bool
    var date: Date

    init(id: Int? = nil, text: String, phraseID: Phrase.ID, sendByAuthor: Bool, date: Date = Date()) {
        self.id = id
        self.text = text
        self.phraseID = phraseID
        self.sendByAuthor = sendByAuthor
        self.date = date
    }
}

enum ContentSize: Int, Codable {
    case small, medium, tall

    static func reflectDecoded() -> (ContentSize, ContentSize) {
        return (.small, .tall)
    }
}

enum FontType: String, Codable {
    case langdon, other, helveticaNeueLight, sourceSansPro="Source Sans Pro"
}

struct Line: Equatable, Codable {
    var content: String
    var size: ContentSize
    var fontType: FontType

    static func reflectDecoded() -> (Line, Line) {
        return (
            Line(content: "Hello", size: .small, fontType: .langdon),
            Line(content: "World", size: .medium, fontType: .other)
        )
    }
}

enum Color: String, Codable, CaseIterable {
    case light, dark, grey, red, green, blue, yellow, purple, cyan, lavender, orange, lemonGrass, black
}

import UIKit

extension Color {
    var uiColor: UIColor {
        switch self {
        case .blue:
            return .init(rgb: 0x4A90E2)
        case .dark:
            return UIColor.darkGray
        case .black:
            return UIColor.black
        case .green:
            return .green
        case .light:
            return .lightGray
        case .lemonGrass:
            return .init(rgb: 0xB8E986)
        case .grey:
            return .init(rgb: 0x9B9B9B)
        case .red:
            return .init(rgb: 0xD0021B)
        case .orange:
            return .init(rgb: 0xF5A623)
        case .purple:
            return .init(rgb: 0x9013FE)
        case .lavender:
            return .init(rgb: 0xCB86E9)
        case .yellow:
            return .init(rgb: 0xF8E71C)
        case .cyan:
            return .init(rgb: 0x50E3C2)
        }
    }
}

extension ContentSize {
    var cgFloat: CGFloat {
        switch self {
        case .small:
            return 36
        case .medium:
            return 36
        case .tall:
            return 36
        }
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }

    var isDark: Bool {
        var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0
        getRed(&red, green: &green, blue: &blue, alpha: nil)
        red *= 255
        green *= 255
        blue *= 255
        return ((red * 299) + (green * 587) + (blue * 114)) / 1000 < 125
    }
}
