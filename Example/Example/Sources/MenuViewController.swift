import UIKit
import StackTableView

class MenuViewController: StackTableViewController {

    // MARK: Visual Comparisson Section

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

    private lazy var visualComparissonSection: StackTableViewSection = {
        let section = StackTableViewSection()
        section.headerTitle = LocalizedStrings.visualComparisson
        section.cells = [
            uiTableViewExampleCell,
            stackTableViewExampleCell
        ]
        return section
    }()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = LocalizedStrings.screenTitle

        stackTableView.sections = [
            visualComparissonSection
        ]
    }
}

// MARK: - Localized Strings

private enum LocalizedStrings {

    static var screenTitle: String {
        return NSLocalizedString(
            "StackTableView Example",
            comment: "Title of the main screen."
        )
    }

    static var visualComparisson: String {
        return NSLocalizedString(
            "Visual Comparisson",
            comment: """
                Title of the table section, which contains buttons \
                that lead to examples of different table view implementations.
                """
        )
    }
}
