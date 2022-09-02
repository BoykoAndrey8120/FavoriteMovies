//
//  MainView.swift
//  FavoriteMovies
//
//  Created by Andrey Boyko on 31.08.2022.
//

import UIKit

class MainView: UIView {
    let mainView = UIView()
    let textFieldTitle = UITextField()
    let textFeildYear = UITextField()
    let addButton = UIButton()
    let moviesTextView = UITextView()
    let moviesTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupTextFieldTitle()
        setupTextFeildYear()
        setupAddButton()
        setupMoviesTableView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupConstraints
    
    func setupTextFieldTitle() {
        textFieldTitle.borderStyle = .roundedRect
        textFieldTitle.textAlignment = .left
        textFieldTitle.placeholder = "Title"
        textFieldTitle.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = textFieldTitle.topAnchor.constraint(equalTo: topAnchor, constant: 30)
        let leadingConstraint = textFieldTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        let tralingConstraint = textFieldTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        addConstraints([topConstraint, leadingConstraint, tralingConstraint])
        addSubview(textFieldTitle)
    }
    
    func setupTextFeildYear() {
        textFeildYear.borderStyle = .roundedRect
        textFeildYear.textAlignment = .left
        textFeildYear.placeholder = "Year"
        textFeildYear.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = textFeildYear.topAnchor.constraint(equalTo: textFieldTitle.bottomAnchor, constant: 20)
        let leadingConstraint = textFeildYear.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        let tralingConstraint = textFeildYear.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        addConstraints([topConstraint, leadingConstraint, tralingConstraint])
        addSubview(textFeildYear)
    }
    
    func setupAddButton() {
        addButton.setTitle("Add", for: .normal)
        addButton.layer.cornerRadius = 6
        addButton.backgroundColor = .blue
        addButton.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = addButton.topAnchor.constraint(equalTo: textFeildYear.bottomAnchor, constant: 20)
        let leadingConstraint = addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 120)
        let tralingConstraint = addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -120)
        addConstraints([topConstraint, leadingConstraint, tralingConstraint])
        addSubview(addButton)
    }
    
    func setupMoviesTableView() {
        moviesTableView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = moviesTableView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 20)
        let leadingConstraint = moviesTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        let tralingConstraint = moviesTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        let bottomConstraint = bottomAnchor.constraint(equalTo: superview?.bottomAnchor ?? moviesTableView.bottomAnchor, constant: 10)
        addConstraints([topConstraint, leadingConstraint, tralingConstraint, bottomConstraint])
        addSubview(moviesTableView)
    }
    
    
}

