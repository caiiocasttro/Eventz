//
//  CreateNewPassword.swift
//  Eventz
//
//  Created by Caio Chaves on 20.06.23.
//

import UIKit

class CreateNewPassword: UIViewController {
    
    //MARK: Initializers
    lazy var passwordTextField = textFieldCustom()
    
    lazy var confirmPassTextField = textFieldCustom()
    
    lazy var updatePassButton = customGenericButton()
    
    lazy var securityTextButton = securityTextFieldButton()
    
    lazy var securityTextButtonII = securityTextFieldButton()
    
    //MARK: Properties
    private lazy var createNewPassLabel: UILabel = {
        let label = UILabel()
        label.text = "Create a new password"
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.textColor = UIColor(named: "Aux9")
        return label
    }()
    
    private lazy var createNewPassLabelText: UILabel = {
        let label = UILabel()
        label.text = "Your email has been confirmed, set yout new password"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(named: "Aux5")
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    //MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        
        passwordTextField.delegate = self
        confirmPassTextField.delegate = self
        
    }
    //MARK: Configuring components
    private func configureComponents() {
        
        //Security TextField
        securityTextButton.setImage(UIImage(named: "eye-slash-solid")?.withTintColor(UIColor(named: "Aux2") ?? UIColor.gray), for: .normal)
        
        //Security TextFieldII
        securityTextButtonII.setImage(UIImage(named: "eye-slash-solid")?.withTintColor(UIColor(named: "Aux2") ?? UIColor.gray), for: .normal)
        
        // Configuring password textField
        passwordTextField.placeholder = "New password"
        passwordTextField.rightViewMode = .always
        passwordTextField.rightView = securityTextButton
        passwordTextField.isSecureTextEntry = true
        
        // Configuring confirmation of password
        confirmPassTextField.placeholder = "Confirm password"
        confirmPassTextField.rightViewMode = .always
        confirmPassTextField.rightView = securityTextButtonII
        confirmPassTextField.isSecureTextEntry = true
        
        // Configuring Update Button
        updatePassButton.backgroundColor = UIColor(named: "Blue8")
        updatePassButton.setTitle("Update password", for: .normal)
        updatePassButton.isEnabled = false
        
    }
    //MARK: Configuring layout
    private func configureLayout() {
        configureComponents()
        //Setting the background
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        backgroundImageView.image = UIImage(named: "WallpaperTwo")
        backgroundImageView.contentMode = .scaleToFill
        
        //Adding subview
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(createNewPassLabel)
        view.addSubview(createNewPassLabelText)
        view.addSubview(securityTextButton)
        view.addSubview(securityTextButtonII)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPassTextField)
        view.addSubview(updatePassButton)
        
        createNewPassLabel.translatesAutoresizingMaskIntoConstraints = false
        createNewPassLabelText.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPassTextField.translatesAutoresizingMaskIntoConstraints = false
        updatePassButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Adding constraints
        NSLayoutConstraint.activate([
            
            // Create new password label
            createNewPassLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 370),
            createNewPassLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Create new password text
            createNewPassLabelText.topAnchor.constraint(equalTo: createNewPassLabel.bottomAnchor, constant: 30),
            createNewPassLabelText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            createNewPassLabelText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            
            //Password TextField
            passwordTextField.topAnchor.constraint(equalTo: createNewPassLabelText.bottomAnchor, constant: 60),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            //Confirm password TextField
            confirmPassTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPassTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            confirmPassTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            confirmPassTextField.heightAnchor.constraint(equalToConstant: 50),
            
            //Update passsword button
            updatePassButton.topAnchor.constraint(equalTo: confirmPassTextField.bottomAnchor, constant: 20),
            updatePassButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            updatePassButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            updatePassButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        //Adding button's target
        securityTextButton.addTarget(self, action: #selector(eyeDidTappedOnPass), for: .touchUpInside)
        securityTextButtonII.addTarget(self, action: #selector(eyeDidTappedOnConfirmPass), for: .touchUpInside)
        updatePassButton.addTarget(self, action: #selector(updatePasswordDidTapped), for: .touchUpInside)
        
        
    }
    
    //MARK: Buttons action
    @objc private func eyeDidTappedOnPass() {

        if passwordTextField.isSecureTextEntry {
            securityTextButton.setImage(UIImage(named: "eye-solid")?.withTintColor(UIColor(named: "Aux4") ?? UIColor.gray), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            securityTextButton.setImage(UIImage(named: "eye-slash-solid")?.withTintColor(UIColor(named: "Aux2") ?? UIColor.gray), for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    @objc private func eyeDidTappedOnConfirmPass() {

        if confirmPassTextField.isSecureTextEntry {
            securityTextButtonII.setImage(UIImage(named: "eye-solid")?.withTintColor(UIColor(named: "Aux4") ?? UIColor.gray), for: .normal)
            confirmPassTextField.isSecureTextEntry = false
        } else {
            securityTextButtonII.setImage(UIImage(named: "eye-slash-solid")?.withTintColor(UIColor(named: "Aux2") ?? UIColor.gray), for: .normal)
            confirmPassTextField.isSecureTextEntry = true
        }
    }
    
    @objc private func updatePasswordDidTapped() {
        let vc = PasswordUpdated()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: Delegates
extension CreateNewPassword: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == passwordTextField {
            confirmPassTextField.becomeFirstResponder()
        } else if textField == confirmPassTextField {
            confirmPassTextField.resignFirstResponder()
            
            if let text = textField.text, !text.isEmpty {
                updatePassButton.backgroundColor = UIColor(named: "Blue3")
                updatePassButton.isEnabled = true
                confirmPassTextField.resignFirstResponder()
                createNewPassLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 370).isActive = true
            }
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        createNewPassLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 180).isActive = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        createNewPassLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 370).isActive = true
    }
}
