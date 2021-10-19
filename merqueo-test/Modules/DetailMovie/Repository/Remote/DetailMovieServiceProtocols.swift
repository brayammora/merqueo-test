//
//  DetailMovieServiceProtocols.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import Foundation

typealias DetailMovieCompletion = (Result<DetailMovie, CustomError>) -> Void

protocol DetailMovieServiceProtocol {
    func getDetailMovie(idMovie: Int, completion: @escaping DetailMovieCompletion)
}
