//
//  PopularMoviesServiceProtocol.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 16/10/21.
//

import Foundation

typealias PopularMoviesCompletion = (Result<PopularMovies, CustomError>) -> Void

protocol PopularMoviesServiceProtocol {
    func getPopularMovies(completion: @escaping PopularMoviesCompletion)
}
