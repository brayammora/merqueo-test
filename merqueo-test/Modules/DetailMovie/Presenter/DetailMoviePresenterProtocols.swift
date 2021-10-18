//
//  DetailMoviePresenterProtocols.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import UIKit

protocol DetailMoviePresenterInputProtocol {
    var movie: Movie? { get set }
    var detailMovie: DetailMovie? { get set }
    var view: DetailMoviePresenterOutputProtocol? { get set }
    var getDetailMovieInteractor: GetDetailMovieInteractorInputProtocol? { get set }
    var router: DetailMovieRouterProtocol? { get set }
    
    func getDetailMovie()
}

protocol DetailMoviePresenterOutputProtocol: AnyObject {
    func didRetrieveDetailMovie()
    func didGetError(_ error: CustomError)
}
