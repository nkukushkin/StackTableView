extension TableData {

    static func generateVisualComparissonSample() -> TableData {
        let tableHeaderView = SampleHeaderFooterView()
        let tableFooterView = SampleHeaderFooterView()

        let cellTitles = ["Cell 1", "Cell 2"]

        let section1Cells = cellTitles.map(TableCellData.init(title:))
        let section1 = TableSectionData(
            headerTitle: "Section1 Header",
            cells: section1Cells,
            footerTitle: "Section1 Footer"
        )

        let section2Cells = cellTitles.map(TableCellData.init(title:))
        let section2 = TableSectionData(
            headerTitle: "Section2 Header",
            cells: section2Cells,
            footerTitle: "Section2 Footer"
        )

        let section3Cells = cellTitles.map(TableCellData.init(title:))
        let section3 = TableSectionData(
            headerTitle: nil,
            cells: section3Cells,
            footerTitle: nil
        )

        let section4Cells = cellTitles.map(TableCellData.init(title:))
        let section4 = TableSectionData(
            headerTitle: nil,
            cells: section4Cells,
            footerTitle: nil
        )

        return TableData(
            headerView: tableHeaderView,
            sections: [
                section1,
                section2,
                section3,
                section4
            ],
            footerView: tableFooterView
        )
    }
}
