////
////  InterestsPage.swift
////  Eventz
////
////  Created by Caio Chaves on 07.06.23.
////
//
//import UIKit
//import AlignedCollectionView
//
////
//
////private var headerIdentifier = "InterestsPageHeader" 
//
////private var cellIdentifier = "InterestsButtonsCell"
//
////private var interestsLabels: [String] = ["Concerts", "Festival", "Outdoor", "Wine tasting", "Science",
////                           "Food", "Family", "Indoor", "Sports", "Comedy",
////                           "Business", "Theater", "Technology", "Geeks",
////                           "Fashion", "Games", "Dance", "Kids", "Drink with friends",
////                                 "Exhibition", "Open door", "Music", "Comunity"]
//
////public protocol CollectionCellAutoLayout: AnyObject {
////    var cachedSize: CGSize? { get set }
////}
//
//class InterestsPage: UICollectionViewController {
//    var cachedSize: CGSize? {
//        get {
//            return collectionView.frame.size
//        } set {
//            guard let newValue = newValue else { return }
//            return collectionView.contentSize = newValue
//        }
//    }
//    
//    
//    let columnLayout = CustomViewFlowLayout()
//  
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.backgroundColor = UIColor(patternImage: UIImage(named: "WallpaperTwo")!)
//        
//        //MARK: Header register
////        self.collectionView.register(InterestsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
//        
//        //MARK: Buttons cell register
////        collectionView.register(InterestsButtonsCell.self, forCellWithReuseIdentifier: cellIdentifier)
//        
//        //MARK: Content Inset Off
//        collectionView.contentInsetAdjustmentBehavior = .never
//        
//        //MARK:
//        if #available(iOS 10.0, *) {
//            columnLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        } else {
//            columnLayout.estimatedItemSize = CGSize(width: 41, height: 41)
//        }
//        collectionView.collectionViewLayout = columnLayout
//    }
//    
//}
//
//extension InterestsPage {
//    
//    
////    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
////        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! InterestsPageHeader
////
////        return header
////    }
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return interestsLabels.count
//    }
//    
////    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! InterestsButtonsCell
////        cell.interestsButton.isHidden = false
////        cell.title = interestsLabels[indexPath.row]
////        return cell
////    }
//    
//}
//
//extension InterestsPage: UICollectionViewDelegateFlowLayout {
//    
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.bounds.width, height: 211)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width / 6 - 10, height: 35)
//    }
//    
//    
//}
//
////public extension CollectionCellAutoLayout where Self: UICollectionViewCell {
////
////    func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
////        setNeedsLayout()
////        layoutIfNeeded()
////
////        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
////        var newFrame = layoutAttributes.frame
////
////        newFrame.size.width = CGFloat(ceilf(Float(size.width)))
////        layoutAttributes.frame = newFrame
////        cachedSize = newFrame.size
////        return layoutAttributes
////    }
////
////}
////
////class CustomViewFlowLayout: UICollectionViewFlowLayout {
////    let cellSpacing: CGFloat = 10
////
////    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
////        self.minimumLineSpacing = 10.0
////        self.sectionInset = UIEdgeInsets(top: 12.0, left: 16.0, bottom: 0.0, right: 16.0)
////
////        let attributes = super.layoutAttributesForElements(in: rect)
////
////        var leftMargin = sectionInset.left
////        var maxY: CGFloat = -1.0
////
////        attributes?.forEach { layoutAttribute in
////          if layoutAttribute.frame.origin.y >= maxY {
////                leftMargin = sectionInset.left
////            }
////            layoutAttribute.frame.origin.x = leftMargin
////            leftMargin += layoutAttribute.frame.width + cellSpacing
////            maxY = max(layoutAttribute.frame.maxY, maxY)
////
////        }
////        return attributes
////
////    }
////}
