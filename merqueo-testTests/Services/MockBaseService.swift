//
//  MockBaseService.swift
//  merqueo-testTests
//
//  Created by Brayam Alberto Mora Arias on 19/10/21.
//

import Foundation
@testable import merqueo_test

extension BaseService {
    func sendRequestMock<T: Decodable>(url: String, of type: T.Type, method: HTTPMethod, completion: @escaping (Result<T, CustomError>) -> Void) {
        if type is PopularMovies.Type {
            let response = generatePopularMoviesResponse()
            completion(.success(response as! T))
        }
        
    }
    
    private func generatePopularMoviesResponse() -> PopularMovies? {
        let bundle = Bundle(for: MockPopularMoviesService.self)
        guard let model: PopularMovies = FileManager.getJSONObject(from: "PopularMovies", bundle: bundle) else { return nil }
        return model
    }
}
