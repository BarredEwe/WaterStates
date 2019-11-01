//
//  Displayble.swift
//  WaterStates_Example
//
//  Created by Максим Гришутин on 01.11.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public protocol DisplaybleView {
    func show(in view: UIView, animated: Bool, completion: ((Bool) -> Swift.Void)?)
    func hide(animated: Bool, completion: ((Bool) -> Swift.Void)?)
}

extension DisplaybleView {
    func show(in view: UIView, animated: Bool = true, completion: ((Bool) -> Swift.Void)? = nil) {
        show(in: view, animated: animated, completion: completion)
    }

    func hide(animated: Bool = true, completion: ((Bool) -> Swift.Void)? = nil) {
        hide(animated: animated, completion: completion)
    }
}

extension DisplaybleView where Self: UIView {
    public func show(in view: UIView, animated: Bool, completion: ((Bool) -> Swift.Void)?) {
        frame = view.bounds
        let addSubview = { view.addSubview(self) }

        guard animated else {
            addSubview()
            return
        }

        UIView.transition(with: view, duration: 0.25, options: [.transitionCrossDissolve], animations: {
            addSubview()
        }, completion: completion)
    }

    public func hide(animated: Bool, completion: ((Bool) -> Swift.Void)?) {
        let remove = { self.removeFromSuperview() }

        guard animated else {
            remove()
            return
        }

        UIView.transition(with: superview ?? self, duration: 0.25, options: [.transitionCrossDissolve], animations: {
            remove()
        }, completion: completion)
    }
}
