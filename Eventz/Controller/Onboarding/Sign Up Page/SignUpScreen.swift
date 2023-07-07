//
//  SignUpScreen.swift
//  Eventz
//
//  Created by Caio Chaves on 05.06.23.
//

import UIKit



class SignUpScreen: UIViewController, TermsOfConditionsDelegate {
    
    //MARK: Initializers
    lazy var reusableButtons = ReusableButtons()
    
    lazy var reusableFunctions = ReusableFunctions()

    lazy var nameTextField = textFieldCustom()
    
    lazy var emailTextField = textFieldCustom()
    
    lazy var passTextField = textFieldCustom()
    
    lazy var confirmPassTextField = textFieldCustom()
    
    lazy var securityTextFieldSignUp = securityTextFieldButton()
    
    lazy var securityTextFieldSignUpII = securityTextFieldButton()
    
    lazy var registerButton = customGenericButton()
    
    //MARK: Properties
    private lazy var step: UILabel = {
        let label = UILabel()
        label.text = "1 of 2"
        label.textColor = UIColor(named: "Aux10")
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private lazy var signUpLabel: UILabel = {
       let label = UILabel()
        label.text = "Sign Up"
        label.textColor = UIColor(named: "Aux9")
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Name"
        label.textColor = UIColor(named: "Aux6")
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
       let label = UILabel()
        label.text = "Email"
        label.textColor = UIColor(named: "Aux6")
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private lazy var passwordLabel: UILabel = {
       let label = UILabel()
        label.text = "Password"
        label.textColor = UIColor(named: "Aux6")
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private lazy var confirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Confirm password"
        label.textColor = UIColor(named: "Aux6")
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    
    private lazy var haveAnAccountButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 187, height: 20)
        button.setTitle("Already have an account? Sign In", for: .normal)
        button.setTitleColor(UIColor(named: "Aux4"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        return button
    }()

    //MARK: Page Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        emailTextField.delegate = self
        passTextField.delegate = self
        confirmPassTextField.delegate = self
        
        configureLayout()
    }
    
    //MARK: Component's configuration
    private func configureComponents() {
        
        //Name TexrtField
        nameTextField.placeholder = "Your name"
        nameTextField.autocapitalizationType = .sentences
        
        //Email TextField
        emailTextField.placeholder = "Your email"
        
        //SecurityTextField Buttons
        securityTextFieldSignUp.setImage(UIImage(named: "eye-slash-solid")?.withTintColor(UIColor(named: "Aux2") ?? UIColor.gray), for: .normal)
        securityTextFieldSignUpII.setImage(UIImage(named: "eye-slash-solid")?.withTintColor(UIColor(named: "Aux2") ?? UIColor.gray), for: .normal)
        
        //Password TextField
        passTextField.placeholder = "Your new password"
        passTextField.isSecureTextEntry = true
        passTextField.rightViewMode = .always
        passTextField.rightView = securityTextFieldSignUp
        
        //Confirm Password TextField
        confirmPassTextField.placeholder = "Confirm your password"
        confirmPassTextField.isSecureTextEntry = true
        confirmPassTextField.rightViewMode = .always
        confirmPassTextField.rightView = securityTextFieldSignUpII
        
        //Register Button
        registerButton.backgroundColor = UIColor(named: "Blue8")
        registerButton.setTitle("Register", for: .normal)
        registerButton.isEnabled = false
        
    }
    
    //MARK: Layout's configuration
    private func configureLayout() {
        configureComponents()
        //Setting the back button color
        navigationController?.navigationBar.tintColor = UIColor(named: "Aux9")
        
        //Setting the background
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        backgroundImageView.image = UIImage(named: "WallpaperThree")
        backgroundImageView.contentMode = .scaleToFill

        // Adding subview
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(step)
        view.addSubview(signUpLabel)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passTextField)
        view.addSubview(confirmPasswordLabel)
        view.addSubview(confirmPassTextField)
        view.addSubview(registerButton)
        view.addSubview(haveAnAccountButton)
        
        step.translatesAutoresizingMaskIntoConstraints = false
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmPassTextField.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        haveAnAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraints
        NSLayoutConstraint.activate([
        
            //Steps
            step.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            step.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            //Sign Up label
            signUpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 115),
            signUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Name label
            nameLabel.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Name TextField
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            //Email label
            emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Email TextField
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            //Password Label
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Password TextField
            passTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passTextField.heightAnchor.constraint(equalToConstant: 50),
            
            //Confirm Password Label
            confirmPasswordLabel.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 20),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Confirm Password TextField
            confirmPassTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 5),
            confirmPassTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            confirmPassTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            confirmPassTextField.heightAnchor.constraint(equalToConstant: 50),
            
            //Register Button
            registerButton.topAnchor.constraint(equalTo: confirmPassTextField.bottomAnchor, constant: 50),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            
            //Already have an account Button
            haveAnAccountButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34),
            haveAnAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
        
