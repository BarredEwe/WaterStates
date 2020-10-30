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
        WaterStatesManager()
    }()
}

public extension WaterStates where Self: UIViewController {
    internal var stateMachine: StateMachine<ContentType>? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.stateMachine) as? StateMachine
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.stateMachine, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    var errorView: WaterStateView? {
        get {
            return WaterStatesManager.shared.errorView[description]
        }
        set(newValue) {
            WaterStatesManager.shared.errorView[description] = newValue
        }
    }

    var loadingView: WaterStateView? {
        get {
            return WaterStatesManager.shared.loadingView[description]
        }
        set(newValue) {
            WaterStatesManager.shared.loadingView[description] = newValue
        }
    }

    var emptyView: WaterStateView? {
        get {
            return WaterStatesManager.shared.emptyView[description]
        }
        set(newValue) {
            WaterStatesManager.shared.emptyView[description] = newValue
        }
    }
}

internal enum AssociatedKeys {
    static var stateMachine = "AssociatedKeys.stateMachine"
    static var errorView = "AssociatedKeys.errorView"
    static var loadingView = "AssociatedKeys.loadingView"
    static var emptyView = "AssociatedKeys.emptyView"
}
