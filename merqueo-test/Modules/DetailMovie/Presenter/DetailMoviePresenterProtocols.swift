//
//  DetailMoviePresenterProtocols.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import UIKit

protocol DetailMoviePresenterInputProtocol {
    var movie: Movie? { get set }
    var view: DetailMoviePresenterOutputProtocol? { get set }
    var router: DetailMovieRouterProtocol? { get set }
    
}

protocol DetailMoviePresenterOutputProtocol: AnyObject {
    func didRetrieveDetailMovie()
}
