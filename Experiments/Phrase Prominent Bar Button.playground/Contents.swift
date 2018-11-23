//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

extension UITabBarController {
    func addProminent(button: UIButton) {
//        button.adjustsImageWhenHighlighted = false
        //button.addTarget(clickTarget, action: #selector(Target.trigger), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        
        button.sizeToFit()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true

        view.addSubview(button)
        button.addTarget(self, action: #selector(overclick), for: .touchUpInside)

        tabBar.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        tabBar.topAnchor.constraint(equalTo: button.centerYAnchor, constant: -8).isActive = true
        button.heightAnchor.constraint(equalTo: tabBar.heightAnchor, multiplier: 1.2).isActive = true
        button.widthAnchor.constraint(equalTo: tabBar.heightAnchor, multiplier: 1.2).isActive = true

        view.bringSubviewToFront(button)
    }
    
    
    @objc func overclick() {
        let alert = UIAlertController(
            title: "Click!",
            message: "clickidyMcClickclick",
            preferredStyle: .alert
        )
        alert.addAction(.init(title: "click", style: .default))
        present(alert, animated: true) {
            
        }
    }
}

class ProminentTabBarController: UITabBarController {
    private let prominentButton: () -> UIButton
    var button: UIButton?
    
    init(prominentButton: @escaping @autoclosure () -> UIButton, viewControllers: [UIViewController]) {
        self.prominentButton = prominentButton
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = viewControllers
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "new-2.png"), for: .normal)
        addProminent(button: button)
    }
    
}

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}

class MyViewController2 : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}

@objc class Target: NSObject {
    private let callback: () -> Void
    init(invoke callback: @escaping () -> Void) {
        self.callback = callback
    }
    
    @objc func trigger() {
        callback()
    }
}

var tabBarController: ProminentTabBarController!
let clickTarget = Target {
    let alert = UIAlertController(
        title: "Click!",
        message: "clickidyMcClickclick",
        preferredStyle: .alert
    )
    alert.addAction(.init(title: "click", style: .default))
    tabBarController.present(alert, animated: true) {
        
    }
}
let button = UIButton(type: .custom)
button.setImage(#imageLiteral(resourceName: "new-2.png"), for: .normal)
button.adjustsImageWhenHighlighted = false
//button.addTarget(clickTarget, action: #selector(Target.trigger), for: .touchUpInside)
button.isUserInteractionEnabled = true

// Present the view controller in the Live View window
tabBarController = ProminentTabBarController(
    prominentButton: button,
    viewControllers: [
        {
            let controller = MyViewController()
            controller.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.favorites, tag: 1)
            return controller
        }(),
        {
            let controller = MyViewController2()
            controller.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.bookmarks, tag: 0)
            return controller
        }()
    ]
)

PlaygroundPage.current.liveView = tabBarController
