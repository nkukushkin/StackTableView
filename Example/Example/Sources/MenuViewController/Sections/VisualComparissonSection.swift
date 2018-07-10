import UIKit
import StackTableView

class VisualComparissonSection: StackTableViewSection {

    var didSelectUITableViewExample: (() -> Void)?
    var didSelectStackTableViewExample: (() -> Void)?

    // MARK: User Interface

    private let uiTableViewExampleCell: StackTableViewBasicCell = {
        let cell = StackTableViewBasicCell()
        cell.textLabel.text = "UITableView"
        return cell
    }()

    private let stackTableViewExampleCell: StackTableViewBasicCell = {
        let cell = StackTableViewBasicCell()
        cell.textLabel.text = "StackTableView"
        return cell
    }()

    private func setupUserInterface() {
        headerTitle = LocalizedStrings.sectionHeader
        cells = [
            uiTableViewExampleCell,
            stackTableViewExampleCell
        ]
    }

    // MARK: Actions

    private func setupActions() {
        uiTableViewExampleCell.selectionChanged = { [weak self] cell, _ in
            cell.setSelected(false, animated: true)
            self?.didSelectUITableViewExample?()
        }

        stackTableViewExampleCell.selectionChanged = { [weak self] cell, _ in
            cell.setSelected(false, animated: true)
            self?.didSelectStackTableViewExample?()
        }
    }

    // MARK: Initialization

    private func setup() {
        setupUserInterface()
        setupActions()
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
}

// MARK: - Localized Strings

private enum LocalizedStrings {

    static var sectionHeader: String {
        return NSLocalizedString(
            "Compare layout",
            comment: ""
        )
    }
}
