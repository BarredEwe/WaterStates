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

public extension DisplaybleView where Self: UIView {
    func show(in view: UIView, animated: Bool, completion: ((Bool) -> Swift.Void)?) {
        let addSubview = {
            view.addSubview(self)
            if #available(iOS 11.0, *) {
                self.translatesAutoresizingMaskIntoConstraints = false
                view.addConstraints([
                    self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                    self.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                    self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                ])
            } else {
                self.frame = view.bounds
            }
        }

        guard animated else {
            addSubview()
            return
        }

        transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
        UIView.transition(with: view, duration: 0.25, options: [.transitionCrossDissolve], animations: {
            addSubview()
            self.transform = .identity
        }, completion: completion)
    }

    func hide(animated: Bool, completion: ((Bool) -> Swift.Void)?) {
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
