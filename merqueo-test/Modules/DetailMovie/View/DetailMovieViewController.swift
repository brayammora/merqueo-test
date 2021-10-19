//
//  DetailMovieViewController.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import UIKit

final class DetailMovieViewController: UIViewController, DetailMovieViewProtocol {
    
    var presenter: DetailMoviePresenterInputProtocol?
    private var detailMovieView = DetailMovieView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        presenter?.getDetailMovie()
    }
    
    private func configureView() {
        view = detailMovieView
    }
}

extension DetailMovieViewController: DetailMoviePresenterOutputProtocol {
    func didRetrieveDetailMovie() {
        guard let detailMovie = presenter?.detailMovie else {
            return
        }
        title = detailMovie.title
        detailMovieView.configure(detailMovie: detailMovie)
    }
    
    func didGetError(_ error: CustomError) {
        
    }
}
