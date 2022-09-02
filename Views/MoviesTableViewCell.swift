//
//  MoviesTableViewCell.swift
//  FavoriteMovies
//
//  Created by Andrey Boyko on 01.09.2022.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    let labelTitle = UILabel()
    
    func setupCell(moive: Movie) {
        contentView.addSubview(labelTitle)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.textAlignment = .left
        labelTitle.font = .systemFont(ofSize: 12)
        let horizontalConstraint = labelTitle.centerXAnchor.constraint(equalTo: centerXAnchor)
        let verticalConstraint = labelTitle.centerYAnchor.constraint(equalTo: centerYAnchor)
        let leadingConstraint = labelTitle.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7)
        addConstraints([horizontalConstraint, leadingConstraint, verticalConstraint])
        labelTitle.text = "\(moive.title)" + "  \(moive.year)"
    }
}
