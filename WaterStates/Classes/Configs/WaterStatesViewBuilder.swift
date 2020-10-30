import Foundation

class WaterStatesViewBuilder {
    let appearance: StateViewAppearance

    init(appearance: StateViewAppearance) {
        self.appearance = appearance
    }

    func mainStackView(spacing: CGFloat = 10) -> UIStackView {
        let buttonsStack = UIStackView()

        buttonsStack.axis = .vertical
        buttonsStack.alignment = .center
        buttonsStack.distribution = .fill
        buttonsStack.spacing = spacing

        return buttonsStack
    }

    func actionButton(title: String) -> UIButton {
        let button = UIButton(type: .system)

        button.contentEdgeInsets = appearance.actionButtomContentEdgeInsets
        button.layer.cornerRadius = appearance.actionButtonCornerRadius
        button.setTitle(title, for: .normal)
        button.setTitleColor(appearance.actionButtonTitleColor, for: .normal)
        button.titleLabel?.font = appearance.actionButtonFont()
        button.contentHorizontalAlignment = .center
        button.clipsToBounds = true

        if let actionButtonImage = appearance.actionButtonImage {
            button.setBackgroundImage(actionButtonImage, for: .normal)
        } else {
            button.backgroundColor = appearance.actionButtonColor
        }

        return button
    }

    func makeDescriptionLabel(with text: String) -> UILabel {
        let descriptionLabel = UILabel()

        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = appearance.descriptionTextColor
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = appearance.descriptionFont()
        descriptionLabel.text = text

        return descriptionLabel
    }

    func makeTitleLabel(with text: String) -> UILabel {
        let label = UILabel()

        label.textAlignment = .center
        label.textColor = appearance.titleTextColor
        label.accessibilityTraits.insert(.header)
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byWordWrapping
        label.text = text
        label.font = appearance.titleFont()

        return label
    }
}
