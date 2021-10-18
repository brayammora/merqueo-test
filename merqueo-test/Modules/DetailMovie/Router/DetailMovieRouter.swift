//
//  DetailMovieRouter.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import UIKit

final class DetailMovieRouter: DetailMovieRouterProtocol {

    static func createModule(movie: Movie) -> DetailMovieViewController {
        typealias ViewProtocols = DetailMovieViewProtocol & DetailMoviePresenterOutputProtocol
        typealias PresenterProtocols = DetailMoviePresenterInputProtocol
        
        var view: ViewProtocols = DetailMovieViewController()
        var presenter: PresenterProtocols = DetailMoviePresenter()
        let router: DetailMovieRouterProtocol = DetailMovieRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.movie = movie
        
        return view as! DetailMovieViewController
    }
}
