import UIKit

open class StackTableViewCell: UIView {
    
    // This is needed so that the button on the selectable cell,
    // which is behind the content view, could be tapped.
    // TODO: Handle touches without exposing custom view subclass.
    public let contentView = StackTableViewTouchthroughView()

    public let separator = StackTableViewSeparator()

    // MARK: Hiding

    open override var isHidden: Bool {
        didSet { updateHiding() }
    }

    /// Hiding a cell by changing alpha results in good-looking animations.
    private func updateHiding() {
        separator.alpha = isHidden ? 0 : 1
    }

    // MARK: User Interface

    private func setupUserInterface() {
        clipsToBounds = true
        backgroundColor = .white
        preservesSuperviewLayoutMargins = true

        contentView.backgroundColor = .clear
        contentView.preservesSuperviewLayoutMargins = true
        contentView.layoutMargins.top = 11
        contentView.layoutMargins.bottom = 11

        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(separator)
        separator.translatesAutoresizingMaskIntoConstraints = false

        let contentToSeparatorConstraint = contentView.bottomAnchor.constraint(
            equalTo: separator.topAnchor
        )
        contentToSeparatorConstraint.priority = .defaultHigh // for UIStackView animations

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentToSeparatorConstraint,
            contentView.rightAnchor.constraint(equalTo: rightAnchor),

            separator.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }

    // MARK: Lifecycle

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUserInterface()
        updateHiding()
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
