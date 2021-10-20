//
//  MockGetMoviesInteractorInput.swift
//  merqueo-testTests
//
//  Created by Brayam Alberto Mora Arias on 19/10/21.
//

import Foundation
@testable import merqueo_test

struct GetMoviesInteractorInputCalls {
    var didExecute: Bool = false
}

class MockGetMoviesInteractorInput: GetMoviesInteractorInputProtocol {

    lazy var calls = GetMoviesInteractorInputCalls()
    var repository: MoviesRepositoryInputProtocol?
    var presenter: GetMoviesInteractorOutputProtocol?
    
    func execute() {
        calls.didExecute = true
        let movies = [
            Movie(id: 12345, posterPath: nil)
        ]
        presenter?.didRetrieveMovies(movies)
    }
}
