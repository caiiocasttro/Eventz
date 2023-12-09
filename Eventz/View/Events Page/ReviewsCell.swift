//
//  reviewsCell.swift
//  Eventz
//
//  Created by Caio Chaves on 29.06.23.
//

import UIKit
/**
 `ReviewsCell` is a custom `UICollectionViewCell` subclass for displaying reviews.

 This cell provides a structured layout for displaying review information, including a title, date, star rating, and review body.

 ## Properties
 - `title`: The title of the review. Setting this property updates the `reviewTitle` label.
 
 ## Subviews
 - `reviewTitle`: A UILabel for displaying the review title.
 - `dateLabel`: A UILabel for displaying the date of the review.
 - `stars`: An UIImageView for displaying a star rating image.
 - `reviewBody`: A UILabel for displaying the main text body of the review.

 ## Page Lifecycle
 - `init(frame:)`: Initializes the cell and configures its layout.
 - `init?(coder:)`: Required initializer when creating the cell from a storyboard or nib. Not implemented.

 ## Methods
 - `configureLayout()`: Configures the layout by adding subviews, setting up constraints, and applying visual properties to the subviews.

 ## Example Usage
 ```
 let cell = ReviewsCell()
 cell.title = "Great product!"
 // Set other properties as needed
 ```
 - Note: Make sure to set appropriate values for the properties before displaying the cell.
 */
class ReviewsCell: UICollectionViewCell {
    
    //MARK: Proprieties
    
    var title: String? {
        didSet {
            guard let string = title else { return }
            
            reviewTitle.text = string
        }
    }
    
    private lazy var reviewTitle: UILabel = {
        let label = UILabel()
        label.text = "Finally!"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(named: "Aux7")
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "1 day ago"
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.textColor = UIColor(named: "Aux4")
        return label
    }()
    
    private lazy var stars: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Stars")
        return image
    }()
    
    private lazy var reviewBody: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet consectetur. Quis dignissim vitae velit diam et elit. Mauris cras libero orci euismod amet lectus a."
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(named: "Aux7")
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
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
        
        //Adding subviews
        addSubview(reviewTitle)
        addSubview(dateLabel)
        addSubview(reviewBody)
        addSubview(stars)
        
        reviewTitle.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewBody.translatesAutoresizingMaskIntoConstraints = false
        stars.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraints
        NSLayoutConstraint.activate([
        
            //Review title
            reviewTitle.topAnchor.constraint(equalTo: topAnchor),
            reviewTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            //Date
            dateLabel.topAnchor.constraint(equalTo: topAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            //Stars
            stars.topAnchor.constraint(equalTo: reviewTitle.bottomAnchor, constant: 10),
            stars.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            //Review body
            reviewBody.topAnchor.constraint(equalTo: stars.bottomAnchor, constant: 10),
            reviewBody.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            reviewBody.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100)
        ])
        
    }
    
}
