import UIKit

open class StackTableView: UIScrollView {
    
    /// Setting a new value causes the whole UI to be rebuilt.
    open var sections: [StackTableViewSection] = [] {
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
        stackView.removeArrangedSubviewsFromSuperview()
        stackView.addArrangedSubview(StackTableViewSpacer())
        for section in sections {
            stackView.addArrangedSubview(section)
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
