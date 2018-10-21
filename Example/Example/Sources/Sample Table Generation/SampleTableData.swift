import UIKit

struct SampleTableData {

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
}

extension SampleTableData {

    static var basicSample: SampleTableData {
        let header = SampleHeaderFooterView()
        let footer = SampleHeaderFooterView()

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

        return SampleTableData(
            header: header,
            sectionsData: [
                section1, section2, section3, section4
            ],
            footer: footer
        )
    }
}
