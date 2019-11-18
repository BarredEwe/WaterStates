open class ContentCondition: Condition {

    public var delayedTransition: DelayedTransition?

    private let delay: TimeInterval

    public init(delay: TimeInterval) {
        self.delay = delay
    }
    private var isFirstLoadingTransition = true

    public func setState<T>(_ state: State<T>, with stateMachine: StateMachine<T>) {
        switch state {
        case let .loading(info):
            delayedTransition?.cancel()
            if isFirstLoadingTransition {
                transitionToLoading(stateMachine: stateMachine, info: info)
            } else {
                performDelayedTransition(delay: delay) { [weak self] in
                    self?.transitionToLoading(stateMachine: stateMachine, info: info)
                }
            }
            isFirstLoadingTransition = false
        case let .content(value):
            delayedTransition?.cancel()
            stateMachine.displayable.hideContent()
            stateMachine.displayable.showContent(value)
        case let .empty(info):
            delayedTransition?.cancel()
            stateMachine.displayable.hideContent()
            stateMachine.displayable.showEmpty(info)
            stateMachine.condition = stateMachine.emptyCondition
        case let .error(info):
            delayedTransition?.cancel()
            stateMachine.displayable.hideContent()
            stateMachine.displayable.showError(info)
            stateMachine.condition = stateMachine.errorCondition
        }
    }

    private func transitionToLoading<T>(stateMachine: StateMachine<T>, info: StateInfo) {
        stateMachine.displayable.hideContent()
        stateMachine.displayable.showLoading(info)
        stateMachine.condition = stateMachine.loadingCondition
    }
}
