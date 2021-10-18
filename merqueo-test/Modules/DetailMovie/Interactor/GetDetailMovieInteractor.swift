//
//  GetDetailMovieInteractor.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import Foundation

final class GetDetailMovieInteractor: GetDetailMovieInteractorInputProtocol {
    var repository: DetailMovieRepositoryInputProtocol?
    weak var presenter: GetDetailMovieInteractorOutputProtocol?
    
    func execute(idMovie: Int) {
        repository?.getDetailMovie(idMovie: idMovie)
    }
}

extension GetDetailMovieInteractor: DetailMovieRepositoryOutputProtocol {
    func didRetrieveDetailMovie(_ detailMovie: DetailMovie) {
        presenter?.didRetrieveDetailMovie(detailMovie)
    }
    
    func didGetError(_ error: CustomError) {
        presenter?.didGetError(error)
    }
    
}
