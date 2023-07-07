//
//  ResetPassword.swift
//  Eventz
//
//  Created by Caio Chaves on 20.06.23.
//

import UIKit

class ResetPassword: UIViewController {
    
    //MARK: Initializers
    lazy var emailTextField = textFieldCustom()
    
    lazy var resetPasswordButton = customGenericButton()
    
    //MARK: Properties
    private lazy var resetPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Reset password"
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.textColor = UIColor(named: "Aux9")
        return label
    }()
    
    private lazy var resetPasswordLabelText: UILabel = {
        let label = UILabel()
        label.text = "Enter your email adress below to reset your password"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(named: "Aux5")
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    //MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        
        configureLayout()
    }
    
    
    //MARK: Configuring reusable components
    private func configureComponents() {
        
        // Configuring textField
        emailTextField.placeholder = "Your email"
        emailTextField.autocapitalizationType = .none
        
        //Configuring button
        resetPasswordButton.backgroundColor = UIColor(named: "Pink8")
        resetPasswordButton.setTitle("Reset password", for: .normal)
        resetPasswordButton.isEnabled = false
    }
//MARK: Configuring layout
    private func configureLayout() {
        configureComponents()
        //Setting the background
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        backgroundImageView.image = UIImage(named: "WallpaperOne")
        backgroundImageView.contentMode = .scaleToFill
        
        // Adding subview
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(resetPasswordLabel)
        view.addSubview(resetPasswordLabelText)
        view.addSubview(emailTextField)
        view.addSubview(resetPasswordButton)
        
        resetPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordLabelText.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraints
        NSLayoutConstraint.activate([
            //Reset Password label
            resetPasswordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 370),
            resetPasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Enter your email text
            resetPasswordLabelText.topAnchor.constraint(equalTo: resetPasswordLabel.bottomAnchor, constant: 30),
            resetPasswordLabelText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            resetPasswordLabelText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            
            //Email TextField
            emailTextField.topAnchor.constraint(equalTo: resetPasswordLabelText.bottomAnchor, constant: 60),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            //Reset password button
            resetPasswordButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            resetPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resetPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resetPasswordButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        // Adding button's target
        resetPasswordButton.addTarget(self, action: #selector(resetButtonDidTapped), for: .touchUpInside)
        
    }
    
    //MARK: Button action
    @objc private func resetButtonDidTapped() {
        let vc = CreateNewPassword()
        navigationController?.pushViewController(vc, animated: true)
    }

}

//MARK: Delegates
extension ResetPassword: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            resetPasswordButton.backgroundColor = UIColor(named: "Pink3")
            resetPasswordButton.isEnabled = true
            emailTextField.resignFirstResponder()
            resetPasswordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 370).isActive = true
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.isEditing {
            resetPasswordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        resetPasswordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 370).isActive = true
    }
    
}
