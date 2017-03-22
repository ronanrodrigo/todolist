import Foundation

public extension String {

    public enum Predicate {
        case equal(fieldName: String)

        public func format() -> String {
            switch self {
            case let .equal(fieldName):
                return "\(fieldName) == %@"
            }
        }
    }

}
