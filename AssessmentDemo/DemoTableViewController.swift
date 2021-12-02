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
    private let refreshControl = UIRefreshControl()
    var tableData = Array<DataFile>()
    var navTitle : String = ""
    var dataTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTableView.dataSource = self
        dataTableView.delegate = self
        dataTableView.register(DataTableViewCell.self, forCellReuseIdentifier: "dataCell")
        view.addSubview(dataTableView)
        pinTableView()
        configureTableView()
        
        view.backgroundColor = .red
      //loadJsonData()
    }
    func loadJsonData()
        {
        let dataApiUrl = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")!
        Alamofire.request(dataApiUrl).responseString { [self] (response) in
            
            //response.setCharacterEncoding("UTF-8");
           // print(response)
         var datam =  response.result.value?.data(using: .utf8)!
           guard let dat = datam else { return }
            //print(dat)
                do{
                        if(response.result.isSuccess){
                            print(response.result)
                            let result: DataResponse = try JSONDecoder().decode(DataResponse.self, from: dat)
                            //debugPrint(result)
                                            self.tableData = result.rows ?? []
                            self.navTitle = result.title ?? "About"
                            print(self.navTitle)
                                            self.dataTableView.reloadData()
                            navigationItem.title = "\(navTitle)"
            }
        }
            catch{
                          
                    }
                    }
        self.refreshControl.endRefreshing()
                }

    
   
}

extension DemoTableViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: DataTableViewCell = dataTableView.dequeueReusableCell(withIdentifier: "dataCell") as! DataTableViewCell

        if (tableData.count > 0){
                    do{
                        let tableDat = tableData[indexPath.row]
                        cell.datas = tableData[indexPath.row]
                        
                    }catch{
                          
                    }
                      
    }
        return cell
    
    }
      
}
extension DemoTableViewController {
    // applying constraints to tableview, pinning it to view
    func pinTableView() {
        dataTableView.translatesAutoresizingMaskIntoConstraints = false
        dataTableView.snp.makeConstraints{
            make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        dataTableView.addSubview(refreshControl)
 
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Data ...")
  
         }
    // setting the row height and backgroundcolor
    func configureTableView() {
        dataTableView.backgroundColor = .gray
        dataTableView.rowHeight = UITableView.automaticDimension
        dataTableView.estimatedRowHeight = 100
        dataTableView.register(DataTableViewCell.self, forCellReuseIdentifier: "dataCell")
    }
    @objc private func refreshData(_ sender: Any) {
        // Fetch Weather Data
        loadJsonData()
    }
}



