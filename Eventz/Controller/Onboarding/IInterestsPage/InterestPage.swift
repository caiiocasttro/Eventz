////
////  InterestPage.swift
////  Eventz
////
////  Created by Caio Chaves on 21.06.23.
////
//
//import UIKit
//
////private var cellIdentifier = "InterestsButtonsCell"
//
//var interestsLabels: [String] = ["Concerts", "Festival", "Outdoor", "Wine tasting", "Science",
//                           "Food", "Family", "Indoor", "Sports", "Comedy",
//                           "Business", "Theater", "Technology", "Geeks",
//                           "Fashion", "Games", "Dance", "Kids", "Drink with friends",
//                                 "Exhibition", "Open door", "Music", "Comunity"]
//
//class InterestPage: UIViewController {
//    
//    
//    //MARK: Initializer
//    let columnLayout = CustomViewFlowLayout()
//    
//    //MARK: Proprieties
//    private lazy var steps: UILabel = {
//        let label = UILabel()
//        label.text = "3 of 3"
//        label.textColor = UIColor(named: "Aux10")
//        label.font = .systemFont(ofSize: 14, weight: .bold)
//        return label
//    }()
//    
//    private lazy var interestPageLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Tell Us Your Interests"
//        label.textColor = UIColor(named: "Aux10")
//        label.font = .systemFont(ofSize: 30, weight: .heavy)
//        return label
//    }()
//    
//    private lazy var labelText: UILabel = {
//        let text = UILabel()
//        text.text = "Telling us your interests will help us to filter the events based on what kind of events you like."
//        text.textColor = UIColor(named: "Aux5")
//        text.font = .systemFont(ofSize: 16, weight: .medium)
//        text.numberOfLines = 0
//        return text
//    }()
//    
//    private let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.register(InterestsButtonsCell.self, forCellWithReuseIdentifier: cellIdentifier)
//        return collectionView
//    }()
//
//    //MARK: Page lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureLayout()
//        collectionView.delegate = self
//        collectionView.dataSource = self
////        collectionView.collectionViewLayout = columnLayout
//        
////        if #available(iOS 10.0, *) {
////            columnLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
////        } else {
////            columnLayout.estimatedItemSize = CGSize(width: 41, height: 41)
////        }
//        
//        
//    }
//    
//    //MARK: Configuring layout
//    private func configureLayout() {
//        //Setting the background
//        let width = UIScreen.main.bounds.size.width
//        let height = UIScreen.main.bounds.size.height
//        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
//        backgroundImageView.image = UIImage(named: "WallpaperTwo")
//        backgroundImageView.contentMode = .scaleAspectFill
//        
//        //Adding subview
//        view.addSubview(backgroundImageView)
//        view.sendSubviewToBack(backgroundImageView)
//        view.addSubview(steps)
//        view.addSubview(interestPageLabel)
//        view.addSubview(labelText)
//        view.addSubview(collectionView)
//        
//        steps.translatesAutoresizingMaskIntoConstraints = false
//        interestPageLabel.translatesAutoresizingMaskIntoConstraints = false
//        labelText.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        
//        //Adding constraints
//        NSLayoutConstraint.activate([
//            
//            //Steps label
//            steps.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
//            steps.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            
//            //Interest's Page Label
//            interestPageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            interestPageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            
//            //Explanation text
//            labelText.topAnchor.constraint(equalTo: interestPageLabel.bottomAnchor, constant: 10),
//            labelText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            labelText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
//            
//            //Button collection
//            collectionView.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 20),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
//        ])
//    }
//}
//
//extension InterestPage: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return interestsLabels.count
//    }
//    
////    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! InterestsButtonsCell
////        cell.interestsButton.isHidden = false
////        cell.title = interestsLabels[indexPath.row]
////        return cell
////    }
//    
//    //MARK: UICollectionViewDelegateFlowLayout functions
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width / 4, height: 35)
//    }
//    
//}
//
//public extension CollectionCellAutoLayout where Self: UICollectionViewCell {
//    
//    func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        setNeedsLayout()
//        layoutIfNeeded()
//        
//        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
//        var newFrame = layoutAttributes.frame
//        
//        newFrame.size.width = CGFloat(ceilf(Float(size.width)))
//        layoutAttributes.frame = newFrame
//        cachedSize = newFrame.size
//        return layoutAttributes
//    }
//    
//    
//    
//}
//
//class CustomViewFlowLayout: UICollectionViewFlowLayout {
//    let cellSpacing: CGFloat = 10
//    
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        self.minimumLineSpacing = 10.0
//        self.sectionInset = UIEdgeInsets(top: 12.0, left: 16.0, bottom: 0.0, right: 16.0)
//        
//        let attributes = super.layoutAttributesForElements(in: rect)
//        
//        var leftMargin = sectionInset.left
//        var maxY: CGFloat = -1.0
//        
//        attributes?.forEach { layoutAttribute in
//          if layoutAttribute.frame.origin.y >= maxY {
//                leftMargin = sectionInset.left
//            }
//            layoutAttribute.frame.origin.x = leftMargin
//            leftMargin += layoutAttribute.frame.width + cellSpacing
//            maxY = max(layoutAttribute.frame.maxY, maxY)
//            
//        }
//        return attributes
//    }
//
//}
