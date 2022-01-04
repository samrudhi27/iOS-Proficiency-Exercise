//
//  APIService.swift
//  Examples
//
//  Created by Samrudhi Santaji on 03/12/21.
//

import Foundation
import Alamofire
// MARK: - API Service Class
class APIService {
    // MARK: - loadJsonData
    // function to load JSON data using Alamofire
    func loadJsonData(completion: @escaping (DataArrayCellObject) -> ()) {
        let dataApiUrl = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")!
        Alamofire.request(dataApiUrl).responseString { (response) in
            let datam =  response.result.value?.data(using: .utf8)!
            guard let dat = datam else { return }
            do {
                    if(response.result.isSuccess) {
                            print(response.result)
                            let result = try JSONDecoder().decode(DataArrayCellObject.self, from: dat)
                            let tableData = result.rows
                            print("Hello \(tableData.count)")
                            completion(result)
                    }
            }
            catch {
            }
        }
    }
}
