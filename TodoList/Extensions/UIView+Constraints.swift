import UIKit

extension UIView {

    func edges(equalToView view: UIView) {
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    func edges(equalToLayout layout: UILayoutGuide) {
        leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        topAnchor.constraint(equalTo: layout.topAnchor).isActive = true
        trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: layout.bottomAnchor).isActive = true
    }
    
}
