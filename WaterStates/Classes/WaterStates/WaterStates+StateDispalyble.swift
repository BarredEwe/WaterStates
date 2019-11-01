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
            let output = getModuleInput(for: "output") as? ErrorStateDelegate
            errorView?.delegate = output
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

    func showEmpty(_: String) {
        if emptyView == nil { emptyView = WaterStatesConfig.emptyView }
        guard let emptyView = self.emptyView else { return }
        emptyView.configure()
        emptyView.show(in: view)
    }

    func hideEmpty() {
        emptyView?.hide()
    }
}

fileprivate extension UIViewController {

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
