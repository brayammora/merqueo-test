//
//  MockMoviesPresenterInput.swift
//  merqueo-testTests
//
//  Created by Brayam Alberto Mora Arias on 19/10/21.
//

import UIKit
@testable import merqueo_test

struct MoviesPresenterInputCalls {
    var didGetMovies: Bool = false
    var didGoToDetail: Bool = false

}

class MockMoviesPresenterInput: MoviesPresenterInputProtocol {
    var movies: [Movie] = []
    var view: MoviesPresenterOutputProtocol?
    var getMoviesInteractor: GetMoviesInteractorInputProtocol?
    var router: MoviesRouterProtocol?
    
    lazy var calls = MoviesPresenterInputCalls()
    
    func getMovies() {
        calls.didGetMovies = true
        movies = [
            Movie(id: 12345, posterPath: nil)
        ]
        view?.didRetrieveMovies()
    }
    
    func goToDetail(movie: Movie, view: UINavigationController?) {
        calls.didGoToDetail = true
    }
    
    
    
}
