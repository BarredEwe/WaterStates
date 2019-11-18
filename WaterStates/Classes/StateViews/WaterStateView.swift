import Foundation

public class WaterStateView: UIView, StateView {

    enum ActionType: String {
        case error
        case empty
        case loading
    }

    internal var type: ActionType = .empty

    public var titleView: UIView?
    public var title: String?
    public var descriptionInfo: String?
    public var buttonTitle: String?

    public weak var delegate: WaterStateDelegate?

    // Stack view constraints
    private var stackLeadingConstraint: NSLayoutConstraint!
    private var stackTrailingConstraint: NSLayoutConstraint!
    private var stackBottomConstraint: NSLayoutConstraint!

    var contentStackView: UIStackView!
    var appearance = StateViewAppearance()

    private lazy var builder = WaterStatesViewBuilder(appearance: appearance)

    public func configure(with title: String?, description: String?) {
        showContentStackView()

        if let titleView = titleView {
            contentStackView.addArrangedSubview(titleView)
        }

        if let title = title ?? self.title {
            contentStackView.addArrangedSubview(builder.makeTitleLabel(with: title))
        }

        if let descriptionInfo = description ?? descriptionInfo  {
            contentStackView.addArrangedSubview(builder.makeDescriptionLabel(with: descriptionInfo))
        }

        if let buttonTitle = buttonTitle {
            let button = builder.actionButton(title: buttonTitle)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            contentStackView.addArrangedSubview(button)
        }

        backgroundColor = appearance.backgroundColor
    }

    // MARK: Actions
    @objc func buttonTapped(_ sender: UIButton) {
        switch type {
        case .empty: delegate?.emptyActionTapped(with: .default)
        case .error: delegate?.errorActionTapped(with: .default)
        default: return
        }
    }

    // MARK: Private Methods
    private func showContentStackView() {
        guard contentStackView == nil else {
            contentStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
            return
        }
        contentStackView = builder.mainStackView(spacing: 38)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentStackView)

        stackLeadingConstraint = contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        stackLeadingConstraint.isActive = true

        stackTrailingConstraint = contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        stackTrailingConstraint.isActive = true

        stackBottomConstraint = contentStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        stackBottomConstraint.isActive = true
    }
}
