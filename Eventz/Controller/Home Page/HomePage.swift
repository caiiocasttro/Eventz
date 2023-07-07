//
//  HomePage.swift
//  Eventz
//
//  Created by Caio Chaves on 21.06.23.
//

import UIKit

class HomePage: UIViewController {
    
    //MARK: Initializer
    var collectionView: UICollectionView!
    
    var model = cardsModel()
    
    var cardsCell = CardsCell()
    
    var heartDidTappedAction: (() -> ())?
    
    var favoriteCardsModel = FavoriteCardsModel()
    
    var delegate:updateFavoriteList?
    
    //MARK: Proprieties
    var cellIdentifier = "CardsCell"

    var headerIdentifier = "HomePageHeader"
    
    var buttonSelected = false
    
    //MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()

        self.collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: configureCollectionViewLayout())
        
        self.collectionView.delegate = self
        
        self.collectionView.dataSource = self
        
        self.collectionView.isScrollEnabled = false
        
        self.collectionView.register(HomePageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
        self.collectionView.register(CardsCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        view.addSubview(collectionView)
        
        
 
    }
    
    //MARK: Configuring Tab bar color
    private func configureTabBar() {
        // Setting a new item's color
        guard let item = self.tabBarController?.tabBar else { return }
        
        item.tintColor = UIColor(named: "Pink3")
        item.unselectedItemTintColor = UIColor(named: "Aux9")
        
    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        //Calling tabBar configuration
        configureTabBar()
        
        //Background
        view.backgroundColor = UIColor(named: "Principal6")
        
    }
    
    //MARK: Configure collectionView Layout
    public func configureCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        
        //Item
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        //Group
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.65)), subitems: [item])
        //Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 20
        section.supplementaryContentInsetsReference = .none
        section.boundarySupplementaryItems = [self.configuringHeaderItem()]
        
        
        return UICollectionViewCompositionalLayout(section: section)
        
    }
    
    //MARK: Configuring header
    private func configuringHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(105)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
    
}

//MARK: Initializing collectionView

//MARK: Collection view Delegate and DataSource
extension HomePage: UICollectionViewDelegateFlowLayout,  UICollectionViewDataSource {
    
    

    //Data Source
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! HomePageHeader
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath ) as! CardsCell
        cell.image = model.items[indexPath.row]
        cell.labels = model.labels[indexPath.row]
        cell.cities = model.cityLabels[indexPath.row]
        
        //Setting up the button
        cell.addSubview(cell.heartButton)
        cell.heartButton.topAnchor.constraint(equalTo: cell.topAnchor, constant: 20).isActive = true
        cell.heartButton.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -40).isActive = true
        cell.heartDidTappedAction = {
            
            self.buttonSelected = !self.buttonSelected
            
            if self.buttonSelected {
                cell.heartButton.setImage(UIImage(named: "heart-fill"), for: .normal)
            } else {
                cell.heartButton.setImage(UIImage(named: "heart"), for: .normal)
            }
            self.delegate?.updateList(image: cell.image!, eventName: cell.labels!, city: cell.cities!)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardsCell
        
        let vc = EventsPage()
        vc.modalPresentationStyle = .fullScreen
        vc.image = cell.image
        vc.name = cell.labels
        vc.city = cell.cities
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

