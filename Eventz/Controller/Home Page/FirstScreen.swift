//
//  FirstScreen.swift
//  Eventz
//
//  Created by Caio Chaves on 20.06.23.
//

import UIKit

class FirstScreen: UIViewController {
    
    //MARK: Initializers
    lazy var upcomingButton = customGenericButton()
    
    lazy var nearbyButton = customGenericButton()
    
    lazy var popularButton = customGenericButton()
    
    //MARK: Properties
    private lazy var firstScreenLabel: UILabel = {
        let label = UILabel()
        label.text = "Tell us what you wanna see"
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.textColor = UIColor(named: "Aux9")
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    configureLayout()
    }
    
    //MARK: Configuring components
    private func configureComponents() {
        
        //Configuring upcoming button
        upcomingButton.backgroundColor = UIColor(named: "Pink3")
        upcomingButton.setTitle("Upcoming", for: .normal)
        
        //Configuring Nearby button
        nearbyButton.backgroundColor = UIColor(named: "Blue3")
        nearbyButton.setTitle("Nearby", for: .normal)
        
        //COnfiguring popular button
        popularButton.backgroundColor = UIColor(named: "Green3")
        popularButton.setTitle("Popular", for: .normal)
        
    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        configureComponents()
        //Setting the background
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        backgroundImageView.image = UIImage(named: "WallpaperFour")
        backgroundImageView.contentMode = .scaleToFill
        
        //Adding subview
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(firstScreenLabel)
        view.addSubview(upcomingButton)
        view.addSubview(nearbyButton)
        view.addSubview(popularButton)
        
        firstScreenLabel.translatesAutoresizingMaskIntoConstraints = false
        upcomingButton.translatesAutoresizingMaskIntoConstraints = false
        nearbyButton.translatesAutoresizingMaskIntoConstraints = false
        popularButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraints
        NSLayoutConstraint.activate([
            
            //Screen label
            firstScreenLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            firstScreenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            firstScreenLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
            
            //Popular button
            popularButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
            popularButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            popularButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            popularButton.heightAnchor.constraint(equalToConstant: 50),
            
            //Nearby button
            nearbyButton.bottomAnchor.constraint(equalTo: popularButton.topAnchor, constant: -20),
            nearbyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nearbyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nearbyButton.heightAnchor.constraint(equalToConstant: 50),
            
            //Upcoming button
            upcomingButton.bottomAnchor.constraint(equalTo: nearbyButton.topAnchor, constant: -20),
            upcomingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            upcomingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            upcomingButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //Adding button target
        upcomingButton.addTarget(self, action: #selector(upComingDidTapped), for: .touchUpInside)
    }
    
    //MARK: Button action
    
    @objc private func upComingDidTapped() {
        let vc = TabBarController()
        vc.navigationItem.hidesBackButton = true
        vc.navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.pushViewController(vc, animated: true)
    }

}
