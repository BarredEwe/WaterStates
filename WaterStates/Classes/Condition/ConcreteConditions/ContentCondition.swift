open class ContentCondition: Condition {

    public var delayedTransition: DelayedTransition?

    private let delay: TimeInterval

    public init(delay: TimeInterval) {
        self.delay = delay
    }
    private var isFirstLoadingTransition = true

    public func setState<T>(_ state: State<T>, with stateMachine: StateMachine<T>) {
        switch state {
        case let .loading(type):
            delayedTransition?.cancel()
            if isFirstLoadingTransition {
                transitionToLoading(stateMachine: stateMachine, type: type)
            } else {
                performDelayedTransition(delay: delay) { [weak self] in
                    self?.transitionToLoading(stateMachine: stateMachine, type: type)
                }
            }
            isFirstLoadingTransition = false
        case let .content(value):
            delayedTransition?.cancel()
            stateMachine.displayable.hideContent()
            stateMachine.displayable.showContent(value)
        case let .empty(type):
            delayedTransition?.cancel()
            stateMachine.displayable.hideContent()
            stateMachine.displayable.showEmpty(type)
            stateMachine.condition = stateMachine.emptyCondition
        case let .error(value):
            delayedTransition?.cancel()
            stateMachine.displayable.hideContent()
            stateMachine.displayable.showError(value)
            stateMachine.condition = stateMachine.errorCondition
        }
    }

    private func transitionToLoading<T>(stateMachine: StateMachine<T>, type: String) {
        stateMachine.displayable.hideContent()
        stateMachine.displayable.showLoading(type)
        stateMachine.condition = stateMachine.loadingCondition
    }
}
