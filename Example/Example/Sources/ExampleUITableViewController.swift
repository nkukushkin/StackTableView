import UIKit


struct TableData {

    struct CellData {
        var title: String
    }

    struct SectionData {
        var headerTitle: String?
        var cellsData: [CellData]
        var footerTitle: String?
    }

    var sectionsData: [SectionData]

    static var sample: TableData {
        let cells = ["One", "Two", "Three"].map(CellData.init(title:))
        let section = SectionData(headerTitle: "Hello", cellsData: cells, footerTitle: "Goodbye")
        return TableData(sectionsData: [section])
    }
}

class ExampleUITableViewController: UITableViewController {

    var tableData: TableData {
        didSet { tableView.reloadData() }
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
