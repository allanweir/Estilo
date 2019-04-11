//: A UIKit based Playground for presenting user interface

import UIKit
import Estilo
import PlaygroundSupport

extension LabelStyle {
    static let demoStyle = LabelStyle(properties: [
        Styles.Label.textColor(.red)
    ])
}

class DemoViewController : UIViewController {
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.apply(style: .demoStyle)
        label.text = "Hello World!"
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = DemoViewController()
