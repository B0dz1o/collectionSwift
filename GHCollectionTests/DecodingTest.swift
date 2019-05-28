//
//  DecodingTest.swift
//  GHCollectionTests
//
//  Created by Piotr Bogdan on 28/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import XCTest
@testable import GHCollection

class DecodingTest: XCTestCase {

    let decoder = JSONDecoder()
    let bundle = Bundle(for: DecodingTest.self)
    var data: Data?

    override func tearDown() {
        super.tearDown()
        self.data = nil
    }

    private func test<T>(filename: String, type: T.Type) where T: Decodable {
        XCTAssertNoThrow(try getFile(named: filename))
        guard let data = self.data else {
            XCTFail("Cannot retrieve data")
            return
        }
        XCTAssertNoThrow(try decoder.decode(type, from: data))
    }

    private func getFile(named: String) throws {
        let fileExtension = "json"
        let url = self.bundle.url(forResource: named, withExtension: fileExtension)!
        let data = try Data(contentsOf: url)
        self.data = data
    }

    func testResponse() {
        self.test(filename: "WholeResponse", type: RepoSearchResult.self)
    }

    func testRepo() {
        self.test(filename: "Repository", type: Repository.self)
    }

    func testOwner() {
        self.test(filename: "Owner", type: RepoOwner.self)
    }

}
