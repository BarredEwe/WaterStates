import Foundation

open class LoadingCondition: Condition {
    public var delayedTransition: DelayedTransition?

    private let minPresentationTime: TimeInterval

    public init(minPresentationTime: TimeInterval) {
        self.minPresentationTime = minPresentationTime
    }

    public func setState<T>(_ state: State<T>, with stateMachine: StateMachine<T>) {
        switch state {
        case .loading: return
        case let .content(value):
            processTransition(withMinPresentationTime: minPresentationTime, currentStatePresentationTime: stateMachine.currentStatePresentationTime) {
                stateMachine.displayable.hideLoading()
                stateMachine.displayable.showContent(value)
                stateMachine.condition = stateMachine.contentCondition
            }
        case let .empty(value):
            processTransition(withMinPresentationTime: minPresentationTime, currentStatePresentationTime: stateMachine.currentStatePresentationTime) {
                stateMachine.displayable.hideLoading()
                stateMachine.displayable.showEmpty(value)
                stateMachine.condition = stateMachine.emptyCondition
            }
        case let .error(value):
            processTransition(withMinPresentationTime: minPresentationTime, currentStatePresentationTime: stateMachine.currentStatePresentationTime) {
                stateMachine.displayable.hideLoading()
                stateMachine.displayable.showError(value)
                stateMachine.condition = stateMachine.errorCondition
            }
        }
    }
}
