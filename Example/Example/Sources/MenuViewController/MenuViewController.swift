import UIKit
import StackTableView

class MenuViewController: StackTableViewController {

    // MARK: Visual Comparisson Section

    var didSelectUITableViewExample: (() -> Void)?
    var didSelectStackTableViewExample: (() -> Void)?

    private lazy var visualComparissonSection: VisualComparissonSection = {
        let section = VisualComparissonSection()
        section.didSelectUITableViewExample = self.didSelectUITableViewExample
        section.didSelectStackTableViewExample = self.didSelectStackTableViewExample
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
}
