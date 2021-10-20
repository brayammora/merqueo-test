//
//  MockGetMoviesInteractorOutput.swift
//  merqueo-testTests
//
//  Created by Brayam Alberto Mora Arias on 19/10/21.
//

import Foundation
@testable import merqueo_test

struct GetMoviesInteractorOutputCalls {
    var didRetrieveMovies: Bool = false
    var didGetError: Bool = false

}
class MockGetMoviesInteractorOutput: GetMoviesInteractorOutputProtocol {
    lazy var calls = GetMoviesInteractorOutputCalls()
    
    func didRetrieveMovies(_ movies: [Movie]) {
        calls.didRetrieveMovies = true
    }
    
    func didGetError(_ error: CustomError) {
        calls.didGetError = true
    }
}
