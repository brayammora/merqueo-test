//
//  MockPopularMoviesService.swift
//  merqueo-testTests
//
//  Created by Brayam Alberto Mora Arias on 19/10/21.
//

import Foundation
@testable import merqueo_test

struct PopularMoviesServiceCalls {
    var didGetPopularMovies: Bool = false
}

class MockPopularMoviesService: BaseService, PopularMoviesServiceProtocol {
    
    lazy var calls = PopularMoviesServiceCalls()
    
    func getPopularMovies(completion: @escaping PopularMoviesCompletion) {
        calls.didGetPopularMovies = true
        sendRequestMock(url: "", of: PopularMovies.self, method: .get, completion: completion)
    }
    
}
