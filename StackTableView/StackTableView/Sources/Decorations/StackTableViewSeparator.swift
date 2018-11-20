import UIKit

public class StackTableViewSeparator: UIView {
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 1 / UIScreen.main.scale)
    }

    // MARK: Lifecyle

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .stackTableViewSeparatorColor
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
