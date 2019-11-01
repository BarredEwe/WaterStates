//
//  Condition.swift
//  StateOfMind
//
//  Created by goncharov on 19/10/2018.
//

public typealias DelayedTransition = DispatchWorkItem

public protocol Condition: class {

    var delayedTransition: DelayedTransition? { get set }

    func setState<T>(_: State<T>, with: StateMachine<T>)
    func performDelayedTransition(delay: TimeInterval, callback: @escaping () -> Void)
    func processTransition(withMinPresentationTime: TimeInterval, currentStatePresentationTime: TimeInterval, callback: @escaping () -> Void)
}

public extension Condition {

    func performDelayedTransition(delay: TimeInterval, callback: @escaping () -> Void) {
        let delayedTransition = DispatchWorkItem { [weak self] in
            self?.delayedTransition = nil
            callback()
        }
        self.delayedTransition = delayedTransition
        DispatchQueue.main.asyncAfter(
            deadline: .now() + delay,
            execute: delayedTransition
        )
    }
    func processTransition(withMinPresentationTime minPresentationTime: TimeInterval,
                           currentStatePresentationTime: TimeInterval,
                           callback: @escaping () -> Void) {
        if currentStatePresentationTime < minPresentationTime {
            performDelayedTransition(delay: minPresentationTime - currentStatePresentationTime, callback: callback)
        } else {
            callback()
        }
    }

    var delayedTransition: DelayedTransition? {
        get { return nil }
        set {}
    }
}
