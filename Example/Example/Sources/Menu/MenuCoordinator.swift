import UIKit

class MenuCoordinator: Coordinator {

    private let navigationController: UINavigationController

    private var menuViewController: MenuViewController {
        let menuVC = MenuViewController()
        let sampleDataGenerator = TableData.generateVisualComparissonSample

        menuVC.didSelectUITableView = { [weak self] in
            let sampleTableData = sampleDataGenerator()
            let uiTableViewExampleVC = SampleUITableViewController(tableData: sampleTableData)
            self?.navigationController.pushViewController(uiTableViewExampleVC, animated: true)
        }

        menuVC.didSelectStackTableView = { [weak self] in
            let sampleTableData = sampleDataGenerator()
            let stackTableViewExampleVC = SampleStackTableViewController(tableData: sampleTableData)
            self?.navigationController.pushViewController(stackTableViewExampleVC, animated: true)
        }

        return menuVC
    }

    func start() {
        navigationController.pushViewController(menuViewController, animated: true)
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
