//
//  EventsPageFooter.swift
//  Eventz
//
//  Created by Caio Chaves on 29.06.23.
//

import UIKit

class EventsPageFooter: UICollectionReusableView {
    
    //MARK: Properties
    private lazy var footer: UIView = {
        let footer = UIView()
        return footer
    }()
    
    
    //MARK: Page lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Configuring layout
    private func configureLayout() {
        
        //Adding subview
        addSubview(footer)
        
        footer.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraints
        NSLayoutConstraint.activate([
        
            //Footer
            footer.leadingAnchor.constraint(equalTo: leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: trailingAnchor),
            footer.heightAnchor.constraint(equalToConstant: 90)
        
        ])
    }
}
