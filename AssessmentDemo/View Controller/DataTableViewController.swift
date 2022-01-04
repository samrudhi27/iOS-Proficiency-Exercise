//
//  DemoTableViewController.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 22/11/21.
//

import UIKit
import Alamofire
import SnapKit
import DTTableViewManager

// MARK: - View Controller
class DataTableViewController: UIViewController, DTTableViewManageable {
    private var dataViewModel = DataViewModel()
    var items = Array<DataCellObject>()
    var tableView: UITableView! = UITableView()
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        manager.register(DataTableViewCell.self)
        pinTableView()
        configureTableView()
        callToViewModelForUIUpdate()
    }
    // MARK: - Call To ViewModel For UI Update
    func callToViewModelForUIUpdate() {
        self.dataViewModel =  DataViewModel()
        self.dataViewModel.bindEmployeeViewModelToController = { [weak self] in
            self?.updateDataSource()
        }
    }
    // MARK: - Update Data
    func updateDataSource() {
        items = self.dataViewModel.tableData.rows
        var data = DataCellObject()
        for item in items {
            data.description = item.description
            data.title = item.title
            data.imageHref = item.imageHref
            manager.memoryStorage.addItem(data)
        }
        let navigationItemTitle = dataViewModel.tableData.title
        navigationItem.title = "\(navigationItemTitle)"
    }
}
extension DataTableViewController {
    // MARK: - Pin TableView to View
    // applying constraints to tableview, pinning it to view
    func pinTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    // MARK: - Configure Table View
    // setting the row height and backgroundcolor
    func configureTableView() {
        tableView.backgroundColor = .gray
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
}
