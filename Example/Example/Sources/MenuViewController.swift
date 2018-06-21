import UIKit
import StackTableView

class MenuViewController: StackTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let cell = StackTableViewBasicCell()
        cell.textLabel.text = "Wow!"

        let section = StackTableViewSection()
        section.cells = [cell]

        stackTableView.sections = [section]
    }
}
