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
        let (promise, resolver) = Promise<RepoSearchResultRepresenting>.pending()
        return promise
    }

    func getResultsThrottled(query: String, page: UInt, perPage: UInt) -> Promise<RepoSearchResultRepresenting> {
        let (promise, resolver) = Promise<RepoSearchResultRepresenting>.pending()
        return promise
    }

}
