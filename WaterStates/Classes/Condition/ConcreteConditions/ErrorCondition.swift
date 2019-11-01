//
//  ErrorCondition.swift
//  StateOfMind
//
//  Created by goncharov on 19/10/2018.
//

open class ErrorCondition: Condition {

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
                stateMachine.displayable.hideError()
                stateMachine.displayable.showLoading(type)
                stateMachine.condition = stateMachine.loadingCondition
            }
        case let .content(value):
            delayedTransition?.cancel()
            stateMachine.displayable.hideError()
            stateMachine.displayable.showContent(value)
            stateMachine.condition = stateMachine.contentCondition
        case let .empty(type):
            delayedTransition?.cancel()
            stateMachine.displayable.hideError()
            stateMachine.displayable.showEmpty(type)
            stateMachine.condition = stateMachine.emptyCondition
        case let .error(value):
            delayedTransition?.cancel()
            stateMachine.displayable.hideError()
            stateMachine.displayable.showError(value)
        }
    }
}
