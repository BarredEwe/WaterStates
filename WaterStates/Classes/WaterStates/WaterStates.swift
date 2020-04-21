import UIKit

public protocol WaterStates: StateDisplayable {
    func showState(_ state: State<ContentType>)

    var errorView: WaterStateView? { get }
    var loadingView: WaterStateView? { get }
    var emptyView: WaterStateView? { get }
}

private class WaterStatesManager {

    var errorView: [String: WaterStateView] = [:]
    var loadingView: [String: WaterStateView] = [:]
    var emptyView: [String: WaterStateView] = [:]

    static var shared: WaterStatesManager = {
        return WaterStatesManager()
    }()
}

public extension WaterStates where Self: UIViewController {

    internal var stateMachine: StateMachine<ContentType>? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.stateMachine) as? StateMachine
        }
        set(newValue) {
            return objc_setAssociatedObject(self, &AssociatedKeys.stateMachine, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    var errorView: WaterStateView? {
        get {
            return WaterStatesManager.shared.errorView[self.description]
        }
        set(newValue) {
            WaterStatesManager.shared.errorView[self.description] = newValue
        }
    }

    var loadingView: WaterStateView? {
        get {
            return WaterStatesManager.shared.loadingView[self.description]
        }
        set(newValue) {
            WaterStatesManager.shared.loadingView[self.description] = newValue
        }
    }

    var emptyView: WaterStateView? {
        get {
            return WaterStatesManager.shared.emptyView[self.description]
        }
        set(newValue) {
            WaterStatesManager.shared.emptyView[self.description] = newValue
        }
    }
}

internal struct AssociatedKeys {
    static var stateMachine = "AssociatedKeys.stateMachine"
    static var errorView = "AssociatedKeys.errorView"
    static var loadingView = "AssociatedKeys.loadingView"
    static var emptyView = "AssociatedKeys.emptyView"
}
