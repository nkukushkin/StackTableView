import UIKit

open class StackTableViewSection: UIView {

    open var headerTitle: String? {
        didSet { updateHeaderView() }
    }

    open var footerTitle: String? {
        didSet { updateFooterView() }
    }

    /// Setting a new value causes the whole UI to be rebuilt.
    open var cells: [StackTableViewCell] = [] {
        didSet { updateUserInterface() }
    }

    // MARK: Header

    private let headerView = StackTableViewHeaderFooterView()

    private func updateHeaderView() {
        headerView.textLabel.text = headerTitle?.uppercased()
    }

    // MARK: Footer

    private let footerView = StackTableViewHeaderFooterView()

    private func updateFooterView() {
        footerView.textLabel.text = footerTitle
    }

    // MARK: Cells

    private var cellIsHiddenObservations: [NSKeyValueObservation] = []

    private func updateCells() {
        cellIsHiddenObservations.removeAll()
        contentStackView.removeArrangedSubviewsFromSuperview()
        for cell in cells {
            contentStackView.addArrangedSubview(cell)
            cellIsHiddenObservations.append(
                cell.observe(\.isHidden) { [weak self] _, _ in
                    self?.updateCellSeparators()
                }
            )
        }
        updateCellSeparators()
    }

    private func updateCellSeparators() {
        let visibleCells = cells.filter { !$0.isHidden }
        for (index, cell) in visibleCells.enumerated() {
            if index < visibleCells.index(before: visibleCells.endIndex) {
                cell.separator.alpha = 1
            } else {
                cell.separator.alpha = 0
            }
        }
    }

    // MARK: Hiding

    open override var isHidden: Bool {
        didSet {
            updateHiding()
        }
    }

    /// These changes produce good-looking animations.
    private func updateHiding() {
        alpha = isHidden ? 0 : 1
    }

    // MARK: User Iterface

    private func updateUserInterface() {
        updateHeaderView()
        updateFooterView()
        updateCells()
        updateHiding()
    }

    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()

    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()

    private func setupUserInterface() {
        clipsToBounds = true
        preservesSuperviewLayoutMargins = true
        contentStackView.preservesSuperviewLayoutMargins = true

        let topSeparator = StackTableViewSeparator()
        let bottomSeparator = StackTableViewSeparator()

        mainStackView.addArrangedSubviews([
            headerView,
            topSeparator,
            contentStackView,
            bottomSeparator,
            footerView
        ])

        addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = mainStackView.constraints(fromEdgesTo: self)
        constraints.bottom.priority = .defaultLow // for UIStackView animations
        constraints.activate()
    }

    // MARK: Lifecycle

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUserInterface()
        updateUserInterface()
    }

    @available(*, unavailable)
    public required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Workaround

extension StackTableViewSection {

    open override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
        workaround_updateMainStackViewHorizontalLayoutMargins()
    }

    // See autolayout debugger https://twitter.com/steipete/status/972847811644547075
    private func workaround_updateMainStackViewHorizontalLayoutMargins() {
        mainStackView.layoutMargins.left = layoutMargins.left
        mainStackView.layoutMargins.right = layoutMargins.right
    }
}
