//
//  MoviesViewController.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 17/10/21.
//

import Foundation
import UIKit

final class MoviesViewController: UIViewController, MoviesViewProtocol {
    private enum Constants {
        static let title = "Movies"
        static let emptyTitle = ""
    }
    
    var presenter: MoviesPresenterInputProtocol?
    private var moviesView = MoviesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        presenter?.getMovies()
        DispatchQueue.main.async { [weak self] in
            self?.showLoading()
        }
    }
    
    private func configureView() {
        setNavigationBarColor()
        view = moviesView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = Constants.title
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = Constants.emptyTitle
    }
}

extension MoviesViewController: MoviesPresenterOutputProtocol {
    func didRetrieveMovies() {
        hideLoading()
        guard let movies = presenter?.movies else {
            return
        }
        moviesView.configure(movies: movies, delegate: self)
    }
    
    func didGetError(_ error: CustomError) {
        hideLoading()
    }
}

extension MoviesViewController: MoviesViewDelegate {
    func showDetail(of movie: Movie) {
        presenter?.goToDetail(movie: movie, view: self.navigationController)
    }
}
