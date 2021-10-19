//
//  GetDetailMovieInteractorProtocols.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import Foundation

protocol GetDetailMovieInteractorInputProtocol {
    var repository: DetailMovieRepositoryInputProtocol? { get set }
    var presenter: GetDetailMovieInteractorOutputProtocol? { get set }
    
    func execute(idMovie: Int)
}

protocol GetDetailMovieInteractorOutputProtocol: AnyObject {
    func didRetrieveDetailMovie(_ detailMovie: DetailMovie)
    func didGetError(_ error: CustomError)
}
