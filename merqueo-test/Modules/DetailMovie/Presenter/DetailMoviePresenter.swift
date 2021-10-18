//
//  DetailMoviePresenter.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import UIKit

final class DetailMoviePresenter: DetailMoviePresenterInputProtocol {
    
    var movie: Movie?
    weak var view: DetailMoviePresenterOutputProtocol?
    var router: DetailMovieRouterProtocol?
}
