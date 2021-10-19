//
//  MoviesPresenter.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 17/10/21.
//

import UIKit

final class MoviesPresenter: MoviesPresenterInputProtocol {
    private enum Constants {
        enum ErrorMessage {
            static let noInternetMessage: String = "Oops, please check your internet connection."
            static let defaultMessage: String = "An error has ocurred, please retry."
            static let emptyMessage: String = ""
        }
    }
    
    var movies: [Movie] = []
    weak var view: MoviesPresenterOutputProtocol?
    var getMoviesInteractor: GetMoviesInteractorInputProtocol?
    var router: MoviesRouterProtocol?
    
    func getMovies() {
        getMoviesInteractor?.execute()
    }
    
    func goToDetail(movie: Movie, view: UINavigationController?) {
        router?.presentDetailMovie(movie: movie, navController: view)
    }
}

extension MoviesPresenter: GetMoviesInteractorOutputProtocol {
    func didRetrieveMovies(_ movies: [Movie]) {
        self.movies = movies
        DispatchQueue.main.async { [weak self] in
            self?.view?.endRefresh()
            self?.view?.didRetrieveMovies()
        }
    }
    
    func didGetError(_ error: CustomError) {
        var message: String = Constants.ErrorMessage.emptyMessage
        switch error {
        case .noInternetConnection:
            message = Constants.ErrorMessage.noInternetMessage
        default:
            message = Constants.ErrorMessage.defaultMessage
        }
        DispatchQueue.main.async { [weak self] in
            self?.view?.endRefresh()
            self?.view?.didGetError(message)
        }
    }
}
