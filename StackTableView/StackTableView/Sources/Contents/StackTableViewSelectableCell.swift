import UIKit

open class StackTableViewSelectableCell: StackTableViewCell {
    
    open private(set) var isSelected = false

    /// Doesn't call `selectionChanged()`.
    open func setSelected(_ selected: Bool, animated: Bool) {
        guard selected != isSelected else { return }
        isSelected = selected

        if animated {
            UIView.transition(
                with: button,
                duration: 0.3,
                options: [.transitionCrossDissolve, .allowUserInteraction],
                animations: {
                    self.button.isSelected = selected
                }
            )
        } else {
            button.isSelected = selected
        }
    }

    // MARK: Actions

    open var selectionChanged: ((_ cell: StackTableViewSelectableCell, _ isSelected: Bool) -> Void)?

    @objc
    private func buttonTapped() {
        let newSelectedState = !isSelected
        setSelected(newSelectedState, animated: false)
        selectionChanged?(self, newSelectedState)
    }

    private func setupActions() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    // MARK: User Interface

    private lazy var button: UIButton = {
        let button = UIButton()
        let highlightedImage = UIColor.stvSeparatorColor.asOnePixelImage()
        button.setBackgroundImage(highlightedImage, for: .highlighted)
        button.setBackgroundImage(highlightedImage, for: .selected)
        return button
    }()

    private func setupUserInterface() {
        addSubview(button)
        sendSubview(toBack: button) // should be behind contentView
        button.isSelected = isSelected
        button.constrain(edgesToView: self)
    }

    // MARK: Lifecycle

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUserInterface()
        setupActions()
    }
}
