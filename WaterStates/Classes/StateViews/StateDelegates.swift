import Foundation

public protocol EmptyStateDelegate: class {
    func emptyActionTapped(with type: StateActionType)
}

public extension EmptyStateDelegate {
    func emptyActionTapped(with type: StateActionType) { }
}

public protocol ErrorStateDelegate: class {
    func errorActionTapped(with type: StateActionType)
}

public extension ErrorStateDelegate {
    func errorActionTapped(with type: StateActionType) { }
}

public protocol WaterStatesDelegate: EmptyStateDelegate, ErrorStateDelegate { }
