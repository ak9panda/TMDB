//
//  CollectionView+Extension.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import Foundation
import UIKit

extension UICollectionView {
    func registerCellClass(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        self.register(cellClass.self, forCellWithReuseIdentifier: identifier)
    }
}
