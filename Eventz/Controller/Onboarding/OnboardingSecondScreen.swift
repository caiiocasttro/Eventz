//
//  OnboardingSecondScreen.swift
//  Eventz
//
//  Created by Caio Chaves on 31.05.23.
//

import UIKit

class OnboardingSecondScreen: UIViewController {
    
    //MARK: Initializers
    var signInButton = customGenericButton()
    
    var signUpButton = customGenericButton()
    
    var guestButton = customGenericButton()

    //MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
    }
    
    //MARK: Title and Background of the buttons
    private func configureButtons() {
        // Sign In button
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.backgroundColor = UIColor(named: "Pink3")
        
        //Sign Up button
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = UIColor(named: "Blue3")
        
        // Continue as guest button
        guestButton.setTitle("Continue as guest", for: .normal)
        guestButton.backgroundColor = UIColor(named: "Green3")
    }
    
    //MARK: Layout's configuration
    private func configureLayout() {
        configureButtons()
        //Setting the background
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        backgroundImageView.image = UIImage(named: "WallpaperTwo")
        backgroundImageView.contentMode = .scaleToFill
        
        // Image avatar
        let image = UIImageView(image: UIImage(named: "Avatar4"))
        
        // Adding subview
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(image)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        view.addSubview(guestButton)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        guestButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //Avatar
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 109),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16.22),
            image.widthAnchor.constraint(equalToConstant: 264.78),
            image.heightAnchor.constraint(equalToConstant: 420),
            
            //Sign in button
            signInButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -20),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            
            //Sign up button
            signUpButton.bottomAnchor.constraint(equalTo: guestButton.topAnchor, constant: -20),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            
            //Continue as guest button
            guestButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
            guestButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            guestButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            guestButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //Adding button target
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        self.navigationItem.setHidesBackButton(true, animated: true)
        guestButton.addTarget(self, action: #selector(continueAsGuestDidTapped), for: .touchUpInside)
        
        
    }
    
    //MARK: Buttons action
    @objc private func signInTapped() {
        let vc = SignInScreen()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func signUpTapped() {
        let vc = SignUpScreen()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func continueAsGuestDidTapped() {
        let vc = FirstScreen()
        vc.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(vc, animated: true)
    }

}
