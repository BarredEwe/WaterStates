import Foundation

/// Main conditions
public enum State<T> {
    case loading(StateInfo)
    case content(T)
    case error(StateInfo)
    case empty(StateInfo)
}

public typealias DefaultState = State<Any>
