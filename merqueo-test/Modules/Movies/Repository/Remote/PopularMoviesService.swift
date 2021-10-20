//
//  PopularMoviesService.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 16/10/21.
//

import Foundation

final class PopularMoviesService: BaseService, PopularMoviesServiceProtocol {
    private enum Constants {
        static let getPopularMoviesPath: String = "movie/popular?api_key=%@&language=en-US&page=1"
    }
    
    func getPopularMovies(completion: @escaping PopularMoviesCompletion) {
        let getPopularMoviesPath = String(format: Constants.getPopularMoviesPath, Path.apiKey)
        let finalPath = String(format: Path.basePathFormat, Path.baseUrl, getPopularMoviesPath)
        sendRequest(url: finalPath, of: PopularMovies.self, method: .get, completion: completion)
    }
}
