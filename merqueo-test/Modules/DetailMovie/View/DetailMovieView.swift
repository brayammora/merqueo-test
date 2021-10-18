//
//  DetailMovieView.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import UIKit

final class DetailMovieView: UIView {
    
    private enum Constants {
        enum TableView {
            static let margin: UIEdgeInsets = .init(top: 4, left: 4, bottom: -4, right: -4)
        }
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        tableView.isUserInteractionEnabled = true
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(DetailImageViewCell.self, forCellReuseIdentifier: DetailImageViewCell.reuseIdentifier)
        tableView.register(DetailInfoViewCell.self, forCellReuseIdentifier: DetailInfoViewCell.reuseIdentifier)
        return tableView
    }()
    
    private lazy var dataSource: DetailMovieDataSource = {
        let datasource = DetailMovieDataSource()
        tableView.dataSource = datasource
        return datasource
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        backgroundColor = .black
        tableViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(movie: Movie) {
        dataSource.configure(data: movie)
    }
    
    private func tableViewConstraints() {
        addSubview(tableView)
        let constraints = [
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.TableView.margin.top),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.TableView.margin.left),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Constants.TableView.margin.right),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: Constants.TableView.margin.bottom)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
