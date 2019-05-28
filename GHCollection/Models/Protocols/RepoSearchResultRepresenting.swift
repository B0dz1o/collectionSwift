//
//  RepoSearchResultRepresenting
//  GHCollection
//
//  Created by Piotr Bogdan on 28/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit

protocol RepoSearchResultRepresenting {
    var total: Int { get }
    var items: [RepositoryRepresenting] { get }
}
