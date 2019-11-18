import UIKit

public protocol StateView: UIView, DisplaybleView {
    func configure(with title: String?, description: String?)
}
