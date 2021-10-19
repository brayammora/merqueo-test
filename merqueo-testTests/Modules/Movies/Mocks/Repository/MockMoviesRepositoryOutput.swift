//
//  MockMoviesRepositoryOutput.swift
//  merqueo-testTests
//
//  Created by Brayam Alberto Mora Arias on 19/10/21.
//

import Foundation
@testable import merqueo_test

struct MoviesRepositoryOutputCalls {
    var didRetrievePopularMovies: Bool = false
    var didGetError: Bool = false

}
class MockMoviesRepositoryOutput: MoviesRepositoryOutputProtocol {
    
    lazy var calls = MoviesRepositoryOutputCalls()
    
    func didRetrievePopularMovies(_ popularMovies: PopularMovies) {
        calls.didRetrievePopularMovies = true
    }
    
    func didGetError(_ error: CustomError) {
        calls.didGetError = true
    }
    
}
