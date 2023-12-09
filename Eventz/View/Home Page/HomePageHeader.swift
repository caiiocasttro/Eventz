//
//  HomePageHeader.swift
//  Eventz
//
//  Created by Caio Chaves on 22.06.23.
//

import UIKit
/**
 `HomePageHeader` is a custom `UICollectionReusableView` class that represents the header view for a collection view on the home page. It includes various UI elements such as a logo, notification button, search button, colored stickers, and buttons for different categories.

  ## Properties

   - `logo`: A UIImageView displaying the logo image.
  - `notificationButton`: A UIButton for notifications.
  - `searchButton`: A UIButton for search functionality.
  - `blueSticker`, `pinkSticker`, `greenSticker`: UIViews representing colored stickers.
  - `upcomingButton`, `nearbyButton`, `popularButton`: UIButtons for different categories.

  ## Initialization

   - `init(frame:)`: Initializes the `HomePageHeader` with the given frame and configures its layout.

  ## Configuring Layout

   - `configureLayout()`: Configures the layout by adding subviews, setting up constraints, and defining button targets.

  ## Button Actions

   - `upcomingDidTapped()`: Action method for the "Upcoming" button, updating its appearance and resetting other buttons.
  - `nearbyDidTapped()`: Action method for the "Nearby" button, updating its appearance and resetting other buttons.
  - `popularDidTapped()`: Action method for the "Popular" button, updating its appearance and resetting other buttons.

  ## Note

   - The UI elements are lazily instantiated for efficiency.
  - Colored stickers are instances of a custom view (`CustomView`).
  - The layout is configured using Auto Layout constraints for proper positioning.
  - Button actions update button appearance based on the selected category.
  - The class assumes the existence of color definitions in the asset catalog.

  ## Usage
  ```
  let headerView = HomePageHeader(frame: CGRect(x: 0, y: 0, width: collectionView.bounds.width, height: 120))
  collectionView.addSubview(headerView)
 ```
  - Ensure that the required images and color names are available in the asset catalog.
 */
class HomePageHeader: UICollectionReusableView {
    
    //MARK: Objects
    
