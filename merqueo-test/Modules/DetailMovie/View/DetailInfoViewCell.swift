//
//  DetailInfoViewCell.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//


import UIKit

final class DetailInfoViewCell: UITableViewCell {
    
    private enum Constants {
        enum TitleLabel {
            static let margins: UIEdgeInsets = .init(top: 10, left: 0, bottom: 0, right: 0)
            static let textColor: UIColor? = .red
            static let font = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
        
        enum InformationLabel {
            static let margins: UIEdgeInsets = .init(top: 5, left: 0, bottom: 0, right: 0)
            static let textColor: UIColor? = .white
            static let font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            static let numberOfLines = 0
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.TitleLabel.textColor
        label.font = Constants.TitleLabel.font
        return label
    }()
    
    private lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.InformationLabel.textColor
        label.font = Constants.InformationLabel.font
        label.numberOfLines = Constants.InformationLabel.numberOfLines
        return label
    }()

    func configure(title: String, text: String) {
        titleLabel.text = title
        informationLabel.text = text
        backgroundColor = .black
        titleLabelConstraints()
        informationLabelConstraints()
    }
    
    private func titleLabelConstraints() {
        contentView.addSubview(titleLabel)
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.TitleLabel.margins.top),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func informationLabelConstraints() {
        contentView.addSubview(informationLabel)
        let constraints = [
            informationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.TitleLabel.margins.top),
            informationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            informationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            informationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
