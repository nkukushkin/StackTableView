import StackTableView

class HideCellExampleSection: StackTableViewSection {

    private var isHidableCellHidden = false

    private func setHidableCellHidden(_ hidden: Bool, animated: Bool) {
        guard isHidableCellHidden != hidden else { return }
        isHidableCellHidden = hidden
        updateUserInterface(animated: animated)
    }

    private let toggleButtonCell = StackTableViewBasicCell()
    private let hidableCell = StackTableViewCell()

    private func updateUserInterface(animated: Bool) {
        toggleButtonCell.textLabel.text = isHidableCellHidden ? "Show" : "Hide"

        StackTableView.perform(
            closure: { [weak self] in
                guard let `self` = self else { return }
                self.hidableCell.isHidden = self.isHidableCellHidden
            },
            animated: animated
        )
    }

    // MARK: - Setup

    private func setup() {
        setupUserInterface()
        updateUserInterface(animated: false)
        setupActions()
    }

    private func setupActions() {
        toggleButtonCell.selectionChanged = { [weak self] _, isSelected in
            self?.setHidableCellHidden(isSelected, animated: true)
        }
    }

    private func setupUserInterface() {
        cells = [
            toggleButtonCell,
            hidableCell
        ]
    }

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
}
