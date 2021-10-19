//
//  MockMoviesRouter.swift
//  merqueo-testTests
//
//  Created by Brayam Alberto Mora Arias on 19/10/21.
//

import UIKit
@testable import merqueo_test

struct MoviesRouterCalls {
    var didPresentDetailMovie: Bool = false
}

class MockMoviesRouter: MoviesRouterProtocol {
    lazy var calls = MoviesRouterCalls()
    
    static func createModule() -> MoviesViewController {
        return MoviesViewController()
    }
    
    func presentDetailMovie(movie: Movie, navController: UINavigationController?) {
        calls.didPresentDetailMovie = true
    }
    
}
