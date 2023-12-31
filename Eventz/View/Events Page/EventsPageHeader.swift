//
//  EventPageHeader.swift
//  Eventz
//
//  Created by Caio Chaves on 29.06.23.
//

import UIKit
import MapKit
import CoreLocation
/**
 `EventsPageHeader` is a custom `UICollectionReusableView` representing the header view for an events page in a UICollectionView.
 It displays information about an event, including an image, event name, location, date, and a description. Users can also mark the event as a favorite using a heart button.

 ## Properties
 - `shadow`: An instance of `ReusableFunctions` for handling reusable functions and settings.
 - `location`: An instance of `CLLocationManager` for handling location-related functionalities.
 - `favoriteModel`: An instance of `FavoriteCardsModel` for managing favorite events.

 ### Display Properties
 - `image`: The image name representing the event.
 - `name`: The name of the event.
 - `city`: The city where the event is located.
 - `date`: The date of the event.
 - `buttonSelected`: A boolean indicating whether the heart button is selected.

 ### UI Components
 - `eventImage`: An image view displaying the event's image.
 - `customBackground`: A background view with rounded corners.
 - `eventLabel`: A label displaying the event's name.
 - `heartButton`: A button for marking the event as a favorite.
 - `descriptionLabel`: A label indicating the start of the event description section.
 - `descriptionBody`: A label displaying the description of the event.
 - `cityName`: A label displaying the city where the event is located.
 - `dateLabel`: A label displaying the date of the event.
 - `mapLabel`: A label indicating the start of the map section.
 - `mapShadow`: A view providing a shadow effect for the map.
 - `mapView`: An MKMapView displaying the location of the event on the map.
 - `reviewsLabel`: A label indicating the start of the reviews section.
 - `viewAll`: A button for viewing all reviews.

 ## Methods
 - `init(frame:)`: Initializes the `EventsPageHeader` with a given frame.
 - `configureLayout()`: Configures the layout of the header view by adding subviews and setting constraints.
 - `settingLocation()`: Sets up the location-related functionality, including displaying the event's location on the map.
 - `heartDidTapped()`: Handles the action when the heart button is tapped, toggling its selection state.

 ## Usage
 ```
 let header = EventsPageHeader(frame: CGRect(x: 0, y: 0, width: collectionView.frame.width, height: 500))
 collectionView.addSubview(header)
 ```
 - Note: Make sure to provide appropriate image names and resources for the heart button and other UI components.
 */
class EventsPageHeader: UICollectionReusableView {
    
    //MARK: Initializer
    var shadow = ReusableFunctions()
    
    var location = CLLocationManager()
    
    //MARK: Properties
    var image: String? {
        didSet {
            guard let image = image else { return }
            
            eventImage.image = UIImage(named: image)
        }
    }
    
    var name: String? {
        didSet {
            guard let name = name else { return }
            
            eventLabel.text = name
        }
    }
    
    var city: String? {
        didSet {
            guard let city = city else { return }
            
            cityName.text = city
        }
    }
    
    var date: String? {
        didSet {
            guard let date = date else { return }
            
            dateLabel.text = date
        }
    }
    
    var buttonSelected = false
    
    private lazy var eventImage: UIImageView = {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height - 500
        
        let filter = UIImageView(image: UIImage(named: "Filter40"))
        filter.contentMode = .scaleToFill
        
        let image = CustomImage(frame: .init(x: 0, y: 0, width: width, height: height))
        image.image = UIImage(named: "concert")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = false
        image.addSubview(filter)
        return image
    }()
    
    private lazy var customBackground: UIView = {
        let background = UIView()
        background.backgroundColor = UIColor(named: "Principal6")
        background.layer.cornerRadius = 30
        return background
    }()
    
    private lazy var eventLabel: UILabel = {
        let label = UILabel()
        label.text = "Paléo Festival"
        label.font = .systemFont(ofSize: 24, weight: .heavy)
        label.textColor = UIColor(named: "Aux9")
        return label
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = .init(x: 0, y: 0, width: 24, height: 24)
        button.setImage(UIImage(named: "heart-solid")?.withTintColor(UIColor(named: "Aux3") ?? UIColor.gray), for: .normal)
        return button
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(named: "Aux9")
        return label
    }()
    
