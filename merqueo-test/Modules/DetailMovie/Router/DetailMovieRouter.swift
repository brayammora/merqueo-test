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
        typealias PresenterProtocols = DetailMoviePresenterInputProtocol & GetDetailMovieInteractorOutputProtocol
        typealias InteractorProtocols = GetDetailMovieInteractorInputProtocol & DetailMovieRepositoryOutputProtocol
        
        var view: ViewProtocols = DetailMovieViewController()
        var presenter: PresenterProtocols = DetailMoviePresenter()
        var interactor: InteractorProtocols = GetDetailMovieInteractor()
        var repository: DetailMovieRepositoryInputProtocol = DetailMovieRepository()
        let router: DetailMovieRouterProtocol = DetailMovieRouter()
        let remoteDataSource: DetailMovieServiceProtocol = DetailMovieService()
        
        view.presenter = presenter
        presenter.view = view
        presenter.getDetailMovieInteractor = interactor
        presenter.router = router
        presenter.movie = movie
        interactor.presenter = presenter
        interactor.repository = repository
        repository.interactor = interactor
        repository.remoteDataSource = remoteDataSource
        
        return view as! DetailMovieViewController
    }
}
