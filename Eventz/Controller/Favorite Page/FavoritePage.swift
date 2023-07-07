//
//  FavoritePage.swift
//  Eventz
//
//  Created by Caio Chaves on 21.06.23.
//

import UIKit

class FavoritePage: UIViewController {
    
    //MARK: Initializer
    var collectionView: UICollectionView!
    
    var cardsModel = FavoriteCardsModel()
    
    let customNavigationBar = UINavigationController(navigationBarClass: CustomNavigationBar.self, toolbarClass: nil)
    
    //MARK: Proprieties
    private var headerIdentifier = "FavoritePageHeader"
    
    private var cellIdentifier = "MiniCardsCell"
    
    private lazy var favoriteLabel: UILabel = {
        let label = UILabel()
        label.text = "Favorite"
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.textColor = UIColor(named: "Pink3")
        return label
    }()
    
    //MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: Configuring collectionViewLayout
    private func configureCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        
        //Item
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        //Group
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(150)), subitems: [item])
        
        //Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.supplementaryContentInsetsReference = .none
        section.boundarySupplementaryItems = [configureHeader()]
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    //MARK: Configuring header
    private func configureHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(64)), elementKind:  UICollectionView.elementKindSectionHeader, alignment: .top)
        header.pinToVisibleBounds = true
        return header
    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        view.backgroundColor = UIColor(named: "Principal6")
        
        self.tabBarController?.tabBar.backgroundColor = UIColor(named: "Principal6")
        
        self.collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: configureCollectionViewLayout())
        
        self.collectionView.delegate = self
        
        self.collectionView.dataSource = self
        
        self.collectionView.register(FavoritePageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
        self.collectionView.register(MiniCardsCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        self.collectionView.isScrollEnabled = true
        
        view.addSubview(collectionView)
        
    }
    
}

//MARK: CollectionView Delegate
extension FavoritePage: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MiniCardsCell
        
        let vc = EventsPage()
        vc.modalPresentationStyle = .fullScreen
        vc.image = cell.image
        vc.name = cell.eventName
        vc.city = cell.city
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: CollectionView DataSource
extension FavoritePage: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsModel.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MiniCardsCell
        cell.image = cardsModel.images[indexPath.row]
        cell.eventName = cardsModel.eventLabel[indexPath.row]
        cell.city = cardsModel.cities[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! FavoritePageHeader
        return header
    }

}


