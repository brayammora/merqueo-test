//
//  GetMoviesInteractor.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 17/10/21.
//

import Foundation

final class GetMoviesInteractor: GetMoviesInteractorInputProtocol {
    var repository: MoviesRepositoryInputProtocol?
    weak var presenter: GetMoviesInteractorOutputProtocol?
    
    func execute() {
        repository?.getPopularMovies()
    }
}

extension GetMoviesInteractor: MoviesRepositoryOutputProtocol {
    func didRetrievePopularMovies(_ popularMovies: PopularMovies) {
        let moviesList = popularMovies.results
        presenter?.didRetrieveMovies(moviesList)
    }
    
    func didGetError(_ error: CustomError) {
        presenter?.didGetError(error)
    }
    
}
