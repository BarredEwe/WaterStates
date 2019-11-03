//
//  WaterStates+StateDispalyble.swift
//  WaterStates_Example
//
//  Created by Максим Гришутин on 01.11.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public extension WaterStates where Self: UIViewController {

    func showState(_ state: State<ContentType>) {
        if stateMachine == nil { stateMachine = StateMachine(displayable: self) }
        stateMachine?.setState(state)
    }

    func showError(_ error: Error?) {
        if errorView == nil {
            errorView = WaterStatesConfig.errorView
            errorView?.delegate = (self as? ErrorStateDelegate) ?? getModuleInput(for: "output") as? ErrorStateDelegate
        }
        guard let errorView = self.errorView else { return }
        errorView.configure(with: error)
        errorView.show(in: view)
    }

    func hideError() {
        errorView?.hide()
    }

    func showLoading(_: String) {
        if loadingView == nil { loadingView = WaterStatesConfig.loadingView }
        guard let progressView = self.loadingView else { return }
        progressView.configure()
        progressView.show(in: view)
    }

    func hideLoading() {
        loadingView?.hide()
    }

    func showEmpty(_ message: String?) {
        if emptyView == nil {
            emptyView = WaterStatesConfig.emptyView
            emptyView?.delegate = (self as? EmptyStateDelegate) ?? getModuleInput(for: "output") as? EmptyStateDelegate
        }
        guard let emptyView = self.emptyView else { return }
        emptyView.configure(with: message)
        emptyView.show(in: view)
    }

    func hideEmpty() {
        emptyView?.hide()
    }

    func showContent(_: Any) { }
}

internal extension UIViewController {
    func getModuleInput(for selectorName: String) -> Any? {
        let reflection = Mirror(reflecting: self).children
        var output: Any?

        for property in reflection {
            if property.label! == selectorName {
                output = property.value
                break
            }
        }

        return output
    }
}
