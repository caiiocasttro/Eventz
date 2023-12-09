//
//  MiniCardsCell.swift
//  Eventz
//
//  Created by Caio Chaves on 02.07.23.
//

import UIKit
/**
 `MiniCardsCell` is a custom `UICollectionViewCell` for displaying mini cards of event.

 ## Properties

 - `image`: A string representing the image name for the card's background. Setting this property updates the card's background image.
 - `eventName`: A string representing the name of the event. Setting this property updates the event label.
 - `city`: A string representing the city where the event is located. Setting this property updates the city name label.

 ## Subviews

 - `cardShadow`: A UIView providing a shadow effect for the card.
 - `card`: An UIImageView representing the main card containing event details and background image.
 - `heartButton`: A UIButton for liking the event.
 - `eventLabel`: A UILabel displaying the name of the event.
 - `locationIcon`: An UIImageView displaying a map pin icon.
 - `calendarIcon`: An UIImageView displaying a calendar icon.
 - `cityName`: A UILabel displaying the name of the city where the event is located.
 - `dateLabel`: A UILabel displaying the date and time of the event.

 ## Initializer

 - `init(frame:)`: Initializes an instance of `MiniCardsCell` with the given frame.

 ## Methods

 - `configureLayout()`: Configures the layout of subviews and adds necessary constraints.

 ## Usage Example

 ```
 let cell = MiniCardsCell()
 cell.image = "concert"
 cell.eventName = "Paléo festival"
 cell.city = "Nyon, Switzerland"
 // Add the cell to your collection view
 ```
 ## Note

 - Ensure that the images referenced by `image`, `heartButton`, `locationIcon`, and `calendarIcon exist in the app's asset catalog.
 - The class assumes that the required color, font, and other assets are defined in the app's asset catalog or code.
 - Adjust the constraints or add additional customization as needed for your specific design.
 */
class MiniCardsCell: UICollectionViewCell {
    
    //MARK: Initializer
    
    //MARK: Proprieties
    var image: String? {
        didSet {
            guard let string = image else { return }
            card.image = UIImage(named: string)
        }
    }
    
    var eventName: String? {
        didSet {
            guard let string = eventName else { return }
            eventLabel.text = string
        }
    }
    
    var city: String? {
        didSet {
            guard let string = city else { return }
            cityName.text = string
        }
    }
    
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
        let filter = UIImageView()
        filter.frame = CGRect(x: 0, y: 0, width: 720, height: 1080)
        filter.image = UIImage(named: "Filter40")
        filter.contentMode = .scaleAspectFill
        filter.layer.cornerRadius = 15
        filter.clipsToBounds = true
        
        
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 350, height: 150)
        image.image = UIImage(named: "concert")
        image.layer.cornerRadius = 15
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.addSubview(filter)
        return image
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        button.setImage(UIImage(named: "Heart24-fill"), for: .normal)
        return button
    }()
    
    private lazy var eventLabel: UILabel = {
        let label = UILabel()
        label.text = "Paléo festival"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor(named: "Principal1")
        return label
    }()
    
    private lazy var locationIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "map12-pin-solid")?.withTintColor(UIColor(named: "Principal1") ?? UIColor.gray)
        return image
    }()
    
    private lazy var calendarIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "calendar12-solid")?.withTintColor(UIColor(named: "Principal1") ?? UIColor.gray)
        return image
    }()
    
    private lazy var cityName: UILabel = {
        let label = UILabel()
        label.text = "Nyon, Switzerland"
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor(named: "Principal1")
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Sept 15 • 22pm"
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor(named: "Principal1")
        return label
    }()
    
    //MARK: Page lifecycle
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        
        //Adding subview
        addSubview(cardShadow)
        cardShadow.addSubview(card)
        card.addSubview(heartButton)
        card.addSubview(eventLabel)
        card.addSubview(locationIcon)
        card.addSubview(calendarIcon)
        card.addSubview(cityName)
        card.addSubview(dateLabel)
        
        cardShadow.translatesAutoresizingMaskIntoConstraints = false
        card.translatesAutoresizingMaskIntoConstraints = false
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        eventLabel.translatesAutoresizingMaskIntoConstraints = false
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        calendarIcon.translatesAutoresizingMaskIntoConstraints = false
        cityName.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraints
        NSLayoutConstraint.activate([
        
            //Card`s shadow
            cardShadow.topAnchor.constraint(equalTo: topAnchor),
            cardShadow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardShadow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cardShadow.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            //Card
            card.topAnchor.constraint(equalTo: topAnchor),
            card.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            card.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            card.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            //HeartButton
            heartButton.topAnchor.constraint(equalTo: card.topAnchor, constant: 10),
            heartButton.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -10),
            
            //Event label
            eventLabel.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -40),
            eventLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 10),
            
            //Location icon
            locationIcon.topAnchor.constraint(equalTo: eventLabel.bottomAnchor, constant: 5),
            locationIcon.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 10),
            
            //City name
            cityName.centerYAnchor.constraint(equalTo: locationIcon.centerYAnchor),
            cityName.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 5),
            
            //Calendar icon
            calendarIcon.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 5),
            calendarIcon.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 10),
            
            //Date
            dateLabel.centerYAnchor.constraint(equalTo: calendarIcon.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: calendarIcon.trailingAnchor, constant: 5)
            
        ])
        
    }
    
}
