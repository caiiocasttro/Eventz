//
//  SignInScreen.swift
//  Eventz
//
//  Created by Caio Chaves on 01.06.23.
//

import SafariServices
import UIKit

class SignInScreen: UIViewController {

    //MARK: Initializers
    lazy var reusableButtons = ReusableButtons()
    
    lazy var reusableFunctions = ReusableFunctions()

    lazy var emailTextField = textFieldCustom()
    
    public lazy var passTextField = textFieldCustom()
    
    lazy var securityTextFieldSignIn = securityTextFieldButton()
    
    lazy var signInButton = customGenericButton()
    
    //MARK: Properties
    private lazy var labelSignIn: UILabel = {
       let label = UILabel()
        label.text = "Sign In"
        label.textColor = UIColor(named: "Aux9")
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        return label
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let labelButton = UIButton()
        labelButton.frame = CGRect(x: 0, y: 0, width: 118, height: 15)
        labelButton.setTitle("Forgot password?", for: .normal)
        labelButton.setTitleColor(UIColor(named: "Aux5"), for: .normal)
        labelButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        return labelButton
    }()
    
    private lazy var orContinueWith: UILabel = {
       let label = UILabel()
        label.text = "Or Continue With"
        label.textColor = UIColor(named: "Aux3")
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    
    private lazy var logInFacebook: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        button.setBackgroundImage(UIImage(named:"FacebookV2"), for: .normal)
        button.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.cornerRadius = 25
        button.clipsToBounds = false
        return button
    }()
    
