import UIKit

class EdgeConstraints {

    let top: NSLayoutConstraint
    let left: NSLayoutConstraint
    let bottom: NSLayoutConstraint
    let right: NSLayoutConstraint

    var all: [NSLayoutConstraint] {
        return [top, left, bottom, right]
    }

    func activate() {
        NSLayoutConstraint.activate(all)
    }

    func deactivate() {
        NSLayoutConstraint.deactivate(all)
    }

    var insets: UIEdgeInsets {
        get {
            return UIEdgeInsets(
                top: top.constant,
                left: left.constant,
                bottom: -bottom.constant,
                right: -right.constant
            )
        }
        set(newInsets) {
            top.constant = newInsets.top
            left.constant = newInsets.left
            bottom.constant = -newInsets.bottom
            right.constant = -newInsets.right
        }
    }

    // MARK: Initialization

    init(
        top: NSLayoutConstraint,
        left: NSLayoutConstraint,
        bottom: NSLayoutConstraint,
        right: NSLayoutConstraint
    ) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }
}

extension UIView {
    
    func constrain(edgesToView view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        constraints(fromEdgesTo: view).activate()
    }

    func constrain(edgesToLayoutGuide layoutGuide: UILayoutGuide) {
        translatesAutoresizingMaskIntoConstraints = false
        constraints(fromEdgesTo: layoutGuide).activate()
    }

    func constraints(fromEdgesTo otherView: UIView) -> EdgeConstraints {
        return EdgeConstraints(
            top: topAnchor.constraint(equalTo: otherView.topAnchor),
            left: leftAnchor.constraint(equalTo: otherView.leftAnchor),
            bottom: bottomAnchor.constraint(equalTo: otherView.bottomAnchor),
            right: rightAnchor.constraint(equalTo: otherView.rightAnchor)
        )
    }

    func constraints(fromEdgesTo layoutGuide: UILayoutGuide) -> EdgeConstraints {
        return EdgeConstraints(
            top: topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            left: leftAnchor.constraint(equalTo: layoutGuide.leftAnchor),
            bottom: bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
            right: rightAnchor.constraint(equalTo: layoutGuide.rightAnchor)
        )
    }
}
