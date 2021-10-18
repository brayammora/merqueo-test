//
//  MoviesViewProtocols.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 17/10/21.
//

import Foundation

protocol MoviesViewProtocol: AnyObject {
    var presenter: MoviesPresenterInputProtocol? { get set }
}
