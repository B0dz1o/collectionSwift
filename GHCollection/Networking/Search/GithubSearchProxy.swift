//
//  GithubSearchProxy.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 28/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit
import Alamofire
import PromiseKit

final class GithubSearchProxy: GithubSearchProviding {

    func getResults(query: String, page: UInt, perPage: UInt) -> Promise<RepoSearchResultRepresenting> {
        let factory = GithubAPIFactory()
        return factory.makeSearchRepo(query: query, page: page, perPage: perPage)
    }

    func getResultsThrottled(query: String, page: UInt, perPage: UInt) -> Promise<RepoSearchResultRepresenting> {
        let factory = GithubAPIFactory()
        return factory.makeSearchRepo(query: query, page: page, perPage: perPage)
    }

}
