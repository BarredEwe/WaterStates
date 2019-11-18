import Foundation

public struct StateInfo {

    public static let defaultStateType = "WaterState.default"

    /// Type of state for customization (default "WaterState.default").
    public var type: String

    /// Title to display in state (default nil).
    public var title: String?
    /// Description to display in state (default nil).
    public var description: String?

    public init(type: String = defaultStateType, title: String? = nil, description: String? = nil) {
        self.type = type
        self.title = title
        self.description = description
    }
}
