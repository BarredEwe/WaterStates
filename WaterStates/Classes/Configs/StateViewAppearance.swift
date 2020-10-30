import Foundation

/// An object that defines the appearance of StateView items.
public class StateViewAppearance {
    // MARK: Color Customization

    /// The tint color to apply to the action button (default blue).
    public var actionButtonColor: UIColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)

    /// The button image to apply to the action button
    public var actionButtonImage: UIImage?

    /// The title color to apply to action button (default white).
    public var actionButtonTitleColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

    /// The color of title text labels (default light gray).
    public var titleTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

    /// The color of description text labels (default black).
    public var descriptionTextColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)

    /// The color of background main view (default white).
    public var backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

    // MARK: Corner Radius Customization

    /// The corner radius of the action button (default 12).
    public var actionButtonCornerRadius: CGFloat = 16

    /// Edge insets fro the button (default (top: 12, left: 38, bottom: 12, right: 38))
    public var actionButtomContentEdgeInsets: UIEdgeInsets = .init(top: 12, left: 38, bottom: 12, right: 38)

    // MARK: Font Customization

    /// An optional custom font to use for the title label. Set this to nil to use the system font.
    public var titleFontDescriptor: UIFontDescriptor?

    /// An optional custom font to use for the description label. Set this to nil to use the system font.
    public var descriptionFontDescriptor: UIFontDescriptor?

    /// An optional custom font to use for the button. Set this to nil to use the system font.
    public var buttonFontDescriptor: UIFontDescriptor?

    // MARK: Font Constants

    /// The font size of title elements (default 22).
    public var titleFontSize: CGFloat = 22

    /// The font size of description labels (default 15).
    public var descriptionFontSize: CGFloat = 15

    /// The font size of action buttons (default 14).
    public var actionButtonFontSize: CGFloat = 14

    public init(actionButtonImage: UIImage? = nil, titleFontDescriptor: UIFontDescriptor? = nil, descriptionFontDescriptor: UIFontDescriptor? = nil, buttonFontDescriptor: UIFontDescriptor? = nil) {
        self.actionButtonImage = actionButtonImage
        self.titleFontDescriptor = titleFontDescriptor
        self.descriptionFontDescriptor = descriptionFontDescriptor
        self.buttonFontDescriptor = buttonFontDescriptor
    }

    /// Creates the font for title labels.
    internal func titleFont() -> UIFont {
        if let titleFontDescriptor = self.titleFontDescriptor {
            return UIFont(descriptor: titleFontDescriptor, size: titleFontSize)
        } else {
            return UIFont.systemFont(ofSize: titleFontSize, weight: .bold)
        }
    }

    /// Creates the font for description labels.
    internal func descriptionFont() -> UIFont {
        if let descriptionFontDescriptor = self.descriptionFontDescriptor {
            return UIFont(descriptor: descriptionFontDescriptor, size: descriptionFontSize)
        } else {
            return UIFont.systemFont(ofSize: descriptionFontSize)
        }
    }

    /// Creates the font for action buttons.
    internal func actionButtonFont() -> UIFont {
        if let buttonFontDescriptor = self.buttonFontDescriptor {
            return UIFont(descriptor: buttonFontDescriptor, size: actionButtonFontSize)
        } else {
            return UIFont.systemFont(ofSize: actionButtonFontSize, weight: .heavy)
        }
    }
}
