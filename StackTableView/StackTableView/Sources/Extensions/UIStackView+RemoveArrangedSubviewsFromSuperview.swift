import UIKit

extension UIStackView {
    func removeArrangedSubviewsFromSuperview() {
        for arrangedSubview in arrangedSubviews {
            arrangedSubview.removeFromSuperview()
        }
    }
}
