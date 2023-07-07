//
//  TermsOfConditions.swift
//  Eventz
//
//  Created by Caio Chaves on 07.06.23.
//

import UIKit



class TermsOfConditions: UIViewController {
    
    //MARK: Properties
    private lazy var termsOfConditionslabel: UILabel = {
      let label = UILabel()
        label.text = "Terms of conditions"
        label.textColor = UIColor(named: "Aux9")
        label.font = .systemFont(ofSize: 24, weight: .heavy)
        return label
    }()
    
    private lazy var termsText: UILabel = {
       let text = UILabel()
        text.text = "By signing up or logging in I accept the Eventz Terms of Service and have read the Privacy Policy."
        text.font = .systemFont(ofSize: 14, weight: .medium)
        text.textColor = UIColor(named: "Aux6")
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()
    
    private lazy var acceptButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor(named: "Blue3")
        button.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.setTitle("Accept", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .heavy)
        button.layer.cornerRadius = 25
        button.clipsToBounds = false
        return button
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 46, height: 18)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor(named: "Aux8"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .heavy)
        return button
    }()
    
    var delegate: TermsOfConditionsDelegate?

    //MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Principal6")
        configureLayout()
    }
    
//MARK: Configuring layout
    private func configureLayout() {
        
        //Adding subview
        view.addSubview(termsOfConditionslabel)
        view.addSubview(termsText)
        view.addSubview(acceptButton)
        view.addSubview(cancelButton)
        
        termsOfConditionslabel.translatesAutoresizingMaskIntoConstraints = false
        termsText.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraints
        NSLayoutConstraint.activate([
            //Terms of conditions label
            termsOfConditionslabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            termsOfConditionslabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Terms of conditions text
            termsText.topAnchor.constraint(equalTo: termsOfConditionslabel.bottomAnchor, constant: 50),
            termsText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            termsText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            //Accept button
            acceptButton.topAnchor.constraint(equalTo: termsText.bottomAnchor, constant: 50),
            acceptButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 125),
            acceptButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -125),
            acceptButton.heightAnchor.constraint(equalToConstant: 50),
            
            //Cancel button
            cancelButton.topAnchor.constraint(equalTo: acceptButton.bottomAnchor, constant: 30),
            cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        //Adding button target
        acceptButton.addTarget(self, action: #selector(acceptTermsDidTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonDidTapped), for: .touchUpInside)
        
    }
    
    //MARK: Button action
    @objc private func cancelButtonDidTapped() {
        dismiss(animated: true)
    }
    
    @objc private func acceptTermsDidTapped() {
        dismiss(animated: true)
        delegate?.acceptDidTapped(view: LocationPage())
    }

}
