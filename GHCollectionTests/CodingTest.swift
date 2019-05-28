//
//  CodingTest.swift
//  GHCollectionTests
//
//  Created by Piotr Bogdan on 28/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import XCTest
@testable import GHCollection

class CodingTest: XCTestCase {

    var ownerMock: RepoOwner!
    var repoMock: Repository!
    var searchResMock: RepoSearchResult!

    override func setUp() {
        super.setUp()
        let exampleUrl = "http://lorempixel.com//400//200//"
        ownerMock = RepoOwner(login: "userLogin", avatarAddress: exampleUrl, profileAddress: exampleUrl)
        repoMock = Repository(identifier: 123, name: "userName", address: exampleUrl, innerOwner: ownerMock, starsCount: 124)
        searchResMock = RepoSearchResult(total: 1, innerItems: [repoMock])
    }

    func testOwner() {
        let encoder = JSONEncoder()
        XCTAssertNoThrow(try encoder.encode(ownerMock))
        do {
            let data = try encoder.encode(ownerMock)
            testStringEncoded(data: data)
        } catch {
            XCTFail("Failed to decode \(type(of: ownerMock))")
        }

    }

    func testRepo() {
        let encoder = JSONEncoder()
        XCTAssertNoThrow(try encoder.encode(repoMock))
        do {
            let data = try encoder.encode(repoMock)
            testStringEncoded(data: data)
        } catch {
            XCTFail("Failed to decode \(type(of: repoMock))")
        }
    }

    func testResult() {
        let encoder = JSONEncoder()
        XCTAssertNoThrow(try encoder.encode(searchResMock))
        do {
            let data = try encoder.encode(searchResMock)
            testStringEncoded(data: data)
        } catch {
            XCTFail("Failed to decode \(type(of: searchResMock))")
        }
    }

    private func testStringEncoded(data: Data) {
        let encodedString = String(data: data, encoding: .utf8)
        XCTAssertNotNil(encodedString)
    }

}
