//
//  GetMoviesInteractorProtocols.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 17/10/21.
//

import Foundation

typealias MoviesCompletion = (Result<[Movie], CustomError>) -> Void

protocol GetMoviesInteractorInputProtocol {
    var repository: MoviesRepositoryInputProtocol? { get set }
    var presenter: GetMoviesInteractorOutputProtocol? { get set }
    
    func execute()
}

protocol GetMoviesInteractorOutputProtocol: AnyObject {
    func didRetrieveMovies(_ movies: [Movie])
    func didGetError(_ error: CustomError)
}
