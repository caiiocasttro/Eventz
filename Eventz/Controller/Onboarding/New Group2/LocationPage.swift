//
//  LocationPage.swift
//  Eventz
//
//  Created by Caio Chaves on 07.06.23.
//

import UIKit
import MapKit
import CoreLocation

class LocationPage: UIViewController {
    
    //MARK: Initializers
    private lazy var location = CLLocationManager()
    
//MARK: Properties
    private lazy var steps: UILabel = {
        let label = UILabel()
        label.text = "2 of 2"
        label.textColor = UIColor(named: "Aux10")
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()

    private lazy var locationPageLabel: UILabel = {
        let label = UILabel()
        label.text = "Tell us your city"
        label.textColor = UIColor(named: "Aux10")
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        return label
    }()
    
    private lazy var locationTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        textField.layer.shadowRadius = 4
        textField.layer.shadowOpacity = 0.5
        textField.layer.shadowOffset = CGSize(width: 0, height: 0)
        textField.placeholder = "Your city"
        textField.font = .systemFont(ofSize: 14)
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        textField.layer.cornerRadius = 25
        textField.clipsToBounds = false
        textField.returnKeyType = .search
        return textField
    }()
    
    private lazy var locationIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "map-pin-solid")
        image.tintColor = UIColor(named: "Aux8") ?? UIColor.black
        image.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return image
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Your current location"
        label.textColor = UIColor(named: "Aux5")
        label.font = .systemFont(ofSize: 14, weight: .heavy)
        return label
    }()
    
    private lazy var mapShadow: UIView = {
        let shadow = UIView()
        shadow.backgroundColor = .clear
        shadow.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        shadow.layer.shadowRadius = 4
        shadow.layer.shadowOpacity = 0.5
        shadow.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadow.layer.cornerRadius = 25
        return shadow
    }()
    
    private lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.mapType = MKMapType.standard
        map.showsUserLocation = true
        map.isZoomEnabled = true
        map.isScrollEnabled = true
        map.layer.cornerRadius = 25
        map.clipsToBounds = true
        return map
        
        
        
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "Pink3")
        button.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .heavy)
        button.layer.cornerRadius = 25
        button.clipsToBounds = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        location.requestWhenInUseAuthorization()
        location.delegate = self
        locationTextField.delegate = self
        
    }
 
    //MARK: Configuring layout
    private func configureLayout() {
        //Setting the back button color
        navigationController?.navigationBar.tintColor = UIColor(named: "Aux9")
        
        //Setting the background
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        backgroundImageView.image = UIImage(named: "WallpaperTwo")
        backgroundImageView.contentMode = .scaleToFill
        

        
        // Adding subviews
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(steps)
        view.addSubview(locationPageLabel)
        view.addSubview(locationTextField)
        view.addSubview(locationIcon)
        view.addSubview(locationLabel)
        view.addSubview(mapShadow)
        mapShadow.addSubview(mapView)
        view.addSubview(continueButton)
        
        steps.translatesAutoresizingMaskIntoConstraints = false
        locationPageLabel.translatesAutoresizingMaskIntoConstraints = false
        locationTextField.translatesAutoresizingMaskIntoConstraints = false
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapShadow.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraints
        NSLayoutConstraint.activate([
        
            //Steps
            steps.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            steps.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            //Page's label
            locationPageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            locationPageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Location TextField
            locationTextField.topAnchor.constraint(equalTo: locationPageLabel.bottomAnchor, constant: 10),
            locationTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            locationTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            locationTextField.heightAnchor.constraint(equalToConstant: 50),
            
            //Location Image
            locationIcon.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 5),
            locationIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Location Label
            locationLabel.centerYAnchor.constraint(equalTo: locationIcon.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 5),
            
            //MapShadow
            mapShadow.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 40),
            mapShadow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mapShadow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mapShadow.heightAnchor.constraint(equalToConstant: 200),
            
            //MapView
            mapView.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 40),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mapView.heightAnchor.constraint(equalTo: mapShadow.heightAnchor),
            
            //Continue button
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //Adding button target
        continueButton.addTarget(self, action: #selector(continueDidTapped), for: .touchUpInside)
        
    }
    
//    @objc private func continueDidTapped() {
//        let layout = UICollectionViewFlowLayout()
//        let vc = InterestsPage(collectionViewLayout: layout)
//
//        navigationController?.pushViewController(vc, animated: true)
//    }
    
    @objc private func continueDidTapped() {
        let vc = WelcomePage()
        
        navigationController?.pushViewController(vc, animated: true)
    }

}

//MARK: Delegates
extension LocationPage: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //Ignore user
        view.isUserInteractionEnabled = false
        
        //Activity indicator
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .medium
        activityIndicator.center = mapView.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        mapView.addSubview(activityIndicator)
        
        //Hide keyboar
        locationTextField.resignFirstResponder()
        
        //Create the request
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = locationTextField.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (response, error) in
            
            //Stopping activity animation
            activityIndicator.stopAnimating()
            self.view.isUserInteractionEnabled = true
            
            if response == nil {
                print("Error trying to find response")
            } else {
                
                //Remove annotations
                let annotations = self.mapView.annotations
                self.mapView.removeAnnotations(annotations)
                
                //Getting data
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                
                //Creating annotations
                let annotation = MKPointAnnotation()
                annotation.title = self.locationTextField.text
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                self.mapView.addAnnotation(annotation)
                
                //Zooming on annotation
                let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                self.mapView.setRegion(region, animated: true)
                
                //Setting the location label
                self.locationLabel.text = self.locationTextField.text
                
                
            }
        }
        return true
    }
    
}

extension LocationPage: CLLocationManagerDelegate {
    
}
