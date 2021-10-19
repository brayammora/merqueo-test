//
//  DetailMovieRepository.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import Foundation

final class DetailMovieRepository: DetailMovieRepositoryInputProtocol {
    var remoteDataSource: DetailMovieServiceProtocol?
    weak var interactor: DetailMovieRepositoryOutputProtocol?
    
    public func getDetailMovie(idMovie: Int) {
        remoteDataSource?.getDetailMovie(idMovie: idMovie) { result in
            switch result {
            case .success(let detailMovie):
                self.interactor?.didRetrieveDetailMovie(detailMovie)
            case .failure(let error):
                self.interactor?.didGetError(error)
            }
        }
    }
}
