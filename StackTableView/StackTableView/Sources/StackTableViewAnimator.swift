/// Use this type to animate table changes consistently.
public class StackTableViewAnimator {

    /// Use this method to animate table changes consistently.
    public static func animate(
        _ animations: @escaping () -> Void,
        completion: ((_ finished: Bool) -> Void)? = nil
    ) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0,
            options: [
                .beginFromCurrentState,
                .allowUserInteraction
            ],
            animations: animations,
            completion: completion
        )
    }

    /// Use this method to animate table changes consistently.
    public static func perform(
        closure: @escaping () -> Void,
        animated: Bool,
        completion: ((_ finished: Bool) -> Void)? = nil
    ) {
        if animated {
            animate(closure, completion: completion)
        } else {
            closure()
            completion?(true)
        }
    }
}
