//
//  MoviesView.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 17/10/21.
//

import UIKit

final class MoviesView: UIView {

    private enum Constants {
        enum CollectionView {
            static let margin: UIEdgeInsets = .init(top: 4, left: 4, bottom: -4, right: -4)
            static let heightItem: CGFloat = 150
        }
    }
    
    weak var delegate: MoviesViewDelegate?
    
    private lazy var refreshControl: UIRefreshControl = {
       let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        refreshControl.tintColor = .white
        return refreshControl
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = CollectionViewHorizontalCustom()
        layout.height = Constants.CollectionView.heightItem
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MoviesViewCell.self, forCellWithReuseIdentifier: MoviesViewCell.reuseIdentifier)
        collectionView.backgroundColor = .black
        collectionView.addSubview(refreshControl)
        return collectionView
    }()
    
    private lazy var dataSource: MoviesDataSource = {
        let datasource = MoviesDataSource()
        collectionView.dataSource = datasource
        collectionView.delegate = datasource
        return datasource
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        backgroundColor = .black
        collectionViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(movies: [Movie], delegate: MoviesViewDelegate) {
        dataSource.configure(movies: movies, delegate: delegate)
    }
    
    func endRefresh() {
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
    }
    
    func setErrorScreen(message: String) {
        collectionView.setEmptyMessage(message)
    }
    
    @objc private func onRefresh() {
        delegate?.refresh()
    }
    
    private func collectionViewConstraints() {
        addSubview(collectionView)
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.CollectionView.margin.top),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.CollectionView.margin.left),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Constants.CollectionView.margin.right),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: Constants.CollectionView.margin.bottom)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
