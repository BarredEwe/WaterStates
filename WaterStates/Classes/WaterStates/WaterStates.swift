import UIKit

public protocol WaterStates: StateDisplayable {
    func showState(_ state: State<ContentType>)

    var errorView: WaterStateView? { get }
    var loadingView: WaterStateView? { get }
    var emptyView: WaterStateView? { get }
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
            return objc_getAssociatedObject(self, &AssociatedKeys.errorView) as? WaterStateView
        }
        set(newValue) {
            return objc_setAssociatedObject(self, &AssociatedKeys.errorView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    var loadingView: WaterStateView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.loadingView) as? WaterStateView
        }
        set(newValue) {
            return objc_setAssociatedObject(self, &AssociatedKeys.loadingView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    var emptyView: WaterStateView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.emptyView) as? WaterStateView
        }
        set(newValue) {
            return objc_setAssociatedObject(self, &AssociatedKeys.emptyView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

internal struct AssociatedKeys {
    static var stateMachine = "AssociatedKeys.stateMachine"
    static var errorView = "AssociatedKeys.errorView"
    static var loadingView = "AssociatedKeys.loadingView"
    static var emptyView = "AssociatedKeys.emptyView"
}
