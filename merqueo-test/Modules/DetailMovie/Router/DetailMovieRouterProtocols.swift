//
//  DetailMovieRouterProtocols.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import Foundation

protocol DetailMovieRouterProtocol {
    static func createModule(movie: Movie) -> DetailMovieViewController
}
