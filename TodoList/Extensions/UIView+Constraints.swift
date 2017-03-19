import UIKit

extension UIView {

    func edges(equalToView view: UIView, constant: CGFloat = 0) {
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant).isActive = true
    }

    func edges(equalToLayout layout: UILayoutGuide) {
        leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        topAnchor.constraint(equalTo: layout.topAnchor).isActive = true
        trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: layout.bottomAnchor).isActive = true
    }
    
}
