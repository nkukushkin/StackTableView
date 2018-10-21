import StackTableView

class SampleStackTableViewController: StackTableViewController {

    let tableData: TableData

    private func updateTableContents() {
        stackTableView.headerView = tableData.header
        stackTableView.footerView = tableData.footer

        stackTableView.sections = tableData.sectionsData.map { sectionData in
            let section = StackTableViewSection()
            section.headerTitle = sectionData.headerTitle
            section.footerTitle = sectionData.footerTitle

            section.cells = sectionData.cellsData.map { cellData in
                let cell = StackTableViewBasicCell()
                cell.textLabel.text = cellData.title
                return cell
            }
            return section
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateTableContents()
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
