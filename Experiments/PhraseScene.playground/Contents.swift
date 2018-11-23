//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

enum FontName: String, Codable {
    case partyLetPlain, helvetica
}
enum FontSize: String, Codable {
    case small
    case medium
    case tall
    
    var cgFloat: CGFloat {
        switch self {
        case .small:
            return 32
        case .medium:
            return 48
        case .tall:
            return 64
        }
    }
}

enum PhraseColor: String, Codable {
    case blue, cyan, lightGray
    
    var uiColor: UIColor {
        switch self {
        case .blue:
            return UIColor.blue
        case .cyan:
            return UIColor.cyan
        case .lightGray:
            return .lightGray
        }
    }
}

struct Phrase: Codable {
    let backgroundColor: PhraseColor
    let parts: [Part]
    
    struct Part: Codable {
        let content: String
        let color: PhraseColor
        let fontName: FontName
        let size: FontSize
    }
}

func phraseView(for phrase: Phrase) -> UIView {
    let partViews = phrase.parts.map { part -> UILabel in
        let label = UILabel()
        label.font = UIFont(name: part.fontName.rawValue, size: part.size.cgFloat)
        label.text = part.content
        label.textColor = part.color.uiColor
        return label
    }
    let phraseView = UIStackView(arrangedSubviews: partViews)
    phraseView.alignment = .center
    phraseView.axis = .vertical
    phraseView.distribution = .equalSpacing
    phraseView.translatesAutoresizingMaskIntoConstraints = false
    
    let containerView = UIView()
    containerView.backgroundColor = phrase.backgroundColor.uiColor
    containerView.translatesAutoresizingMaskIntoConstraints = false
    containerView.addSubview(phraseView)
    
    NSLayoutConstraint.activate([
        phraseView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
        phraseView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    return containerView
}

let phrase = Phrase(
    backgroundColor: .lightGray,
    parts: [
        Phrase.Part(
            content: "Hello",
            color: .cyan,
            fontName: .helvetica,
            size: .small
        ),
        Phrase.Part(
            content: "World!",
            color: .cyan,
            fontName: .partyLetPlain,
            size: .tall
        )
    ]
)


class PhraseViewController : UIViewController {
    override func loadView() {
        self.view = phraseView(for: phrase)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = PhraseViewController()
