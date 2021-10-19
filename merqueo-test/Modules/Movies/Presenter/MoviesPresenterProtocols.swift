//
//  MoviesPresenterProtocols.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 17/10/21.
//

import UIKit

protocol MoviesPresenterInputProtocol {
    var movies: [Movie] { get set }
    var view: MoviesPresenterOutputProtocol? { get set }
    var getMoviesInteractor: GetMoviesInteractorInputProtocol? { get set }
    var router: MoviesRouterProtocol? { get set }
    
    func getMovies()
    func goToDetail(movie: Movie, view: UINavigationController?)
}

protocol MoviesPresenterOutputProtocol: AnyObject {
    func didRetrieveMovies()
    func didGetError(_ message: String)
    func endRefresh()
}
