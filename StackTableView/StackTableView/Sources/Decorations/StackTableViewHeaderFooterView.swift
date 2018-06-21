import UIKit

public class StackTableViewHeaderFooterView: UIView {
    public private(set) lazy var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        let appearance = UILabel.appearance(
            whenContainedInInstancesOf: [StackTableViewHeaderFooterView.self]
        )
        label.font = appearance.font ?? .preferredFont(forTextStyle: .footnote)
        label.textColor = appearance.textColor ?? .stvHeaderFooterTextColor
        return label
    }()

    private func setupUserInterface() {
        preservesSuperviewLayoutMargins = true
        layoutMargins.top = 7
        layoutMargins.bottom = 7

        // Empty header/footer views should be at least 18pt so it can act as spacer.
        let height = heightAnchor.constraint(greaterThanOrEqualToConstant: 18)
        height.priority = .defaultHigh
        height.isActive = true

        addSubview(textLabel)
        textLabel.constrain(edgesToLayoutGuide: layoutMarginsGuide)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUserInterface()
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
