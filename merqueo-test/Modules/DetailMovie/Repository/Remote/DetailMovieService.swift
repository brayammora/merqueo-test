//
//  DetailMovieService.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import Foundation

final class DetailMovieService: BaseService, DetailMovieServiceProtocol {
    private enum Constants {
        static let getDetailMoviePath: String = "movie/%d?api_key=%@"
    }
    
    func getDetailMovie(idMovie: Int, completion: @escaping DetailMovieCompletion) {
        let getDetailMoviePath = String(format: Constants.getDetailMoviePath, idMovie, Path.apiKey)
        let finalPath = String(format: Path.basePathFormat, Path.baseUrl, getDetailMoviePath)
        sendRequest(url: finalPath, of: DetailMovie.self, method: .get, completion: completion)
    }
}
