//
//  DemoTableViewController.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 22/11/21.
//

import UIKit
import Alamofire
import SnapKit

class DemoTableViewController: UIViewController {
    private var dataViewModel : DataViewModel!
    private var dataSource : DataTableViewDataSource<DataTableViewCell, DataFile>!
    private let refreshControl = UIRefreshControl()
    var navBarTitle: String = ""
    var dataTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTableView.register(DataTableViewCell.self, forCellReuseIdentifier: "dataCell")
        view.addSubview(dataTableView)
        pinTableView()
        configureTableView()
        callToViewModelForUIUpdate()

    }
    func callToViewModelForUIUpdate(){
            self.dataViewModel =  DataViewModel()
            self.dataViewModel.bindEmployeeViewModelToController = {
                self.updateDataSource()
            }
        }
        
        func updateDataSource(){
            
            self.dataSource = DataTableViewDataSource(cellIdentifier: "dataCell", items: self.dataViewModel.tableData.rows, configureCell: { (cell, evm) in
                cell.datas = evm
            })
            
            DispatchQueue.main.async { [self] in
                var navTitle = dataViewModel.tableData.title
                navigationItem.title = "\(navTitle)"
                self.dataTableView.dataSource = self.dataSource
                self.dataTableView.reloadData()
            }
        }
  
}

extension DemoTableViewController {
    // applying constraints to tableview, pinning it to view
    func pinTableView() {
        dataTableView.translatesAutoresizingMaskIntoConstraints = false
        dataTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
           // make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
         }
    // setting the row height and backgroundcolor
    func configureTableView() {
        dataTableView.backgroundColor = .gray
        dataTableView.rowHeight = UITableView.automaticDimension
        dataTableView.estimatedRowHeight = 100
        dataTableView.register(DataTableViewCell.self, forCellReuseIdentifier: "dataCell")
    }
}
