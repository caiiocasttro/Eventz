//
//  InterestsButtonsCell.swift
//  Eventz
//
//  Created by Caio Chaves on 13.06.23.
//

import UIKit

class InterestsButtonsCell: UICollectionViewCell, CollectionCellAutoLayout {
    
    var cachedSize: CGSize? 

    var title: String? {
        didSet {
            guard let title = title else { return }
            interestsButton.setTitle(title, for: .normal)
        }
    }
    
    
    lazy var interestsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "Blue3")
        button.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.layer.cornerRadius = 17
        button.clipsToBounds = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(interestsButton)
        
        interestsButton.translatesAutoresizingMaskIntoConstraints = false
        interestsButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
         
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
       return preferredLayoutAttributesFitting(layoutAttributes)
   }
    
}


