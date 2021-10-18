//
//  DetailMovieViewController.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import UIKit

final class DetailMovieViewController: UIViewController, DetailMovieViewProtocol {
    private enum Constants {
        static let leftActionTitle = "Movies"
    }
    
    var presenter: DetailMoviePresenterInputProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension DetailMovieViewController: DetailMoviePresenterOutputProtocol {
    func didRetrieveDetailMovie() {
        
    }
}