    private lazy var logo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "Eventz40")
        return logo
    }()
    
    private lazy var notificationButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        button.setBackgroundImage( UIImage(named: "bell-resized")?.withTintColor(UIColor(named: "Aux9") ?? UIColor.gray), for: .normal)
        return button
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.setBackgroundImage( UIImage(named: "search-resized")?.withTintColor(UIColor(named: "Aux9") ?? UIColor.gray), for: .normal)
        return button
    }()
    
    public lazy var blueSticker: UIView = {
        let image = CustomView(frame: .init(x: 0, y: 0, width: 0, height: 70))
        image.backgroundColor = UIColor(named: "Blue10")
        image.clipsToBounds = true
        return image
    }()
    
    public lazy var pinkSticker: UIView = {
        let image = CustomView(frame: .init(x: 0, y: 0, width: 0, height: 70))
        image.backgroundColor = UIColor(named: "Pink10")
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 70)
        image.clipsToBounds = true
        return image
    }()
    
    public lazy var greenSticker: UIView = {
        let image = CustomView(frame: .init(x: 0, y: 0, width: 0, height: 70))
        image.backgroundColor = UIColor(named: "Green10")
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 70)
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var upcomingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Upcoming", for: .normal)
        button.setTitleColor(UIColor(named: "Blue2"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    private lazy var nearbyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Nearby", for: .normal)
        button.setTitleColor(UIColor(named: "Pink4"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    
    private lazy var popularButton: UIButton = {
        let button = UIButton()
        button.setTitle("Popular", for: .normal)
        button.setTitleColor(UIColor(named: "Green4"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
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
        
        //Adding subview
        addSubview(logo)
        addSubview(notificationButton)
        addSubview(searchButton)
        addSubview(blueSticker)
        addSubview(pinkSticker)
        addSubview(greenSticker)
        blueSticker.addSubview(upcomingButton)
        pinkSticker.addSubview(nearbyButton)
        greenSticker.addSubview(popularButton)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        notificationButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        blueSticker.translatesAutoresizingMaskIntoConstraints = false
        pinkSticker.translatesAutoresizingMaskIntoConstraints = false
        greenSticker.translatesAutoresizingMaskIntoConstraints = false
        upcomingButton.translatesAutoresizingMaskIntoConstraints = false
        nearbyButton.translatesAutoresizingMaskIntoConstraints = false
        popularButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraints
        NSLayoutConstraint.activate([
            
            //Logo
            logo.topAnchor.constraint(equalTo: topAnchor, constant: -35),
            logo.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            //Notification button
            notificationButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            notificationButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            //Search Button
            searchButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            //Blue Sticker
            blueSticker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            blueSticker.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            blueSticker.widthAnchor.constraint(equalToConstant: 120),
            blueSticker.heightAnchor.constraint(equalToConstant: 35),
            
            //Pink Sticker
            pinkSticker.leadingAnchor.constraint(equalTo: blueSticker.trailingAnchor, constant: -1),
            pinkSticker.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            pinkSticker.widthAnchor.constraint(equalToConstant: 90),
            pinkSticker.heightAnchor.constraint(equalToConstant: 35),
            
            //Green Sticker
            greenSticker.leadingAnchor.constraint(equalTo: pinkSticker.trailingAnchor, constant: -1),
            greenSticker.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            greenSticker.widthAnchor.constraint(equalToConstant: 90),
            greenSticker.heightAnchor.constraint(equalToConstant: 35),
            
            //Upcoming Button
            upcomingButton.centerYAnchor.constraint(equalTo: blueSticker.centerYAnchor),
            upcomingButton.centerXAnchor.constraint(equalTo: blueSticker.centerXAnchor),
            
            //NearBy Button
            nearbyButton.centerYAnchor.constraint(equalTo: pinkSticker.centerYAnchor),
            nearbyButton.centerXAnchor.constraint(equalTo: pinkSticker.centerXAnchor),
            
            //Popular Button
            popularButton.centerYAnchor.constraint(equalTo: greenSticker.centerYAnchor),
            popularButton.centerXAnchor.constraint(equalTo: greenSticker.centerXAnchor)
  
        ])
        
        //Buttons target
        upcomingButton.addTarget(self, action: #selector(upcomingDidTapped), for: .touchUpInside)
        nearbyButton.addTarget(self, action: #selector(nearbyDidTapped), for: .touchUpInside)
        popularButton.addTarget(self, action: #selector(popularDidTapped), for: .touchUpInside)
    }
    
    //MARK: Button action
    @objc private func upcomingDidTapped() {
        upcomingButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        upcomingButton.setTitleColor(UIColor(named: "Blue2"), for: .normal)
        
        nearbyButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        nearbyButton.setTitleColor(UIColor(named: "Pink4"), for: .normal)
        
        
        popularButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        popularButton.setTitleColor(UIColor(named: "Green3"), for: .normal)
        
        
        
    }
    
    @objc private func nearbyDidTapped() {
        
        upcomingButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        upcomingButton.setTitleColor(UIColor(named: "Blue4"), for: .normal)
        
        
        nearbyButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        nearbyButton.setTitleColor(UIColor(named: "Pink2"), for: .normal)
        
        
        popularButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        popularButton.setTitleColor(UIColor(named: "Green3"), for: .normal)
         
    }
    
    @objc private func popularDidTapped() {
        
        upcomingButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        upcomingButton.setTitleColor(UIColor(named: "Blue4"), for: .normal)
        
        
        nearbyButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        nearbyButton.setTitleColor(UIColor(named: "Pink4"), for: .normal)
        
        
        popularButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        popularButton.setTitleColor(UIColor(named: "Green1"), for: .normal)
        
    }
}

