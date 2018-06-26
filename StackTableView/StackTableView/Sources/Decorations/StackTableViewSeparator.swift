import UIKit

public class StackTableViewSeparator: UIView {
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: 1 / UIScreen.main.scale)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .stvSeparatorColor
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
