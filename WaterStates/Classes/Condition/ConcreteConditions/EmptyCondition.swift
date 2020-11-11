import Foundation

open class EmptyCondition: Condition {
    public var delayedTransition: DelayedTransition?

    private let delay: TimeInterval

    public init(delay: TimeInterval) {
        self.delay = delay
    }

    public func setState<T>(_ state: State<T>, with stateMachine: StateMachine<T>) {
        switch state {
        case let .loading(type):
            delayedTransition?.cancel()
            performDelayedTransition(delay: delay) {
                stateMachine.displayable.hideEmpty()
                stateMachine.displayable.showLoading(type)
                stateMachine.condition = stateMachine.loadingCondition
            }
        case let .content(value):
            delayedTransition?.cancel()
            stateMachine.displayable.hideEmpty()
            stateMachine.displayable.showContent(value)
            stateMachine.condition = stateMachine.contentCondition
        case let .empty(type):
            delayedTransition?.cancel()
            stateMachine.displayable.hideEmpty()
            stateMachine.displayable.showEmpty(type)
        case let .error(value):
            delayedTransition?.cancel()
            stateMachine.displayable.hideEmpty()
            stateMachine.displayable.showError(value)
            stateMachine.condition = stateMachine.errorCondition
        }
    }
}
