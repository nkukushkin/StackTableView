import StackTableView

class SampleStackTableViewController: StackTableViewController {

    let tableData: TableData

    private func setupTable() {
        stackTableView.headerView = tableData.headerView
        stackTableView.footerView = tableData.footerView

        stackTableView.sections = tableData.sections.map { sectionData in
            let section = StackTableViewSection()
            section.headerTitle = sectionData.headerTitle
            section.footerTitle = sectionData.footerTitle

            section.cells = sectionData.cells.map { cellData in
                let cell = StackTableViewBasicCell()
                cell.textLabel.text = cellData.title
                return cell
            }
            return section
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }

    // MARK: Initialization

    init(tableData: TableData) {
        self.tableData = tableData
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
