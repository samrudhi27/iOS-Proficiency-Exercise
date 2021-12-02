//
//  DemoTableViewController.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 22/11/21.
//

import UIKit
import Alamofire

class DemoTableViewController: UIViewController {

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
      loadJsonData()
    }
    func loadJsonData()
        {
        let dataApiUrl = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")!
           Alamofire.request(dataApiUrl).responseString { (response) in
            
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
            }
        }
            catch{
                          
                    }
                    }
        navigationItem.title = "\(navTitle)"
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
       dataTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        dataTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dataTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        dataTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
         }
    // setting the row height and backgroundcolor
    func configureTableView() {
        dataTableView.backgroundColor = .gray
        dataTableView.rowHeight = UITableView.automaticDimension
        dataTableView.estimatedRowHeight = 100
        dataTableView.register(DataTableViewCell.self, forCellReuseIdentifier: "dataCell")
    }
}



