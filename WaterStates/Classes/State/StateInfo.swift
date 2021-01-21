import Foundation

public struct StateInfo {
    public typealias StateType = String

    /// Type of state for customization (default "WaterState.default").
    public var type: StateType

    /// Title to display in state (default nil).
    public var title: String?

    /// Description to display in state (default nil).
    public var description: String?

    /// Additional user info
    public var userInfo: [AnyHashable: Any]?

    public init(type: StateType = .default, title: String? = nil, description: String? = nil, userInfo: [AnyHashable: Any]? = nil) {
        self.type = type
        self.title = title
        self.description = description
        self.userInfo = userInfo
    }
}

public extension StateInfo.StateType {
    static let `default`: String = "WaterState.default"
}
