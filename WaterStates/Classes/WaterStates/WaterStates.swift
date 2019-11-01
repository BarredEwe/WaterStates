//
//  WaterStates.swift
//  WaterStates_Example
//
//  Created by Максим Гришутин on 01.11.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public protocol WaterStates: StateDisplayable {
    func showState(_ state: State<ContentType>)
}

extension WaterStates where Self: UIViewController {

    internal var stateMachine: StateMachine<ContentType>? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.stateMachine) as? StateMachine
        }
        set(newValue) {
            return objc_setAssociatedObject(self, &AssociatedKeys.stateMachine, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    var errorView: ErrorStateView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.errorView) as? ErrorStateView
        }
        set(newValue) {
            return objc_setAssociatedObject(self, &AssociatedKeys.errorView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    var loadingView: LoadingStateView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.loadingView) as? LoadingView
        }
        set(newValue) {
            return objc_setAssociatedObject(self, &AssociatedKeys.loadingView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    var emptyView: EmptyStateView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.emptyView) as? EmptyView
        }
        set(newValue) {
            return objc_setAssociatedObject(self, &AssociatedKeys.emptyView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

public struct AssociatedKeys {
    public static var stateMachine = "AssociatedKeys.stateMachine"
    public static var errorView = "AssociatedKeys.errorView"
    public static var loadingView = "AssociatedKeys.loadingView"
    public static var emptyView = "AssociatedKeys.emptyView"
}
