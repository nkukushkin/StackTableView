import UIKit

open class StackTableViewController: UIViewController {
    
    open var stackTableView: StackTableView {
        return view as! StackTableView
    }

    open override func loadView() {
        let stackTableView = StackTableView()
        stackTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view = stackTableView
    }

    // MARK: Lifecycle

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        registerForKeyboardNotifications()
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        unregisterFromKeyboardNotifications()
    }

    // MARK: Keyboard Observing

    @objc
    private func keyboardWillShow(notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        else { return }

        let convertedKeyboardFrame = stackTableView.convert(keyboardFrame, from: nil)

        let intersection = stackTableView.bounds.intersection(convertedKeyboardFrame)
        if !intersection.isEmpty {
            stackTableView.contentInset.bottom = intersection.height
            stackTableView.scrollIndicatorInsets.bottom = intersection.height
        }
    }

    @objc
    private func keyboardWillHide(sender _: Notification) {
        stackTableView.contentInset.bottom = 0
        stackTableView.scrollIndicatorInsets.bottom = 0
    }

    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(sender:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    private func unregisterFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
}
