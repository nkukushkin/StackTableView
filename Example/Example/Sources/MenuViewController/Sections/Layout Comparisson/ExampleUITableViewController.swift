import UIKit

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
