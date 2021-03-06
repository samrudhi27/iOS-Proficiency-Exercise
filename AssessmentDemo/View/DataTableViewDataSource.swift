//
//  DataTableViewDataSource.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 03/12/21.
//

import UIKit

class DataTableViewDataSource<CELL: UITableViewCell, T>:  NSObject, UITableViewDataSource, UITableViewDelegate {
    private var cellIdentifier: String!
        private var items: [T]!
        var configureCell: (CELL, T) -> () = {_, _ in }
    init(cellIdentifier: String, items: [T], configureCell: @escaping (CELL, T) -> ()) {
            self.cellIdentifier = cellIdentifier
            self.items =  items
            self.configureCell = configureCell
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! CELL
        // swiftlint:enable force_cast
        if (items.count > 0) {
                        let item = self.items[indexPath.row]
                        self.configureCell(cell, item)
    }
        return cell
    }
}
