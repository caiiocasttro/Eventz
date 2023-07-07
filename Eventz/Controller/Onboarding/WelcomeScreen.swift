//
//  WelcomeScreen.swift
//  Eventz
//
//  Created by Caio Chaves on 31.05.23.
//

import UIKit

class WelcomeScreen: UIViewController {
    
    //MARK: Initializers
    let reusableButton = customGenericButton()
    
    let reusableFunction = ReusableFunctions()
    
    //MARK: Properties
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hello, welcome to Eventz app"
        label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        label.textColor = UIColor(named: "Aux9")
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
//MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configurateLayout()
    }
    
    //MARK: Configuring components
    private func configureComponents() {
        
        // Configurating the Let's go button
        reusableButton.setTitle("Let's Go", for: .normal)
        reusableButton.backgroundColor = UIColor(named: "Pink3")
        
    }
    
    //MARK: Configuring layout
    private func configurateLayout() {
        configureComponents()
        //Setting the background
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        backgroundImageView.image = UIImage(named: "WallpaperOne")
        backgroundImageView.contentMode = .scaleToFill
        
        // Avatar's image
        let image = UIImageView(image: UIImage(named: "Avatar1"))
        
        //Adding SubViews
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(label)
        view.addSubview(reusableButton)
        view.addSubview(image)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        reusableButton.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
           // MARK: Button
            reusableButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
            reusableButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            reusableButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            reusableButton.heightAnchor.constraint(equalToConstant: 50),
            
            // MARK: Label
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            // MARK: Image
            image.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 60),
            image.widthAnchor.constraint(equalToConstant: 170),
            image.heightAnchor.constraint(equalToConstant: 420),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 129),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -91)
        ])
        reusableButton.addTarget(self, action: #selector(didTapLetsGo), for: .touchUpInside)
        navigationController?.title = .none
    }
    
    //MARK: Button action
    @objc private func didTapLetsGo() {
        let vc = OnboardingSecondScreen()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
