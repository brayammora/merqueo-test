//
//  DetailMovieRepositoryProtocols.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import Foundation

protocol DetailMovieRepositoryInputProtocol {
    var remoteDataSource: DetailMovieServiceProtocol? { get set }
    var interactor: DetailMovieRepositoryOutputProtocol? { get set }
    
    func getDetailMovie(idMovie: Int)
}

protocol DetailMovieRepositoryOutputProtocol: AnyObject {
    func didRetrieveDetailMovie(_ detailMovie: DetailMovie)
    func didGetError(_ error: CustomError)
}
