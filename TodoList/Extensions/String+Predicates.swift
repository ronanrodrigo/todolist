import Foundation

extension String {

    enum Predicate {
        case equal(fieldName: String)

        func format() -> String {
            switch self {
            case let .equal(fieldName):
                return "\(fieldName) == %@"
            }
        }
    }

}
