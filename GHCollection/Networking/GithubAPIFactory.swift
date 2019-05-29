//
//  GithubAPIFactory.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 28/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit
import Alamofire
import PromiseKit

final class GithubAPIFactory {

    let acceptHeader = "application/vnd.github.v3+json"
    let host = "api.github.com"
    let proto = "https"

    /// Factory method for repository search request
    /// TODO: Use builder pattern
    ///
    func makeSearchRepo(query: String, page: UInt, perPage: UInt, sortBy: SearchSortBy? = nil, order: ResultOrder = .descending) -> Promise<RepoSearchResultRepresenting> {
        let searchPath = "/search/repositories"
        let path = "\(proto)://\(self.host)\(searchPath)"
        let searchParams = createSearchParams(query: query, sortBy: sortBy, order: order)
        let paginationParams = createPaginationParams(page: page, perPage: perPage)
        let params = join(parameters: searchParams, with: paginationParams)
        return firstly {
            Alamofire.request(path, parameters: params, headers: self.createHeaders()).responseDecodable(RepoSearchResult.self)
        }.map({ (result) -> RepoSearchResultRepresenting in
            return result
        })
    }

    private func createSearchParams(query: String, sortBy: SearchSortBy?, order: ResultOrder) -> Parameters {
        var params: Parameters = ["q": query, "order": order.rawValue]
        if let sortBy = sortBy {
            params["sort"] = sortBy.rawValue
        }
        return params
    }

    private func createPaginationParams(page: UInt, perPage: UInt) -> Parameters {
        return ["page": page, "per_page": perPage]
    }

    private func join(parameters: Parameters, with: Parameters) -> Parameters {
        return parameters.merging(with) { first, _ -> Any in
            return first
        }
    }

    private func createHeaders() -> HTTPHeaders? {
        return ["Accept": self.acceptHeader]
    }

}
