//
//  FavoritePageHeader.swift
//  Eventz
//
//  Created by Caio Chaves on 02.07.23.
//

import UIKit

class FavoritePageHeader: UICollectionReusableView {
    
    //MARK: Initializer
    
    //MARK: Proprieties
    private lazy var headerBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Principal6")
        return view
    }()
    
    private lazy var favoriteLabel: UILabel = {
        let label = UILabel()
        label.text = "Favorite"
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.textColor = UIColor(named: "Pink3")
        return label
    }()
    
    //MARK: Page lifecycle
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        
        //Adding subview
        addSubview(headerBackground)
        headerBackground.addSubview(favoriteLabel)
        
        headerBackground.translatesAutoresizingMaskIntoConstraints = false
        favoriteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraints
        NSLayoutConstraint.activate([
        
            //Background
            headerBackground.topAnchor.constraint(equalTo: topAnchor, constant: -47),
            headerBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerBackground.heightAnchor.constraint(equalToConstant: 100),
            
            //Favorite label
            favoriteLabel.topAnchor.constraint(equalTo: headerBackground.topAnchor, constant: 54),
            favoriteLabel.leadingAnchor.constraint(equalTo: headerBackground.leadingAnchor, constant: 20)
        ])
    }
    
        
}
