# StackTableView

This is an experimental attempt to create a `UITableView` alternative for building static forms.

Here's a quick exmaple of how you create a table using this library:

```swift
class ExampleStackTableViewController: StackTableViewController {

    private func populateTable() {
        let cell = StackTableViewBasicCell()
        cell.textLabel.text = "Hello World!"

        let section = StackTableViewSection()
        section.headerTitle = "This is a header"
        section.cells = [cell]
        section.footerTitle = "This is a footer"

        stackTableView.sections = [section]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        populateTable()
    }
}
```

## Overview

`StackTableView` has 3 main components: `table`, `section` and `cell`.

### Cell

There are several built-in cells like `StackTableViewSelectableCell`, which provides APIs for selection, and `StackTableViewBasicCell`, which is selectable, but also exposes a `UILabel`.

Creating a custom cell may seem familiar, you subclass `StackTableViewCell`, and add custom UI to its `contentView`.

```swift
open class CellWithLabel: StackTableViewCell {
    
    public private(set) lazy var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private func setupUserInterface() {
        contentView.addSubview(textLabel)
        textLabel.constrain(edgesToLayoutGuide: contentView.layoutMarginsGuide)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUserInterface()
    }
}

```

### Section

Sections are usually used as-is, however, unlike `UITableView`, which doesn't expose sections as classes, in `StackTableView` sections a plain old `UIViews`. This means that, you can subclass `StackTableViewSection` and put some logic there, and then reuse these sections in different tables.

Basic properties of a section are `headerTitle`, `cells`, and `footerTitle`.

### Table

The table itself a `UIScrollView` subsclass, just like `UITableView`. You can also use `StackTableViewContoller`, which has built-in functionality for keyboard-avoidance.
