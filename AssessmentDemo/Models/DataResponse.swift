//
//  DataResponse.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 23/11/21.
//

import Foundation

public struct DataResponse: Codable{
    let rows: [DataFile]
    let title: String
}
// MARK: - Datum
/*struct DataS: Decodable {
    let title, image: String
}
 */
