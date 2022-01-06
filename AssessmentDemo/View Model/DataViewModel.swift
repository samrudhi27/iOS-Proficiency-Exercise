//
//  DataViewModel.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 03/12/21.
//

import Foundation
import Alamofire
// MARK: - Data View Model
class DataViewModel: NSObject {
    private var apiServices: APIService!
    private(set) var tableData: DataArrayCellObject! {
            didSet {
                self.bindEmployeeViewModelToController()
            }
    }
    var bindEmployeeViewModelToController : (() -> ()) = {}
    override init() {
        super.init()
        self.apiServices = APIService()
        callFuncToGetData()
    }
    // MARK: - Call Function to Get Data
    // Function to get JSON Data
    func callFuncToGetData() {
        self.apiServices.loadJsonData { (tableData) in
            self.tableData = tableData
        }
    }
    // MARK: - Get Data
    // Function to send data to view controller
    func getData(cellObjects: inout [Any]) {
        var data = DataCellObject()
        for item in tableData.rows {
            data.description = item.description
            data.title = item.title
            data.imageHref = item.imageHref
            cellObjects.append(data)
        }
    }
}
