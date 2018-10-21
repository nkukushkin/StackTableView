import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow()
        let appCoordinator = AppCoordinator(window: window)

        self.window = window
        self.appCoordinator = appCoordinator

        appCoordinator.start()

        return true
    }
}
