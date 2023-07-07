//
//  EventPage.swift
//  Eventz
//
//  Created by Caio Chaves on 27.06.23.
//

import UIKit
import MapKit
import CoreLocation

class EventPage: UIViewController {
    
    //MARK: Initializer
    var reusableFunctions = ReusableFunctions()
    
    var location = CLLocationManager()
    
    private var cellIdentifier = "reviewsCell"
    
    var collectionView: UICollectionView!
    
    var reviewModel = reviewsModel()
    
    //MARK: Properties
    var image: String? {
        didSet {
            guard let image = image else { return }
            
            eventImage.image = UIImage(named: image)
        }
    }
    
    private var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    private var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Principal6")
        return view
    }()
    
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
        viewAll.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
        viewAll.setTitleColor(UIColor(named: "Aux4"), for: .normal)
        return viewAll
    }()
    
    //MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScroll()
        
        collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: contentView.frame.width, height: 320), collectionViewLayout: configureCollectionView())
        
        collectionView.delegate = self
        
        collectionView.dataSource = self
        
        collectionView.register(reviewsCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        configureLayout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        navigationController?.navigationBar.barTintColor = .none
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: Configuring ScrollView
    private func configureScroll() {
        
        //Adding subviews
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Adding constraints
        NSLayoutConstraint.activate([
        
            //Scroll View
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: -95),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 40),
            
            //Content View
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1)
        ])
        
    }
    
   //MARK: Configuring layout
    private func configureLayout() {
        let locationIcon = UIImageView(image: UIImage(named: "map-pin-resized")?.withTintColor(UIColor(named: "Aux9") ?? UIColor.gray))
        let calendarIcon = UIImageView(image: UIImage(named: "calendar-resized")?.withTintColor(UIColor(named: "Aux9") ?? UIColor.gray))
        
        //Setting the back button color
        navigationController?.navigationBar.tintColor = UIColor(named: "Principal6")
    

        
        //Adding subview
        contentView.addSubview(eventImage)
        contentView.addSubview(eventLabel)
        contentView.addSubview(heartButton)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(descriptionBody)
        contentView.addSubview(locationIcon)
        contentView.addSubview(calendarIcon)
        contentView.addSubview(cityName)
        contentView.addSubview(dateLabel)
        contentView.addSubview(mapLabel)
        contentView.addSubview(mapShadow)
        mapShadow.addSubview(mapView)
        contentView.addSubview(reviewsLabel)
        contentView.addSubview(viewAll)
        contentView.addSubview(collectionView)
        
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
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        


        
        //Adding constraints
        NSLayoutConstraint.activate([
            
            //Event Image
            eventImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            eventImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eventImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            eventImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -700),
            
            //Event label
            eventLabel.topAnchor.constraint(equalTo: eventImage.bottomAnchor, constant: 10),
            eventLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            //Heart button
            heartButton.topAnchor.constraint(equalTo: eventImage.bottomAnchor, constant: 10),
            heartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            //Description Label
            descriptionLabel.topAnchor.constraint(equalTo: eventLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            //Description body
            descriptionBody.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            descriptionBody.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionBody.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            //Location Icon
            locationIcon.topAnchor.constraint(equalTo: descriptionBody.bottomAnchor, constant: 20),
            locationIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            //City name
            cityName.centerYAnchor.constraint(equalTo: locationIcon.centerYAnchor),
            cityName.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 5),
            
            //Calendar Icon
            calendarIcon.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 5),
            calendarIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            //Date
            dateLabel.centerYAnchor.constraint(equalTo: calendarIcon.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: calendarIcon.trailingAnchor, constant: 5),
            
            //Map label
            mapLabel.topAnchor.constraint(equalTo: calendarIcon.bottomAnchor, constant: 20),
            mapLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            //Map shadow
            mapShadow.topAnchor.constraint(equalTo: mapLabel.bottomAnchor, constant: 10),
            mapShadow.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mapShadow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            mapShadow.heightAnchor.constraint(equalToConstant: 150),
            
            //Map View
            mapView.topAnchor.constraint(equalTo: mapLabel.bottomAnchor, constant: 10),
            mapView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mapView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            mapView.heightAnchor.constraint(equalTo: mapShadow.heightAnchor),
            
            //Review label
            reviewsLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 20),
            reviewsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            //View all
            viewAll.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 20),
            viewAll.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            //Collection View
//            collectionView.topAnchor.constraint(equalTo: reviewsLabel.bottomAnchor, constant: 10)
            
            
            
            

        ])
        
        //Reusable functions
        reusableFunctions.settingShadow(object: eventImage)
        
        reusableFunctions.settingShadow(object: customBackground)
        
        reusableFunctions.settingShadow(object: mapShadow)
        
        //Calling map function
        settingLocation()
    }
    
    //MARK: Configuring collectionView
    private func configureCollectionView() -> UICollectionViewCompositionalLayout {
        
        //Item
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        //Group
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(315)), subitems: [item])
        //Section
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    //MARK: Map function
    private func settingLocation() {
        
        //Ignoring user interaction
        view.isUserInteractionEnabled = false
        
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
            self.view.isUserInteractionEnabled = true
            
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
    
}

//MARK: UICollectionView Delegate and DataSource
extension EventPage: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewModel.title.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! reviewsCell
        cell.title = reviewModel.title[indexPath.row]
        return cell
        
    }
    
    
    
}
