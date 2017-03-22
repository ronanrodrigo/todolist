import Foundation

public extension String {

    static let empty = ""

    public struct Tasks {
        public struct List {
            public static let title = String.translate(key: "tasks.list.title")
        }
        public struct Create {
            public static let title = String.translate(key: "tasks.create.title")
            public struct Message {
                public static let success = String.translate(key: "tasks.create.message.success")
            }
        }
        public struct Label {
            public static let title = String.translate(key: "tasks.create.label.title")
        }
    }

    public static func translate(key: String, comment: String = .empty, _ args: CVarArg...) -> String {
        let format = NSLocalizedString(key, comment: comment)
        return String(format: format, locale: Locale.current, arguments: args)
    }

}
