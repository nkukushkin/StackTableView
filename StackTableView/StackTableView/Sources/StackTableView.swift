import UIKit

open class StackTableView: UIScrollView {

    open var headerView: UIView? {
        didSet { updateUserInterface() }
    }
    
    /// Setting a new value causes the whole UI to be rebuilt.
    open var sections: [StackTableViewSection] = [] {
        didSet { updateUserInterface() }
    }

    open var footerView: UIView? {
        didSet { updateUserInterface() }
    }

    // MARK: Animations

    /// Use this method to animate table changes consistently.
    public static func animate(
        _ animations: @escaping () -> Void,
        completion: ((_ finished: Bool) -> Void)? = nil
    ) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0,
            options: [.allowUserInteraction],
            animations: animations,
            completion: completion
        )
    }

    public static func perform(
        closure: @escaping () -> Void,
        animated: Bool,
        completion: ((_ finished: Bool) -> Void)? = nil
    ) {
        if animated {
            animate(closure)
        } else {
            closure()
            completion?(true)
        }
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
