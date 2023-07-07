//
//  PasswordUpdated.swift
//  Eventz
//
//  Created by Caio Chaves on 20.06.23.
//

import UIKit

class PasswordUpdated: UIViewController {
    
    //MARK: Button initializer
    lazy var signInButton = customGenericButton()
    
    //MARK: Proprieties
    lazy var passUpdatedLabel: UILabel = {
        let label = UILabel()
        label.text = "Password updated!"
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.textColor = UIColor(named: "Aux9")
        return label
    }()
    
    lazy var passUpdatedText: UILabel = {
        let label = UILabel()
        label.text = "Your password has been updated!"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(named: "Aux5")
        label.textAlignment = .center
        return label
    }()

    //MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureLayout()
    }
    
    //MARK: Configuring components
    private func configureComponents() {
        
        //Configuring signIn Button
        signInButton.backgroundColor = UIColor(named: "Green3")
        signInButton.setTitle("Sign In", for: .normal)
        
    }

    //MARK: Configuring layout
    private func configureLayout() {
        configureComponents()
        
        //Avatar Image
        let avatar = UIImageView(image: UIImage(named: "Avatar3"))
        avatar.frame = CGRect(x: 0, y: 0, width: 164, height: 320)
        
        //Setting the background
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        backgroundImageView.image = UIImage(named: "WallpaperThree")
        backgroundImageView.contentMode = .scaleToFill
        
        //Adding subview
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(avatar)
        view.addSubview(passUpdatedLabel)
        view.addSubview(passUpdatedText)
        view.addSubview(signInButton)
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
        passUpdatedLabel.translatesAutoresizingMaskIntoConstraints = false
        passUpdatedText.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraints
        NSLayoutConstraint.activate([
            
            //Avatar image
            avatar.topAnchor.constraint(equalTo: view.topAnchor, constant: 77),
            avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Password updated label
            passUpdatedLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 422),
            passUpdatedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Password updated text
            passUpdatedText.topAnchor.constraint(equalTo: passUpdatedLabel.bottomAnchor, constant: 30),
            passUpdatedText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Sign In Button
            signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //Adding button target
        signInButton.addTarget(self, action: #selector(signInDidTapped), for: .touchUpInside)
        
    }
    
    //MARK: Button action
    @objc private func signInDidTapped() {
        let vc = SignInScreen()
        vc.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(vc, animated: true)
    }
}
