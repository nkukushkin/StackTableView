import UIKit

open class StackTableViewBasicCell: StackTableViewSelectableCell {
    
    public private(set) lazy var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private func setupUserInterface() {
        contentView.addSubview(textLabel)
        textLabel.constrain(edgesToLayoutGuide: contentView.layoutMarginsGuide)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUserInterface()
    }
}
