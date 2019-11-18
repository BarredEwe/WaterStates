import Foundation

open class StateMachine<T> {

    public let displayable: WeakAnyStateDisplayable<T>

    public var condition: Condition
    public var loadingCondition: Condition
    public var contentCondition: Condition
    public var emptyCondition: Condition
    public var errorCondition: Condition

    var currentStatePresentationTime: TimeInterval {
        return Date().timeIntervalSince(stateSetupTime)
    }

    private var dispatchWorkItem: DispatchWorkItem?
    private var stateSetupTime = Date()

    public init<U: StateDisplayable>(displayable: U,
                              loadingCondition: Condition = LoadingCondition(minPresentationTime: WaterStatesConfig.loadingDefaultMinPresentationTime),
                              contentCondition: Condition = ContentCondition(delay: WaterStatesConfig.loadingDefaultDelay),
                              emptyCondition: Condition = EmptyCondition(delay: WaterStatesConfig.loadingDefaultDelay),
                              errorCondition: Condition = ErrorCondition(delay: WaterStatesConfig.loadingDefaultDelay)
        ) where U.ContentType == T {
        self.displayable = WeakAnyStateDisplayable(displayable)
        self.loadingCondition = loadingCondition
        self.contentCondition = contentCondition
        self.emptyCondition = emptyCondition
        self.errorCondition = errorCondition
        condition = contentCondition
    }

    public func setState(_ state: State<T>) {
        stateSetupTime = Date()
        condition.setState(state, with: self)
    }
}
