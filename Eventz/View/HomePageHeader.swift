//
//  HomePageHeader.swift
//  Eventz
//
//  Created by Caio Chaves on 22.06.23.
//

import UIKit

struct stickersValue {
    
    public var blueStickerSize: CGFloat = 45
    
    public var pinkStickerSize: CGFloat = 35
    
    public var greenStickerSize: CGFloat = 35
    
    mutating public func blueSticker() {
        
        blueStickerSize = 45
        pinkStickerSize = 35
        greenStickerSize = 35
        
    }
    
    mutating public func pinkSticker() {
        
        blueStickerSize = 35
        pinkStickerSize = 45
        greenStickerSize = 35
        
    }
    
    mutating public func greenSticker() {
        
        blueStickerSize = 35
        pinkStickerSize = 35
        greenStickerSize = 45
    }
}

class HomePageHeader: UICollectionReusableView {
    
    //MARK: Initializer
    var stickerSizeMutating = stickersValue()
    
    var homePage = HomePage()
    
    //MARK: Proprieties
    
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

