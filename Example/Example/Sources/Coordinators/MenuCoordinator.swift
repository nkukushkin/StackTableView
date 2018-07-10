import UIKit

class MenuCoordinator: Coordinator {

    private let navigationController: UINavigationController

    private var menuViewController: MenuViewController {
        let menuVC = MenuViewController()
        let sampleDataGenerator = TableData.generateSample

        menuVC.didSelectUITableViewExample = { [weak self] in
            let sampleTableData = sampleDataGenerator()
            let uiTableViewExampleVC = ExampleUITableViewController(tableData: sampleTableData)
            self?.navigationController.pushViewController(uiTableViewExampleVC, animated: true)
        }

        menuVC.didSelectStackTableViewExample = { [weak self] in
            let sampleTableData = sampleDataGenerator()
            let stackTableViewExampleVC = ExampleStackTableViewController(tableData: sampleTableData)
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
