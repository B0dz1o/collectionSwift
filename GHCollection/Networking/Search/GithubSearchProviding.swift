//
//  GithubSearchProviding.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 28/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit
import PromiseKit

protocol GithubSearchProviding {
    /// Gets the search results
    ///
    /// - Parameters:
    ///   - query: Search query. Must fit Github search syntax
    ///   - page: Search results page number
    ///   - perPage: Number of results per page
    /// - Returns: Promise with search results
    func getResults(query: String, page: UInt, perPage: UInt) -> Promise<RepoSearchResultRepresenting>

    /// Waits for a set delay. In case there is no change in request, gets the search results. This is to accomodate to Github's API rate limiting.
    ///
    /// - Parameters:
    ///   - query: Search query. Must fit github search syntax
    ///   - page: Search results page number
    ///   - perPage: Number of results per page
    /// - Returns: Promise with search results
    func getResultsThrottled(query: String, page: UInt, perPage: UInt)
        -> Promise<RepoSearchResultRepresenting>

}
