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

        let cellTitles = ["Cell 1", "Cell 2"]

        let section1Cells = cellTitles.map(CellData.init(title:))
        let section1 = SectionData(
            headerTitle: "Section1 Header",
            cellsData: section1Cells,
            footerTitle: "Section1 Footer"
        )

        let section2Cells = cellTitles.map(CellData.init(title:))
        let section2 = SectionData(
            headerTitle: "Section2 Header",
            cellsData: section2Cells,
            footerTitle: "Section2 Footer"
        )

        let section3Cells = cellTitles.map(CellData.init(title:))
        let section3 = SectionData(
            headerTitle: nil,
            cellsData: section3Cells,
            footerTitle: nil
        )

        let section4Cells = cellTitles.map(CellData.init(title:))
        let section4 = SectionData(
            headerTitle: nil,
            cellsData: section4Cells,
            footerTitle: nil
        )

        return TableData(
            header: header,
            sectionsData: [
                section1, section2, section3, section4
            ],
            footer: footer
        )
    }
}

class ExampleUITableViewController: UITableViewController {

    var tableData: TableData {
        didSet { updateTableData() }
    }

    private func updateTableData() {
        func translateIntrinsicSizeToFrame(for view: UIView) {
            let frame = CGRect(origin: .zero, size: view.intrinsicContentSize)
            view.frame = frame
        }

        // Add header…
        if let header = tableData.header {
            translateIntrinsicSizeToFrame(for: header)
            tableView.tableHeaderView = header
        } else {
            tableView.tableHeaderView = nil
        }

        // Add footer…
        if let footer = tableData.footer {
            translateIntrinsicSizeToFrame(for: footer)
            tableView.tableHeaderView = footer
        } else {
            tableView.tableHeaderView = nil
        }

        // Reload sections.
        tableView.tableHeaderView = tableData.header
        tableView.tableFooterView = tableData.footer
        tableView.reloadData()

    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableData.sectionsData[section].headerTitle
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return tableData.sectionsData[section].footerTitle
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.sectionsData.count
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
