import UIKit

extension UIStackView {

    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}

extension UIStackView {
    
    func removeArrangedSubviewsFromSuperview() {
        for view in arrangedSubviews {
            view.removeFromSuperview()
        }
    }
}
