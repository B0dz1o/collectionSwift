//
//  SearchBarDelegate.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 29/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit

final class SearchBarDelegate: NSObject, UISearchBarDelegate {

    weak var reloader: CollectionViewReloading?

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text {
            reloader?.search(queryChanged: query)
        }
        searchBar.resignFirstResponder()
    }
}
