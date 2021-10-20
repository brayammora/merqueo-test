//
//  MoviesDataSource.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 17/10/21.
//

import UIKit

final class MoviesDataSource: NSObject {
    
    private var movies: [Movie] = []
    weak var delegate: MoviesViewDelegate?
    
    override init() { }
    
    func configure(movies: [Movie], delegate: MoviesViewDelegate) {
        self.movies = movies
        self.delegate = delegate
    }
}

extension MoviesDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return configureMovieCell(collectionView: collectionView, indexPath: indexPath)
    }
    
    private func configureMovieCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesViewCell.reuseIdentifier, for: indexPath) as? MoviesViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(data: movies[indexPath.row])
        return cell
    }
}

extension MoviesDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        delegate?.showDetail(of: movie)
    }
}
