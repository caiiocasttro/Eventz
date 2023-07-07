//
//  NotificationPage.swift
//  Eventz
//
//  Created by Caio Chaves on 04.07.23.
//

import UIKit

class NotificationPage: UIViewController {
    
    //MARK: Initializer
    
    //MARK: Proprieties
    private lazy var pageLabel: UILabel = {
        let label = UILabel()
        label.text = "Notifications"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor(named: "Aux9")
        return label
    }()
    
    //MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        navigationItem.titleView = pageLabel
        
        
    }
}
