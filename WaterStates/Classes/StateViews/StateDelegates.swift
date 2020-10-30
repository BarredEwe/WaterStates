import Foundation

public protocol EmptyStateDelegate: class {
    func emptyActionTapped(with type: StateActionType)
}

public extension EmptyStateDelegate {
    func emptyActionTapped(with _: StateActionType) {}
}

public protocol ErrorStateDelegate: class {
    func errorActionTapped(with type: StateActionType)
}

public extension ErrorStateDelegate {
    func errorActionTapped(with _: StateActionType) {}
}

public protocol WaterStatesDelegate: EmptyStateDelegate, ErrorStateDelegate {}
