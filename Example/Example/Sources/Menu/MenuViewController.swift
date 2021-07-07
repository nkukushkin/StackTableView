import StackTableView

enum MenuItem {
    case uiTableView
    case stackTableVIew
}

protocol MenuViewControllerDelegate {
    func menuViewController(_: MenuViewController, didSelectMenuItem: MenuItem)

    func menuViewControllerDidSelectUITableView(_: MenuViewController)
    func menuViewControllerDidSelectStackTableVIew(_: MenuViewController)
}

class MenuViewController: StackTableViewController {

    // MARK: Visual Comparisson Section

    var didSelectUITableView: (() -> Void)?
    var didSelectStackTableView: (() -> Void)?

    private lazy var visualComparissonSection: ComparissonSection = {
        let section = ComparissonSection()
        section.didSelectUITableView = { [weak self] in
            self?.didSelectUITableView?()
        }
        section.didSelectStackTableView = { [weak self] in
            self?.didSelectStackTableView?()
        }
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
