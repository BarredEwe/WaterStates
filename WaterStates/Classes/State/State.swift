import Foundation

/// Main conditions
public enum State<T> {
    case loading(StateInfo)
    case content(T)
    case error(StateInfo)
    case empty(StateInfo)

    public static func loading(type: StateInfo.StateType = .default,
                               _ title: String? = nil,
                               description: String? = nil,
                               userInfo: [AnyHashable: Any]? = nil) -> Self {
        return .loading(StateInfo(type: type, title: title, description: description, userInfo: userInfo))
    }

    public static func error(type: StateInfo.StateType = .default,
                             _ title: String? = nil,
                             description: String? = nil,
                             userInfo: [AnyHashable: Any]? = nil) -> Self {
        return .error(StateInfo(type: type, title: title, description: description, userInfo: userInfo))
    }

    public static func empty(type: StateInfo.StateType = .default,
                             _ title: String? = nil,
                             description: String? = nil,
                             userInfo: [AnyHashable: Any]? = nil) -> Self {
        return .empty(StateInfo(type: type, title: title, description: description, userInfo: userInfo))
    }
}

public typealias DefaultState = State<Any>
