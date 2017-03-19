import Foundation
import UIKit

extension UIColor {

    private struct Theme {

        static let green = #colorLiteral(red: 0.3169207275, green: 0.7658930421, blue: 0.3081178963, alpha: 1)

        static let red = #colorLiteral(red: 0.8694893718, green: 0.2262032628, blue: 0.2339557111, alpha: 1)

    }

    static let successBackground = UIColor.Theme.green

    static let failBackground = UIColor.Theme.red

}
