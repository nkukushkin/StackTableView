import UIKit
import StackTableView

class ComparissonSection: StackTableViewSection {

    var didSelectUITableView: (() -> Void)?
    var didSelectStackTableView: (() -> Void)?

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
            self?.didSelectUITableView?()
        }

        stackTableViewExampleCell.selectionChanged = { [weak self] cell, _ in
            cell.setSelected(false, animated: true)
            self?.didSelectStackTableView?()
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
