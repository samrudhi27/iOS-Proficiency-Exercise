//
//  DataFile.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 23/11/21.
//

import Foundation

struct DataFile: Codable {
    var title: Optional<String>
    var imageHref: Optional<String>
    var description: Optional<String>
    /*enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case imageHref = "imageHref"
    }
*/
}
