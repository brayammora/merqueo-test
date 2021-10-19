//
//  DetailMoviePresenter.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import UIKit

final class DetailMoviePresenter: DetailMoviePresenterInputProtocol {
    
    var movie: Movie?
    var detailMovie: DetailMovie?
    weak var view: DetailMoviePresenterOutputProtocol?
    var getDetailMovieInteractor: GetDetailMovieInteractorInputProtocol?
    var router: DetailMovieRouterProtocol?
    
    func getDetailMovie() {
        guard let movie = movie else {
            return
        }

        getDetailMovieInteractor?.execute(idMovie: movie.id)
    }
}

extension DetailMoviePresenter: GetDetailMovieInteractorOutputProtocol {
    func didRetrieveDetailMovie(_ detailMovie: DetailMovie) {
        self.detailMovie = detailMovie
        DispatchQueue.main.async { [weak self] in
            self?.view?.didRetrieveDetailMovie()
        }
    }
    
    func didGetError(_ error: CustomError) {
        view?.didGetError(error)
    }
}
