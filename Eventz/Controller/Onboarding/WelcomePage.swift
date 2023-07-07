//
//  WelcomePage.swift
//  Eventz
//
//  Created by Caio Chaves on 15.06.23.
//

import UIKit

class WelcomePage: UIViewController {
    
    //MARK: Proprieties
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.textColor = UIColor(named: "Aux10")
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        return label
    }()
    
    private lazy var welcomeText: UILabel = {
        let label = UILabel()
        label.text = "We are excited to help you with your next plains, so let's gooot?"
        label.textColor = UIColor(named: "Aux5")
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "Green3")
        button.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.setTitle("Let's go", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .heavy)
        button.layer.cornerRadius = 25
        button.clipsToBounds = false
        return button
    }()

    //MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(patternImage: UIImage(named: "WallpaperThree")!)
        
        configureLayout()
    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        //Setting the background
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        backgroundImageView.image = UIImage(named: "WallpaperThree")
        backgroundImageView.contentMode = .scaleAspectFill
        
        // Avatar image
        let avatarImage = UIImageView(image: UIImage(named: "Avatar2"))
        avatarImage.frame = CGRect(x: 0, y: 0, width: 245, height: 420)
        
        // Adding subviews
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(welcomeText)
        view.addSubview(avatarImage)
        view.addSubview(startButton)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeText.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            //MARK: Welcome label
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //MARK: Welcome text
            welcomeText.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10),
            welcomeText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            welcomeText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            //MARK: avatarImage
            avatarImage.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 80),
            avatarImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 76),
            avatarImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -68),
            avatarImage.widthAnchor.constraint(equalToConstant: 245),
            avatarImage.heightAnchor.constraint(equalToConstant: 420),
            
            //MARK: Let's go button
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            startButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //Adding button target
        startButton.addTarget(self, action: #selector(letsGoDidTapped), for: .touchUpInside)
        
    }
    
    //MARK: Button action
    @objc private func letsGoDidTapped() {
        let vc = FirstScreen()
        vc.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(vc, animated: true)
    }

}