    private lazy var logInGoogle: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        button.setBackgroundImage(UIImage(named:"GoogleV2"), for: .normal)
        button.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.cornerRadius = 25
        button.clipsToBounds = false
        return button
    }()
    
    private lazy var logInApple: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        button.setBackgroundImage(UIImage(named:"AppleV2"), for: .normal)
        button.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.cornerRadius = 25
        button.clipsToBounds = false
        return button
    }()
    
    private lazy var noAccount: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 187, height: 20)
        button.setTitle("Don't have an account yet? Sign Up", for: .normal)
        button.setTitleColor(UIColor(named: "Aux4"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        return button
    }()

    //MARK: Page Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "WallpaperThree")!)
        
        configureLayout()
        emailTextField.delegate = self
        passTextField.delegate = self
        
        
}
    //MARK: Component's configuration
    private func configureComponents() {
        
        //Email TextField
        emailTextField.placeholder = "Your email"
        emailTextField.rightViewMode = .always
        
        //Security TextField button
        securityTextFieldSignIn.setImage(UIImage(named: "eye-slash-solid")?.withTintColor(UIColor(named: "Aux2") ?? UIColor.gray), for: .normal)
        
        //Password TextField
        passTextField.placeholder = "Password"
        passTextField.rightViewMode = .always
        passTextField.rightView = securityTextFieldSignIn
        passTextField.isSecureTextEntry = true
        
        //Sign in button
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.backgroundColor = UIColor(named: "Pink8")
        signInButton.isEnabled = false
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
            
        // Layout's image
        let logo = UIImageView(image: UIImage(named: "Eventz40"))
        let lineLeft = UIImageView(image: UIImage(named: "LineLeft"))
        let lineRight = UIImageView(image: UIImage(named: "LineRight"))
        
        // Adding subviews
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(logo)
        view.addSubview(labelSignIn)
        view.addSubview(emailTextField)
        view.addSubview(passTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(signInButton)
        view.addSubview(lineLeft)
        view.addSubview(lineRight)
        view.addSubview(orContinueWith)
        view.addSubview(logInFacebook)
        view.addSubview(logInGoogle)
        view.addSubview(logInApple)
        view.addSubview(noAccount)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        labelSignIn.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        lineLeft.translatesAutoresizingMaskIntoConstraints = false
        lineRight.translatesAutoresizingMaskIntoConstraints = false
        orContinueWith.translatesAutoresizingMaskIntoConstraints = false
        logInFacebook.translatesAutoresizingMaskIntoConstraints = false
        logInGoogle.translatesAutoresizingMaskIntoConstraints = false
        logInApple.translatesAutoresizingMaskIntoConstraints = false
        noAccount.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //Logo
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 84),
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            logo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            
            //Sign In Label
            labelSignIn.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 140),
            labelSignIn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Email TextField
            emailTextField.topAnchor.constraint(equalTo: labelSignIn.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            //Password TextField
            passTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passTextField.heightAnchor.constraint(equalToConstant: 50),
            
            //Forget password
            forgotPasswordButton.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 0),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            //Sign In Button
            signInButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 30),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            
            //Line Left
            lineLeft.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 60),
            lineLeft.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Or Continue With
            orContinueWith.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 54),
            orContinueWith.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Line Right
            lineRight.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 60),
            lineRight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            //Log In with Facebook
            logInFacebook.topAnchor.constraint(equalTo: orContinueWith.bottomAnchor, constant: 30),
            logInFacebook.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 85),
            
            //Log In with Google
            logInGoogle.topAnchor.constraint(equalTo: orContinueWith.bottomAnchor, constant: 30),
            logInGoogle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Log In with Apple
            logInApple.topAnchor.constraint(equalTo: orContinueWith.bottomAnchor, constant: 30),
            logInApple.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -85),
            
            //No Account
            noAccount.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34),
            noAccount.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
        // Adding button's target
        forgotPasswordButton.addTarget(self, action: #selector(forgetPasswordDidTapped), for: .touchUpInside)
        securityTextFieldSignIn.addTarget(self, action: #selector(eyeDidTappedOnPass), for: .touchUpInside)
        noAccount.addTarget(self, action: #selector(noAccountTapped), for: .touchUpInside)
        logInFacebook.addTarget(self, action: #selector(facebookLogDidTapped), for: .touchUpInside)
        logInGoogle.addTarget(self, action: #selector(googleDidTapped), for: .touchUpInside)
        logInApple.addTarget(self, action: #selector(appleLogDidTapped), for: .touchUpInside)
        
    }
    
    //MARK: Button's action
    @objc private func eyeDidTappedOnPass() {

        if passTextField.isSecureTextEntry {
            securityTextFieldSignIn.setImage(UIImage(named: "eye-solid")?.withTintColor(UIColor(named: "Aux4") ?? UIColor.gray), for: .normal)
            passTextField.isSecureTextEntry = false
        } else {
            securityTextFieldSignIn.setImage(UIImage(named: "eye-slash-solid")?.withTintColor(UIColor(named: "Aux2") ?? UIColor.gray), for: .normal)
            passTextField.isSecureTextEntry = true
        }
    }

    @objc private func forgetPasswordDidTapped() {
        let vc = ResetPassword()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func signInDidTapped() {
        
    }
    
    @objc private func noAccountTapped() {
        emailTextField.resignFirstResponder()
        passTextField.resignFirstResponder()
        let vc = SignUpScreen()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func facebookLogDidTapped() {
        guard let url = URL(string: "https://m.facebook.com/login/?refsrc=deprecated") else { return }
                let vc = SFSafariViewController(url: url)
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true)
    }
    
    @objc private func googleDidTapped() {
        guard let url = URL(string: "https://accounts.google.com/v3/signin/identifier?dsh=S637722751%3A1686324081992191&continue=https%3A%2F%2Fmyaccount.google.com%3Futm_source%3Daccount-marketing-page%26utm_medium%3Dgo-to-account-button&ffgf=1&ifkv=Af_xneHBdSSaoNeqp8nrz4nTsLyxjd7anQQDnJMDb39iCIdsSv6kzAwaCYHqgC2lk8jkrbdqw3SbQw&service=accountsettings&flowName=GlifWebSignIn&flowEntry=ServiceLogin") else { return }
        
        let vc = SFSafariViewController(url: url)
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true)
        
    }
    
    @objc private func appleLogDidTapped() {
        
    }

}

//MARK: TextField Delegates
extension SignInScreen: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField {
            passTextField.becomeFirstResponder()
            textField.returnKeyType = .done
        } else if textField == passTextField {
                passTextField.resignFirstResponder()
            if let text = textField.text, !text.isEmpty {
                signInButton.isEnabled = true
                signInButton.backgroundColor = UIColor(named: "Pink3")
                passTextField.resignFirstResponder()
            }
        }
        
        return true
    }
}
