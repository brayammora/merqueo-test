//
//  MoviesRepositoryProtocols.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 16/10/21.
//

import Foundation

protocol MoviesRepositoryInputProtocol {
    var remoteDataSource: PopularMoviesServiceProtocol? { get set }
    var interactor: MoviesRepositoryOutputProtocol? { get set }
    
    func getPopularMovies()
}

protocol MoviesRepositoryOutputProtocol: AnyObject {
    func didRetrievePopularMovies(_ movies: PopularMovies)
    func didGetError(_ error: CustomError)
}
