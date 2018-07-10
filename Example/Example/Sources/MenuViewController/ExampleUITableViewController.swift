import UIKit

class TableHeaderFooterView: UIView {

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

struct TableData {

    struct CellData {
        var title: String
    }

    struct SectionData {
        var headerTitle: String?
        var cellsData: [CellData]
        var footerTitle: String?
    }

    var header: UIView?
    var sectionsData: [SectionData]
    var footer: UIView?

    static func generateSample() -> TableData {
        let header = TableHeaderFooterView()
        let footer = TableHeaderFooterView()

        let cells = ["One", "Two", "Three"].map(CellData.init(title:))
        let section = SectionData(headerTitle: "Hello", cellsData: cells, footerTitle: "Goodbye")
        return TableData(header: header, sectionsData: [section], footer: footer)
    }
}

class ExampleUITableViewController: UITableViewController {

    var tableData: TableData {
        didSet { updateTableData() }
    }

    private func updateTableData() {
        // Add header…
        if let header = tableData.header {
            let headerFrame = CGRect(
                origin: .zero,
                size: header.intrinsicContentSize
            )
            header.frame = headerFrame
            tableView.tableHeaderView = header
        } else {
            tableView.tableHeaderView = nil
        }

        // Add footer…
        if let footer = tableData.footer {
            let footerFrame = CGRect(
                origin: .zero,
                size: footer.intrinsicContentSize
            )
            footer.frame = footerFrame
            tableView.tableHeaderView = footer
        } else {
            tableView.tableHeaderView = nil
        }

        // Reload sections.
        tableView.reloadData()
        tableView.tableHeaderView = tableData.header
        tableView.tableFooterView = tableData.footer

    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableData.sectionsData[section].headerTitle
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return tableData.sectionsData[section].footerTitle
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.sectionsData[section].cellsData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TODO", for: indexPath)
        cell.textLabel?.text = tableData.sectionsData[indexPath.section].cellsData[indexPath.row].title
        return cell
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TODO")

        updateTableData()
    }

    // MARK: Initialization

    init(tableData: TableData) {
        self.tableData = tableData
        super.init(style: .grouped)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


import StackTableView

class ExampleStackTableViewController: StackTableViewController {

    var tableData: TableData {
        didSet { updateTableContents() }
    }

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
