//
//  AssessmentDemoTests.swift
//  AssessmentDemoTests
//
//  Created by Samrudhi Santaji on 22/11/21.
//

import XCTest
@testable import AssessmentDemo

class AssessmentDemoTests: XCTestCase {
    var sut: URLSession!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }
    // Asynchronous test: success fast, failure slow
   func testValidApiCallGetsHTTPStatusCode200() throws {
      // given
      let urlString =
        "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
      let url = URL(string: urlString)!
      // 1
      let promise = expectation(description: "Status code: 200")

      // when
      let dataTask = sut.dataTask(with: url) { _, response, error in
        // then
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            // 2
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      // 3
      wait(for: [promise], timeout: 5)
    }
}
