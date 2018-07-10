import UIKit

class AppCoordinator: Coordinator {

    private let window: UIWindow
    private let navigationController = UINavigationController()

    private lazy var menuCoordinator = MenuCoordinator(navigationController: navigationController)

    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        menuCoordinator.start()
    }

    init(window: UIWindow) {
        self.window = window
    }
}
