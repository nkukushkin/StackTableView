import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    ) -> Bool {

        window = UIWindow()
        window?.rootViewController = ApplicationCoordinator()
        window?.makeKeyAndVisible()

        return true
    }
}

// MARK: Coordination

class ApplicationCoordinator: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        transition(to: MenuCoordinator())
    }
}

class MenuCoordinator: UINavigationController {

    var menuViewController: MenuViewController {
        let menuVC = MenuViewController()
        let sampleTableData = TableData.sample
        menuVC.didSelectUITableViewExample = { [weak self] in
            self?.pushViewController(
                ExampleUITableViewController(tableData: sampleTableData),
                animated: true
            )
        }
        menuVC.didSelectStackTableViewExample = { [weak self] in
            self?.pushViewController(
                ExampleStackTableViewController(tableData: sampleTableData),
                animated: true
            )
        }
        return menuVC
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        pushViewController(menuViewController, animated: false)
    }
}

extension UIViewController {

    func transition(to child: UIViewController, completion: ((Bool) -> Void)? = nil) {
        let duration = 0.3

        let current = childViewControllers.last
        addChildViewController(child)

        let newView = child.view!
        newView.translatesAutoresizingMaskIntoConstraints = true
        newView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        newView.frame = view.bounds

        if let existing = current {
            existing.willMove(toParentViewController: nil)

            transition(from: existing, to: child, duration: duration, options: [.transitionCrossDissolve], animations: { }, completion: { done in
                existing.removeFromParentViewController()
                child.didMove(toParentViewController: self)
                completion?(done)
            })

        } else {
            view.addSubview(newView)

            UIView.animate(withDuration: duration, delay: 0, options: [.transitionCrossDissolve], animations: { }, completion: { done in
                child.didMove(toParentViewController: self)
                completion?(done)
            })
        }
    }

}

