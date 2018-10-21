import UIKit

class SampleUITableViewController: UITableViewController {

    let tableData: TableData

    private let cellIdentitfier = "CellIdentifier"

    // MARK: Table Header and Footer

    private func setupTableHeader() {
        if let tableHeaderView = tableData.headerView {
            tableHeaderView.translateIntrinsicSizeIntoFrame()
            tableView.tableHeaderView = tableHeaderView
        }
    }

    private func setupTableFooter() {
        if let tableFooterView = tableData.footerView {
            tableFooterView.translateIntrinsicSizeIntoFrame()
            tableView.tableFooterView = tableFooterView
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

extension SampleUITableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.sections.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int
    ) -> String? {
        return tableData.sections[section].headerTitle
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return tableData.sections[section].footerTitle
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.sections[section].cells.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentitfier, for: indexPath)
        cell.textLabel?.text = tableData
            .sections[indexPath.section]
            .cells[indexPath.row]
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
