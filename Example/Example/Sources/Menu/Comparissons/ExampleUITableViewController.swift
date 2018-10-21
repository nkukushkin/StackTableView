import UIKit

class ExampleUITableViewController: UITableViewController {

    let tableData: TableData

    private let cellIdentitfier = "CellIdentifier"

    // MARK: Table Header and Footer

    private func setupTableHeader() {
        if let header = tableData.header {
            header.translateIntrinsicSizeIntoFrame()
            tableView.tableHeaderView = header
        }
    }

    private func setupTableFooter() {
        if let footer = tableData.footer {
            footer.translateIntrinsicSizeIntoFrame()
            tableView.tableFooterView = footer
        }
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentitfier)

        setupTableHeader()
        setupTableFooter()
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

// MARK: - UITableViewDataSource

extension ExampleUITableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.sectionsData.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int
    ) -> String? {
        return tableData.sectionsData[section].headerTitle
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return tableData.sectionsData[section].footerTitle
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.sectionsData[section].cellsData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentitfier, for: indexPath)
        cell.textLabel?.text = tableData
            .sectionsData[indexPath.section]
            .cellsData[indexPath.row]
            .title
        return cell
    }
}

// MARK: - Helpers

private extension UIView {

    func translateIntrinsicSizeIntoFrame() {
        frame = CGRect(origin: frame.origin, size: intrinsicContentSize)
    }
}