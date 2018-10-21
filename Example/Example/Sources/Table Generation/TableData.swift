import UIKit

struct TableData {
    var headerView: UIView?
    var sections: [TableSectionData]
    var footerView: UIView?
}

struct TableSectionData {
    var headerTitle: String?
    var cells: [TableCellData]
    var footerTitle: String?
}

struct TableCellData {
    var title: String
}




