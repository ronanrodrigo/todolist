import Foundation

extension String {

    static let empty = ""

    struct Tasks {
        struct List {
            static let title = String.translate(key: "tasks.list.title")
        }
        struct Create {
            static let title = String.translate(key: "tasks.create.title")
            struct Message {
                static let success = String.translate(key: "tasks.create.message.success")
            }
        }
        struct Label {
            static let title = String.translate(key: "tasks.create.label.title")
        }
    }

    static func translate(key: String, comment: String = .empty, _ args: CVarArg...) -> String {
        let format = NSLocalizedString(key, comment: comment)
        return String(format: format, locale: Locale.current, arguments: args)
    }

}
