//
//  DataResource.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 23/11/21.
//

import Foundation
// Downloading and parsing JSON Data
struct DataResource {
    // MARK: -GetData
    // getting data and parsing the JSON Data
    func getData(completionHandler: @escaping (DataResponse?) -> ()) {
        let dataApiUrl = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")!

        URLSession.shared.dataTask(with: dataApiUrl) { (data, response, error) in
            // checking if there is data
            guard let data = data else { return }
                   guard let string = String(data: data, encoding: String.Encoding.isoLatin1) else { return }
                    guard let properData = string.data(using: .utf8, allowLossyConversion: true) else { return }
            // checking if there is any error
            if error == nil && data != nil {
                do {
                    let resultJson = try JSONDecoder().decode(DataResponse.self, from: properData)
                    completionHandler(resultJson)

                } catch let error {
                    debugPrint(error)
                }
            }

        }.resume()
 }
}
