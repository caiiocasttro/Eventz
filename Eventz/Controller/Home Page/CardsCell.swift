//
//  CardsCell.swift
//  Eventz
//
//  Created by Caio Chaves on 22.06.23.
//

import UIKit

class CardsCell: UICollectionViewCell {
    
    //MARK: Initializers
    let reusableFunctions = ReusableFunctions()
    
    var favoriteModel = FavoriteCardsModel()
    
    //MARK: Properties
    var image: String? {
        didSet {
            guard let image = image else { return }
            card.image = UIImage(named: image)
        }
    }
    
    var labels: String? {
        didSet {
            guard let string = labels else { return }
            cardLabel.text = string
        }
    }
    
    var cities: String? {
        didSet {
            guard let string = cities else { return }
            cityName.text = string
        }
    }
    
    var heartDidTappedAction: (() -> ())?
    
    private lazy var cardShadow: UIView = {
        let shadow = UIView()
        shadow.backgroundColor = .clear
        shadow.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        shadow.layer.shadowRadius = 4
        shadow.layer.shadowOpacity = 0.5
        shadow.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadow.layer.cornerRadius = 25
        return shadow
    }()
    
    private lazy var card: UIImageView = {
        let card = UIImageView()
        card.frame = CGRect(x: 0, y: 0, width: 350, height: 570)
        card.image = UIImage(named: "concert")
        card.contentMode = .scaleAspectFill
        card.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        card.layer.shadowRadius = 4
        card.layer.shadowOpacity = 0.5
        card.layer.shadowOffset = CGSize(width: 0, height: 0)
        card.layer.cornerRadius = 15
        card.layer.masksToBounds = true
        return card
    }()
    
    private lazy var cardLabel: UILabel = {
        let label = UILabel()
        label.text = "Paléo Festival"
        label.font = .systemFont(ofSize: 24, weight: .heavy)
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var cityName: UILabel = {
        let label = UILabel()
        label.text = "Montreuax, Switzerland"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Sept 15 • 22pm"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet consectetur. Dictum enim sem blandit massa tempor amet. Volutpat at gravida nibh mattis. Rhoncus venenatis in a tristique. Vel viverra sapien sit pellentesque sapien augue tortor condimentum. Eros vitae ipsum eget consectetur pulvinar suspendisse egestas. "
        label.font = .systemFont(ofSize: 10, weight: .heavy)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    public lazy var heartButton: UIButton = {
        let button = UIButton()
        button.frame = .init(x: 0, y: 0, width: 30, height: 30)
        button.setImage(UIImage(named: "heart" ), for: .normal)
        return button
    }()
    
    public lazy var imageFilter: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Filter40")
        image.layer.cornerRadius = 15
        image.layer.masksToBounds = true
        return image
    }()
    
    
    //MARK: Page lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        
        
        let locationIcon = UIImageView(image: UIImage(named: "map-pin-solid")?.withTintColor(UIColor.white))
        locationIcon.frame = .init(x: 0, y: 0, width: 15, height: 15)
        
        let calendarIcon = UIImageView(image: UIImage(named: "calendar-solid")?.withTintColor(UIColor.white))
        calendarIcon.frame = .init(x: 0, y: 0, width: 15, height: 15)
        
        heartButton.isEnabled = true
        
        //Adding subview
        addSubview(cardShadow)
        cardShadow.addSubview(card)
        card.addSubview(imageFilter)
        imageFilter.addSubview(cardLabel)
        imageFilter.addSubview(heartButton)
        imageFilter.addSubview(locationIcon)
        imageFilter.addSubview(calendarIcon)
        imageFilter.addSubview(cityName)
        imageFilter.addSubview(dateLabel)
        imageFilter.addSubview(descriptionLabel)
        
        card.translatesAutoresizingMaskIntoConstraints = false
        imageFilter.translatesAutoresizingMaskIntoConstraints = false
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        calendarIcon.translatesAutoresizingMaskIntoConstraints = false
        cityName.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraints
        
        NSLayoutConstraint.activate([
            
            //Card Shadow
            cardShadow.topAnchor.constraint(equalTo: topAnchor, constant: -2),
            cardShadow.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 2),
            cardShadow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            cardShadow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            
            //Card constraints
            card.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            card.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            card.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            card.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            //Image Filter
            imageFilter.topAnchor.constraint(equalTo: card.topAnchor, constant: 0),
            imageFilter.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: 0),
            imageFilter.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 0),
            imageFilter.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: 0),
            
            //Card label
            cardLabel.topAnchor.constraint(equalTo: imageFilter.topAnchor, constant: 20),
            cardLabel.leadingAnchor.constraint(equalTo: imageFilter.leadingAnchor, constant: 20),
            
            //Heart button
            heartButton.topAnchor.constraint(equalTo: imageFilter.topAnchor, constant: 20),
            heartButton.trailingAnchor.constraint(equalTo: imageFilter.trailingAnchor, constant: -20),
            
            //Location icon
            locationIcon.topAnchor.constraint(equalTo: cardLabel.bottomAnchor, constant: 10),
            locationIcon.leadingAnchor.constraint(equalTo: imageFilter.leadingAnchor, constant: 20),
            
            //City name
            cityName.centerYAnchor.constraint(equalTo: locationIcon.centerYAnchor),
            cityName.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 5),
            
            //Calendar icon
            calendarIcon.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 2),
            calendarIcon.leadingAnchor.constraint(equalTo: imageFilter.leadingAnchor, constant: 20),
            
            //Date label
            dateLabel.centerYAnchor.constraint(equalTo: calendarIcon.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: calendarIcon.trailingAnchor, constant: 5),
            
            //Description
            descriptionLabel.leadingAnchor.constraint(equalTo: imageFilter.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: imageFilter.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: imageFilter.bottomAnchor, constant: -20)
        
        ])
        
        //Button target
        heartButton.addTarget(self, action: #selector(heartDidTapped), for: .touchUpInside)
        
    }
    
    //MARK: Buttons action
    
    @objc public func heartDidTapped() {
        
        heartDidTappedAction?()
        
    }
    
    
}
