//
//  DataResponse.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 23/11/21.
//

import Foundation

// structure to hold json data
// MARK: - DataResponse
public struct DataResponse: Codable {
    let rows: [DataFile]
    let title: String
}
