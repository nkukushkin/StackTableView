import UIKit

class SampleHeaderFooterView: UIView {
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 44, height: 44)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
