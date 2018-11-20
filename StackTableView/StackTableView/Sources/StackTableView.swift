import UIKit

open class StackTableView: UIScrollView {

    /// Setting a new value causes the whole UI to be rebuilt.
    open var headerView: UIView? {
        didSet { updateUserInterface() }
    }
    
    /// Setting a new value causes the whole UI to be rebuilt.
    open var sections: [StackTableViewSection] = [] {
        didSet { updateUserInterface() }
    }

    /// Setting a new value causes the whole UI to be rebuilt.
    open var footerView: UIView? {
        didSet { updateUserInterface() }
    }

    // MARK: User Interface

    private let stackView = UIStackView()

    private func updateUserInterface() {
        // Remove everything…
        stackView.removeArrangedSubviewsFromSuperview()

        // Add header or spacer…
        if let headerView = headerView {
            stackView.addArrangedSubview(headerView)
        } else {
            stackView.addArrangedSubview(StackTableViewSpacer())
        }

        // Add sections…
        for section in sections {
            stackView.addArrangedSubview(section)
        }

        // Add footer.
        if let footerView = footerView {
            stackView.addArrangedSubview(footerView)
        }
    }

    private func setupUserInterface() {
        backgroundColor = .stvBackgroundColor
        preservesSuperviewLayoutMargins = true
        keyboardDismissMode = .onDrag
        delaysContentTouches = false
        alwaysBounceVertical = true

        stackView.axis = .vertical
        addSubview(stackView)
        stackView.preservesSuperviewLayoutMargins = true
        stackView.constrain(edgesToView: self)
        stackView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }

    // MARK: Touch Handling

    open override func touchesShouldCancel(in view: UIView) -> Bool {
        if view is UIButton {
            return true
        }
        return super.touchesShouldCancel(in: view)
    }

    // MARK: Lifecyle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUserInterface()
        updateUserInterface()
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
