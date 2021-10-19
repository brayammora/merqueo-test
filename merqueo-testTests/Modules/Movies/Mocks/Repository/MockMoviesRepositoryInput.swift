//
//  MockMoviesRepositoryInput.swift
//  merqueo-testTests
//
//  Created by Brayam Alberto Mora Arias on 19/10/21.
//

import Foundation
@testable import merqueo_test

struct MoviesRepositoryInputCalls {
    var didRetrievePopularMovies: Bool = false
    var didGetError: Bool = false
    var popularMovies: PopularMovies? = nil

}
class MockMoviesRepositoryInput: MoviesRepositoryInputProtocol {
    
    lazy var calls = MoviesRepositoryInputCalls()
    var interactor: MoviesRepositoryOutputProtocol?
    var remoteDataSource: PopularMoviesServiceProtocol?
    
    func getPopularMovies() {
        remoteDataSource?.getPopularMovies { result in
            switch result {
            case .success(let movies):
                self.calls.didRetrievePopularMovies = true
                self.interactor?.didRetrievePopularMovies(movies)
                self.calls.popularMovies = movies
            case .failure(let error):
                self.calls.didGetError = true
                self.interactor?.didGetError(error)
            }
        }
    }
}
