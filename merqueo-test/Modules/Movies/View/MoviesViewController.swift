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
    }
    
    var presenter: MoviesPresenterInputProtocol?
    private var moviesView = MoviesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        presenter?.getMovies()
    }
    
    private func configureView() {
        setNavigationBarColor()
        title = Constants.title
        view = moviesView
    }
}

extension MoviesViewController: MoviesPresenterOutputProtocol {
    func didRetrieveMovies() {
        guard let movies = presenter?.movies else {
            return
        }
        moviesView.configure(movies: movies)
    }
    
    func didGetError(_ error: CustomError) {
        
    }
}
