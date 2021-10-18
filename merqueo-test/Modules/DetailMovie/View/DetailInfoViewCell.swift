//
//  DetailInfoViewCell.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias - Ceiba Software on 18/10/21.
//


import UIKit

final class DetailInfoViewCell: UITableViewCell {
    
    private enum Constants {
        enum StackView {
            static let spacing: CGFloat = 8
        }
        
        enum TitleLabel {
            static let textColor: UIColor? = .red
            static let font = UIFont.systemFont(ofSize: 14, weight: .bold)
        }
        
        enum InformationLabel {
            static let textColor: UIColor? = .white
            static let font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            static let numberOfLines = 0
        }
    }
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, informationLabel])
        stack.spacing = Constants.StackView.spacing
        return stack
    }()
    
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

    func configure(data: Movie) {
        stackViewConstraints()
    }
    
    private func stackViewConstraints() {
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