    private lazy var descriptionBody: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet consectetur. Quis fames sed bibendum vitae massa amet hendrerit at. Mauris pretium sit lobortis tincidunt dictum tempor iaculis nisl ultrices. Massa scelerisque arcu at sollicitudin est massa quisque lacus. Sagittis pellentesque scelerisque orci aliquam donec ultrices. Non nullam gravida risus sed accumsan dolor est... "
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(named: "Aux5")
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var cityName: UILabel = {
        let label = UILabel()
        label.text = "Nyon, Switzerland"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(named: "Aux5")
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Sep 15 • 22pm"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(named: "Aux5")
        return label
    }()
    
    private lazy var mapLabel: UILabel = {
        let label = UILabel()
        label.text = "Map"
        label.font = .systemFont(ofSize: 16, weight: .heavy)
        label.textColor = UIColor(named: "Aux9")
        return label
    }()
    
    private lazy var mapShadow: UIView = {
        let shadow = UIView()
        shadow.backgroundColor = .clear
        return shadow
    }()
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.mapType = MKMapType.standard
        mapView.showsUserLocation = true
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = false
        mapView.layer.cornerRadius = 15
        mapView.clipsToBounds = true
        return mapView
    }()
    
    private lazy var reviewsLabel: UILabel = {
        let label = UILabel()
        label.text = "Reviews"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(named: "Aux9")
        return label
    }()
    
    private lazy var viewAll: UIButton = {
        let viewAll = UIButton(type: .custom)
        viewAll.setTitle("View All", for: .normal)
        viewAll.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        viewAll.setTitleColor(UIColor(named: "Aux4"), for: .normal)
        return viewAll
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configuring layout
     private func configureLayout() {
         let locationIcon = UIImageView(image: UIImage(named: "map-pin-resized")?.withTintColor(UIColor(named: "Aux9") ?? UIColor.gray))
         let calendarIcon = UIImageView(image: UIImage(named: "calendar-resized")?.withTintColor(UIColor(named: "Aux9") ?? UIColor.gray))
     

         
         //Adding subview
         addSubview(eventImage)
         addSubview(eventLabel)
         addSubview(heartButton)
         addSubview(descriptionLabel)
         addSubview(descriptionBody)
         addSubview(locationIcon)
         addSubview(calendarIcon)
         addSubview(cityName)
         addSubview(dateLabel)
         addSubview(mapLabel)
         addSubview(mapShadow)
         mapShadow.addSubview(mapView)
         addSubview(reviewsLabel)
         addSubview(viewAll)
         
         eventImage.translatesAutoresizingMaskIntoConstraints = false
         eventLabel.translatesAutoresizingMaskIntoConstraints = false
         heartButton.translatesAutoresizingMaskIntoConstraints = false
         descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
         descriptionBody.translatesAutoresizingMaskIntoConstraints = false
         locationIcon.translatesAutoresizingMaskIntoConstraints = false
         calendarIcon.translatesAutoresizingMaskIntoConstraints = false
         cityName.translatesAutoresizingMaskIntoConstraints = false
         dateLabel.translatesAutoresizingMaskIntoConstraints = false
         mapLabel.translatesAutoresizingMaskIntoConstraints = false
         mapShadow.translatesAutoresizingMaskIntoConstraints = false
         mapView.translatesAutoresizingMaskIntoConstraints = false
         reviewsLabel.translatesAutoresizingMaskIntoConstraints = false
         viewAll.translatesAutoresizingMaskIntoConstraints = false
         
         


         
         //Adding constraints
         NSLayoutConstraint.activate([
             
             //Event Image
             eventImage.topAnchor.constraint(equalTo: topAnchor, constant: -100),
             eventImage.leadingAnchor.constraint(equalTo: leadingAnchor),
             eventImage.trailingAnchor.constraint(equalTo: trailingAnchor),
             eventImage.heightAnchor.constraint(equalToConstant: 400),
             
             //Event label
             eventLabel.topAnchor.constraint(equalTo: eventImage.bottomAnchor, constant: 10),
             eventLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
             
             //Heart button
             heartButton.topAnchor.constraint(equalTo: eventImage.bottomAnchor, constant: 10),
             heartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
             
             //Description Label
             descriptionLabel.topAnchor.constraint(equalTo: eventLabel.bottomAnchor, constant: 20),
             descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
             descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
             
             //Description body
             descriptionBody.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
             descriptionBody.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
             descriptionBody.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
             
             //Location Icon
             locationIcon.topAnchor.constraint(equalTo: descriptionBody.bottomAnchor, constant: 20),
             locationIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
             
             //City name
             cityName.centerYAnchor.constraint(equalTo: locationIcon.centerYAnchor),
             cityName.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 5),
             
             //Calendar Icon
             calendarIcon.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 5),
             calendarIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
             
             //Date
             dateLabel.centerYAnchor.constraint(equalTo: calendarIcon.centerYAnchor),
             dateLabel.leadingAnchor.constraint(equalTo: calendarIcon.trailingAnchor, constant: 5),
             
             //Map label
             mapLabel.topAnchor.constraint(equalTo: calendarIcon.bottomAnchor, constant: 20),
             mapLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
             
             //Map shadow
             mapShadow.topAnchor.constraint(equalTo: mapLabel.bottomAnchor, constant: 10),
             mapShadow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
             mapShadow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
             mapShadow.heightAnchor.constraint(equalToConstant: 150),
             
             //Map View
             mapView.topAnchor.constraint(equalTo: mapLabel.bottomAnchor, constant: 10),
             mapView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
             mapView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
             mapView.heightAnchor.constraint(equalTo: mapShadow.heightAnchor),
             
             //Review label
             reviewsLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 20),
             reviewsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
             
             //View all
             viewAll.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 20),
             viewAll.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
         ])
         
         //Reusable functions
         shadow.settingShadow(object: eventImage)
         
         shadow.settingShadow(object: customBackground)
         
         shadow.settingShadow(object: mapShadow)
         
         
         //Calling map function
         settingLocation()
         
         
         //Button target
         heartButton.addTarget(self, action: #selector(heartDidTapped), for: .touchUpInside)
     }
    
    //MARK: Map function
    private func settingLocation() {
        
        //Ignoring user interaction
        isUserInteractionEnabled = false
        
        //Activity indicator
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .medium
        activityIndicator.center = mapView.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        //Adding subview to mapView
        mapView.addSubview(activityIndicator)
        
        //Creating request
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = cityName.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (response, error) in
            
            //Stopping activity animation
            activityIndicator.stopAnimating()
            self.isUserInteractionEnabled = true
            
            if response == nil {
                print("Error trying to find response")
            } else {
                
                // Remove annotation
                let annotations = self.mapView.annotations
                self.mapView.removeAnnotations(annotations)
                
                    //Getting data
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                
                //Creatting annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.cityName.text
                annotation.coordinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
                self.mapView.addAnnotation(annotation)
                
                //Zooming location
                let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                self.mapView.setRegion(region, animated: true)
                
            }
        }
    }
    
    //MARK: Button action
    @objc private func heartDidTapped() {
        
        heartButtonAnimation()
        
        self.buttonSelected = !self.buttonSelected

        if buttonSelected {
            heartButton.setImage(UIImage(named: "heart-solid")?.withTintColor(UIColor(named: "HeartColor") ?? UIColor.gray), for: .normal)
            CardsModel.favoriteEvents.append(image!)
        } else {
            heartButton.setImage(UIImage(named: "heart-solid")?.withTintColor(UIColor(named: "Aux3") ?? UIColor.gray), for: .normal)
            CardsModel.favoriteEvents.removeAll { $0 == image! }
        }
    }
    
    func checkingHeartButtonStatus() {
        
        if CardsModel.favoriteEvents.contains(image!) {
            self.buttonSelected = true
        }
        
    }
    
    //MARK: Animation
    func heartButtonAnimation() {
        
        heartButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.1, options: [.curveLinear]) {
            self.heartButton.transform = .identity
        }
        
    }
    
}
