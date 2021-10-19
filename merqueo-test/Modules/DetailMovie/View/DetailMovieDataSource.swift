//
//  DetailMovieDataSource.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import UIKit

final class DetailMovieDataSource: NSObject {
    
    private enum Constants {
        static let numberOfRows: Int = 1
    }
    
    private var data: DetailMovie?
    private var sections: [DetailMovieTableViewSections] = []
    
    override init() { }
    
    func configure(data: DetailMovie) {
        self.data = data
        getSections()
    }
    
    private func getSections() {
        sections.append(.image)
        
        if let summary = data?.summary,
           !summary.isEmpty {
            sections.append(.summary)
        }
        if let releaseDate = data?.releaseDate,
           !releaseDate.isEmpty {
            sections.append(.releaseDate)
        }
        if let status = data?.status,
           !status.isEmpty {
            sections.append(.status)
        }
    }
}

extension DetailMovieDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = data else {
            return UITableViewCell()
        }
        
        let section = sections[indexPath.section]
        let text: String
        
        switch section {
        case .image:
            let image = data.image!
            return configureDetailImageViewCell(tableView, indexPath: indexPath, image: image)
        case .summary:
            text = data.summary!
        case .releaseDate:
            text = data.releaseDate
        case .status:
            text = data.status
        }
        return configureDetailInfoViewCell(tableView, indexPath: indexPath, title: section.titleHeader, text: text)
    }
    
    private func configureDetailImageViewCell(_ tableView: UITableView, indexPath: IndexPath, image: String) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailImageViewCell.reuseIdentifier) as? DetailImageViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(data: image)
        return cell
    }
    
    private func configureDetailInfoViewCell(_ tableView: UITableView, indexPath: IndexPath, title: String, text: String) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailInfoViewCell.reuseIdentifier) as? DetailInfoViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(title: title, text: text)
        return cell
    }
}


