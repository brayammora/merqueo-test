//
//  MoviesRouter.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 17/10/21.
//

import UIKit

final class MoviesRouter: MoviesRouterProtocol {
    
    static func createModule() -> MoviesViewController {
        typealias ViewProtocols = MoviesViewProtocol & MoviesPresenterOutputProtocol
        typealias PresenterProtocols = MoviesPresenterInputProtocol & GetMoviesInteractorOutputProtocol
        typealias InteractorProtocols = GetMoviesInteractorInputProtocol & MoviesRepositoryOutputProtocol
        
        let view: ViewProtocols = MoviesViewController()
        var presenter: PresenterProtocols = MoviesPresenter()
        var interactor: InteractorProtocols = GetMoviesInteractor()
        var repository: MoviesRepositoryInputProtocol = MoviesRepository()
        let router: MoviesRouterProtocol = MoviesRouter()
        let remoteDataSource: PopularMoviesServiceProtocol = PopularMoviesService()
        
        view.presenter = presenter
        presenter.view = view
        presenter.getMoviesInteractor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.repository = repository
        repository.interactor = interactor
        repository.remoteDataSource = remoteDataSource
        
        return view as! MoviesViewController
    }
    
    func presentDetailMovie(movie: Movie, navController: UINavigationController?) {
//        let detailMovieTableViewController: DetailMovieTableViewController = DetailMovieRouter.createModule(movie: Movie)
//        navController?.pushViewController(detailMovieTableViewController, animated: true)
    }
}
