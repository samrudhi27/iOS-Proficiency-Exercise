//
//  APIService.swift
//  Examples
//
//  Created by Samrudhi Santaji on 03/12/21.
//

import Foundation
import Alamofire

class APIService {
    func loadJsonData(completion: @escaping (DataResponse) -> ()) {
        let dataApiUrl = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")!
        Alamofire.request(dataApiUrl).responseString { (response) in
            let datam =  response.result.value?.data(using: .utf8)!
           guard let dat = datam else { return }
                do {
                        if(response.result.isSuccess) {
                            print(response.result)
                            let result = try JSONDecoder().decode(DataResponse.self, from: dat)
                            let tableData = result.rows
                            print("Hello \(tableData.count)")
                            completion(result)
            }
        } catch {
                    }
                    }
          }
}
