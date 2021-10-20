//
//  Reusable.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 17/10/21.
//

import UIKit

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: Reusable { }

extension UITableViewCell: Reusable { }
