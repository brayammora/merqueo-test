//
//  MoviesRepository.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 16/10/21.
//

import Foundation

final class MoviesRepository: MoviesRepositoryInputProtocol {
    var remoteDataSource: PopularMoviesServiceProtocol?
    weak var interactor: MoviesRepositoryOutputProtocol?
    
    public func getPopularMovies() {
        remoteDataSource?.getPopularMovies { result in
            switch result {
            case .success(let popularMovies):
                self.interactor?.didRetrievePopularMovies(popularMovies)
            case .failure(let error):
                self.interactor?.didGetError(error)
            }
        }
    }
}
