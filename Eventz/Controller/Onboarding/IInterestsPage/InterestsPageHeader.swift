//
//  InterestsPageHeader.swift
//  Eventz
//
//  Created by Caio Chaves on 13.06.23.
//

import UIKit

class InterestsPageHeader: UICollectionReusableView {
    
    private lazy var steps: UILabel = {
        let label = UILabel()
        label.text = "3 of 3"
        label.textColor = UIColor(named: "Aux10")
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private lazy var interestPageLabel: UILabel = {
        let label = UILabel()
        label.text = "Tell Us Your Interests"
        label.textColor = UIColor(named: "Aux10")
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        return label
    }()
    
    private lazy var labelText: UILabel = {
        let text = UILabel()
        text.text = "Telling us your interests will help us to filter the events based on what kind of events you like."
        text.textColor = UIColor(named: "Aux5")
        text.font = .systemFont(ofSize: 16, weight: .medium)
        text.numberOfLines = 0
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        addSubview(steps)
        addSubview(interestPageLabel)
        addSubview(labelText)
        
        steps.translatesAutoresizingMaskIntoConstraints = false
        interestPageLabel.translatesAutoresizingMaskIntoConstraints = false
        labelText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            //MARK: Steps label
            steps.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            steps.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            //MARK: Interest's Page Label
            interestPageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            interestPageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            //MARK: Explanation text
            labelText.topAnchor.constraint(equalTo: interestPageLabel.bottomAnchor, constant: 10),
            labelText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            labelText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
            
            //MARK: Button collection
        ])
    }
    
}
