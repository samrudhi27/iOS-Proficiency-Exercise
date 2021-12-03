//
//  DataViewModel.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 03/12/21.
//

import Foundation
import Alamofire

class DataViewModel: NSObject {
    private var apiServices : APIService!
    private(set) var tableData : DataResponse! {
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
    func callFuncToGetData() {
        self.apiServices.loadJsonData{ (tableData) in
            self.tableData = tableData
        }    }
}
