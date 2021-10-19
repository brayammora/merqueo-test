//
//  MockMoviesPresenterOutput.swift
//  merqueo-testTests
//
//  Created by Brayam Alberto Mora Arias on 19/10/21.
//

import UIKit
@testable import merqueo_test

struct MoviesPresenterOutputCalls {
    var didRetrieveMovies: Bool = false
    var didGetError: Bool = false
    var didEndRefresh: Bool = false
}

class MockMoviesPresenterOutput: MoviesPresenterOutputProtocol {
    
    lazy var calls = MoviesPresenterOutputCalls()
    
    func didRetrieveMovies() {
        calls.didRetrieveMovies = true
    }
    
    func didGetError(_ message: String) {
        calls.didGetError = true
    }
    
    func endRefresh() {
        calls.didEndRefresh = true
    }
}