        securityTextFieldSignUp.addTarget(self, action: #selector(eyeDidTappedOnPass), for: .touchUpInside)
        securityTextFieldSignUpII.addTarget(self, action: #selector(eyeDidTappedOnConfirmPass), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerDidTapped), for: .touchUpInside)
        haveAnAccountButton.addTarget(self, action: #selector(alreadyHaveAccountDidTapped), for: .touchUpInside)
    }
    
    //MARK: Button's action
    @objc private func registerDidTapped() {
        confirmPassTextField.resignFirstResponder()
            
            let vc = TermsOfConditions()
            vc.delegate = self
            if let sheet = vc.sheetPresentationController {
                
                sheet.detents = [.medium()]
                sheet.largestUndimmedDetentIdentifier = .medium
                sheet.preferredCornerRadius = 30
            }
            present(vc, animated: true)
    }
    
    @objc private func alreadyHaveAccountDidTapped() {
        let vc = SignInScreen()
        navigationController?.pushViewController(vc, animated: true)

    }
    
    func acceptDidTapped(view: LocationPage) {
        navigationController?.pushViewController(view, animated: true)
    }
    
    @objc private func eyeDidTappedOnPass() {

        if passTextField.isSecureTextEntry {
            securityTextFieldSignUp.setImage(UIImage(named: "eye-solid")?.withTintColor(UIColor(named: "Aux4") ?? UIColor.gray), for: .normal)
            passTextField.isSecureTextEntry = false
        } else {
            securityTextFieldSignUp.setImage(UIImage(named: "eye-slash-solid")?.withTintColor(UIColor(named: "Aux2") ?? UIColor.gray), for: .normal)
            passTextField.isSecureTextEntry = true
        }
    }
    
    @objc private func eyeDidTappedOnConfirmPass() {

        if confirmPassTextField.isSecureTextEntry {
            securityTextFieldSignUpII.setImage(UIImage(named: "eye-solid")?.withTintColor(UIColor(named: "Aux4") ?? UIColor.gray), for: .normal)
            confirmPassTextField.isSecureTextEntry = false
        } else {
            securityTextFieldSignUpII.setImage(UIImage(named: "eye-slash-solid")?.withTintColor(UIColor(named: "Aux2") ?? UIColor.gray), for: .normal)
            confirmPassTextField.isSecureTextEntry = true
        }
    }
}

//MARK: TextField Delegates
extension SignUpScreen: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            emailTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            passTextField.becomeFirstResponder()
        } else if textField == passTextField {
            confirmPassTextField.becomeFirstResponder()
        } else if textField == confirmPassTextField {
            if let text = textField.text, !text.isEmpty {
                registerButton.isEnabled = true
                registerButton.backgroundColor = UIColor(named: "Blue3")
                confirmPassTextField.resignFirstResponder()
            } else {
                confirmPassTextField.resignFirstResponder()
            }
            
        }
        return true
    }
    
}
