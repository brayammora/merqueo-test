//
//  MoviesRouterProtocols.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 17/10/21.
//

import UIKit

protocol MoviesRouterProtocol {
    static func createModule() -> MoviesViewController
    
    func presentDetailMovie(movie: Movie, navController: UINavigationController?)
}
