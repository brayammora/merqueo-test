//
//  DetailMovieViewController.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import UIKit

final class DetailMovieViewController: UIViewController, DetailMovieViewProtocol {

    var presenter: DetailMoviePresenterInputProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getDetailMovie()
    }
}

extension DetailMovieViewController: DetailMoviePresenterOutputProtocol {
    func didRetrieveDetailMovie() {
        guard let detailMovie = presenter?.detailMovie else {
            return
        }
        print(detailMovie)
    }
    
    func didGetError(_ error: CustomError) {
        
    }
}
