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
        static let title: String = "Movies"
        static let emptyTitle: String = ""
        static let searchHint: String = "Tap to find"
    }
    
    var presenter: MoviesPresenterInputProtocol?
    private var moviesView = MoviesView()
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        presenter?.getMovies()
        DispatchQueue.main.async { [weak self] in
            self?.showLoading()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = Constants.title
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = Constants.emptyTitle
    }
    
    private func configureView() {
        setNavigationBarColor()
        configureSearchBar()
        view = moviesView
        title = Constants.title
        moviesView.delegate = self
    }
    
    private func configureSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Constants.searchHint
        searchController.searchBar.barStyle = .black
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
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
    
    func didGetError(_ message: String) {
        hideLoading()
        moviesView.setErrorScreen(message: message)
    }
    
    func endRefresh() {
        moviesView.endRefresh()
    }
}

extension MoviesViewController: MoviesViewDelegate {
    func showDetail(of movie: Movie) {
        presenter?.goToDetail(movie: movie, view: self.navigationController)
    }
    
    func refresh() {
        presenter?.getMovies()
    }
}

extension MoviesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let presenter = presenter else {
            return
        }
        
        let searchBar = searchController.searchBar
        if let searchText = searchBar.text {
            filterContentForSearchText(searchText)
        }
        
        let movies = isFiltering ? presenter.moviesFiltered : presenter.movies
        moviesView.configure(movies: movies, delegate: self)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        guard var presenter = presenter else {
            return
        }
        presenter.moviesFiltered = presenter.movies.filter { (movie: Movie) -> Bool in
            return movie.name.lowercased().contains(searchText.lowercased())
        }
    }
}
