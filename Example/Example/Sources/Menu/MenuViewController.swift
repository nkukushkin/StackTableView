import UIKit
import StackTableView

class MenuViewController: StackTableViewController {

    // MARK: Visual Comparisson Section

    var didSelectUITableView: (() -> Void)?
    var didSelectStackTableView: (() -> Void)?

    private lazy var visualComparissonSection: ComparissonSection = {
        let section = ComparissonSection()
        section.didSelectUITableView = self.didSelectUITableView
        section.didSelectStackTableView = self.didSelectStackTableView
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
            "Menu",
            comment: "Title of the main screen."
        )
    }
}
