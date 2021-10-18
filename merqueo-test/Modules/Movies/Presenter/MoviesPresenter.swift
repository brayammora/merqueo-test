//
//  MoviesPresenter.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 17/10/21.
//

import UIKit

final class MoviesPresenter: MoviesPresenterInputProtocol {
    var movies: [Movie] = []
    weak var view: MoviesPresenterOutputProtocol?
    var getMoviesInteractor: GetMoviesInteractorInputProtocol?
    var router: MoviesRouterProtocol?
    
    func getMovies() {
        getMoviesInteractor?.execute()
    }
    
    func gotToDetail(movie: Movie, view: UINavigationController?) {
        router?.presentDetailMovie(movie: movie, navController: view)
    }
}

extension MoviesPresenter: GetMoviesInteractorOutputProtocol {
    func didRetrieveMovies(_ movies: [Movie]) {
        self.movies = movies
        DispatchQueue.main.async { [weak self] in
            self?.view?.didRetrieveMovies()
        }
    }
    
    func didGetError(_ error: CustomError) {
        view?.didGetError(error)
    }
}
