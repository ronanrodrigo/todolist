import Foundation

extension String {

    static let empty = ""

    struct Tasks {
        struct List {
            static let title = String.translate(key: "tasks.list.title")
        }
    }

    static func translate(key: String, comment: String = .empty, _ args: CVarArg...) -> String {
        let format = NSLocalizedString(key, comment: comment)
        return String(format: format, locale: Locale.current, arguments: args)
    }

}
