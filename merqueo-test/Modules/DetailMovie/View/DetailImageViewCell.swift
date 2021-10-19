//
//  DetailImageViewCell.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//


import UIKit

final class DetailImageViewCell: UITableViewCell {
    
    private enum Constants {
        static let height: CGFloat = 250
    }
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    func configure(data: String) {
        let completeUrl = String(format: Path.basePathFormat ,Path.baseImageUrl, data)
        posterImageView.downloadImage(from: completeUrl)
        posterImageViewConstraints()
    }
    
    private func posterImageViewConstraints() {
        contentView.addSubview(posterImageView)
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: Constants.height)
        ])
    }
}
