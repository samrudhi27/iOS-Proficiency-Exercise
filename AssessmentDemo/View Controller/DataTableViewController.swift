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
    var cellObjects = [Any]()
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
            self?.updateTableData()
        }
    }
    // MARK: - Update Table Data
    func updateTableData() {
        dataViewModel.getData(cellObjects: &cellObjects)
        manager.memoryStorage.removeAllItems()
        manager.memoryStorage.setItems(cellObjects)
        navigationItem.title = "\(dataViewModel.tableData.title)"
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
