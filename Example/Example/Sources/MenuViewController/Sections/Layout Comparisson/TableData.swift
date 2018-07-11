import UIKit

class ExampleHeaderFooterView: UIView {

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
        let header = ExampleHeaderFooterView()
        let footer = ExampleHeaderFooterView()

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
