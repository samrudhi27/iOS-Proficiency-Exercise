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
}
