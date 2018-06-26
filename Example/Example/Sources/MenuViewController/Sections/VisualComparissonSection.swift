import UIKit
import StackTableView

class VisualComparissonSection: StackTableViewSection {

    var didSelectUITableViewExample: (() -> Void)?
    var didSelectStackTableViewExample: (() -> Void)?

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

    // MARK: Initialization

    private func setupUserInterface() {
        headerTitle = LocalizedStrings.sectionHeader
        cells = [
            uiTableViewExampleCell,
            stackTableViewExampleCell
        ]
    }

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

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUserInterface()
        setupActions()
    }
}

// MARK: - Localized Strings

private enum LocalizedStrings {

    static var sectionHeader: String {
        return NSLocalizedString(
            "Visual Comparisson",
            comment: """
                Title of the table section, which contains buttons \
                that lead to examples of different table view implementations.
                """
        )
    }
}
