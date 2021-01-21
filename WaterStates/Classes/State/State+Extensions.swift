import Foundation

public extension State {
    static var loading: State {
        return .loading(StateInfo())
    }

    static var empty: State {
        return .empty(StateInfo())
    }

    static var error: State {
        return .error(StateInfo())
    }

    func set(loading: StateInfo? = nil, content: T? = nil, empty: StateInfo? = nil, error: StateInfo? = nil) -> State {
        switch (self, loading, content, empty, error) {
        case let (.loading, .some(type), _, _, _): return .loading(type)
        case let (.content, _, .some(value), _, _): return .content(value)
        case let (.empty, _, _, .some(type), _): return .empty(type)
        case let (.error, _, _, _, .some(value)): return .error(value)
        default: return self
        }
    }

    @discardableResult
    func `do`(onLoading: ((StateInfo) -> Void)? = nil,
              onContent: ((T) -> Void)? = nil,
              onEmpty: ((StateInfo) -> Void)? = nil,
              onError: ((StateInfo) -> Void)? = nil) -> State<T> {
        switch self {
        case let .loading(type): onLoading?(type)
        case let .content(value): onContent?(value)
        case let .empty(type): onEmpty?(type)
        case let .error(value): onError?(value)
        }
        return self
    }

    func map<U>(_ transform: (T) -> U) -> State<U> {
        switch self {
        case let .loading(type): return State<U>.loading(type)
        case let .content(value): return State<U>.content(transform(value))
        case let .empty(type): return State<U>.empty(type)
        case let .error(value): return State<U>.error(value)
        }
    }

    func mapContentToNil<U>() -> State<U>? {
        switch self {
        case let .loading(type): return State<U>.loading(type)
        case .content: return nil
        case let .empty(type): return State<U>.empty(type)
        case let .error(value): return State<U>.error(value)
        }
    }

    func flatMap<U>(none: State<U> = .empty, _ transform: (T) -> U?) -> State<U> {
        switch self {
        case let .loading(value): return State<U>.loading(value)
        case let .content(value):
            guard let result = transform(value) else { return none }
            return State<U>.content(result)
        case let .empty(value): return State<U>.empty(value)
        case let .error(value): return State<U>.error(value)
        }
    }

    init(_ value: T?, none: State<T> = .empty) {
        guard let value = value else {
            self = none
            return
        }
        self = .content(value)
    }
}

extension State where T: Collection {
    init(_ value: T) {
        guard !value.isEmpty else {
            self = .empty
            return
        }
        self = .content(value)
    }
}
