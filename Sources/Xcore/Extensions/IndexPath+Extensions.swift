//
// Xcore
// Copyright © 2017 Xcore
// MIT license, see LICENSE file for details
//

import UIKit

extension IndexPath {
    public static var zero: Self {
        .init(item: 0, section: 0)
    }
}

public extension IndexPath {
     func previous() -> Self? {
        guard item > 0 else {
            return nil
        }

        return IndexPath(row: item - 1, section: section)
    }

}

