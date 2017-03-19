import Foundation
import UIKit

extension UINavigationController {

    func show(message: String, backgroundColor: UIColor) {
        let messageLabel = UILabel(frame: .zero)
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.textColor = .white
        messageLabel.backgroundColor = backgroundColor
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.font = .systemFont(ofSize: CGFloat.Font.mini)

        view.addSubview(messageLabel)
        messageLabel.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        messageLabel.heightAnchor.constraint(equalToConstant: .messageHeight).isActive = true

        UIView.animate(withDuration: .defaultAnimationDuration, delay: .defaultDelay, options: [], animations: {
            messageLabel.alpha = CGFloat.Transparency.invisible
        }, completion: { isCompleted in
            if isCompleted { messageLabel.removeFromSuperview() }
        })
        view.layoutIfNeeded()
    }

}
