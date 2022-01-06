//
//  DataResponse.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 23/11/21.
//

import Foundation

// MARK: - Json Data Array Cell Object
// structure to hold json data
public struct DataArrayCellObject: Codable {
    let rows: [DataCellObject]
    let title: String
}
