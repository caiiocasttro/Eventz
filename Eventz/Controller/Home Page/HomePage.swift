//
//  HomePage.swift
//  Eventz
//
//  Created by Caio Chaves on 21.06.23.
//

import UIKit
/**
 The `HomePage` class is a UIViewController that represents the main page of the application, displaying a collection view of events.
 
 ## Properties:
 - `collectionView`: The main UICollectionView used to display events.
 - `buttonSelected`: A boolean flag indicating whether the heart button in the collection view cells is selected.
 
 ## Methods:
 - `viewDidLoad`: Called after the controller's view is loaded into memory. It configures the collection view, registers cell types, and adds it to the view hierarchy.
 - `configureTabBar`: Configures the appearance of the tab bar.
 - `configureLayout`: Configures the overall layout of the home page, including the tab bar color and background color.
 - `configureCollectionViewLayout`: Configures the layout of the collection view using compositional layout.
 - `configuringHeaderItem`: Configures the layout of the header in the collection view.
 
 ## Extensions:
 - `UICollectionViewDelegateFlowLayout` and `UICollectionViewDataSource`: Implement methods required for the collection view delegate and data source.
 - `viewForSupplementaryElementOfKind`: Provides the header view for the collection view.
 - `cellForItemAt`: Provides the cell for a specific item in the collection view.
 - `numberOfItemsInSection`: Returns the number of items in the collection view.
 - `didSelectItemAt`: Handles the selection of a collection view cell, animates the cell, and navigates to the `EventsPage` for more details.
 
 ## Usage:
 ```
 let homePage = HomePage()
 navigationController?.pushViewController(homePage, animated: true)
 ```
 - Note: This documentation assumes the existence of `HomePageHeader`, `CardsCell`, and `CardsModel` classes or structures, as they are referenced in the code.
 */
class HomePage: UIViewController {
    
    //MARK: Initializer
    var collectionView: UICollectionView!
    
    //MARK: Proprieties
    var buttonSelected = false
    
    //MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        
        self.collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: configureCollectionViewLayout())
        
        self.collectionView.delegate = self
        
        self.collectionView.dataSource = self
        
        self.collectionView.isScrollEnabled = false
        
        self.collectionView.register(HomePageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomePageIdentifier.header.rawValue)
        
        self.collectionView.register(CardsCell.self, forCellWithReuseIdentifier: HomePageIdentifier.cards.rawValue)
        
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
        view.backgroundColor = .white
        
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

//MARK: Collection view Delegate and DataSource
extension HomePage: UICollectionViewDelegateFlowLayout,  UICollectionViewDataSource {
    
    
    
    //Data Source
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomePageIdentifier.header.rawValue, for: indexPath) as! HomePageHeader
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePageIdentifier.cards.rawValue, for: indexPath ) as! CardsCell
        cell.image = CardsModel(rawValue: CardsModel.events[indexPath.row])?.rawValue
        cell.labels = CardsModel(rawValue: CardsModel.events[indexPath.row])?.eventsName
        cell.cities = CardsModel(rawValue: CardsModel.events[indexPath.row])?.city
        
        //Setting up the button
        cell.addSubview(cell.heartButton)
        cell.heartButton.topAnchor.constraint(equalTo: cell.topAnchor, constant: 20).isActive = true
        cell.heartButton.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -40).isActive = true
        cell.heartDidTappedAction = {
            
            self.buttonSelected = !self.buttonSelected
            
            if self.buttonSelected {
                cell.heartButton.setImage(UIImage(named: "heart-fill"), for: .normal)
                CardsModel.favoriteEvents.append(CardsModel.events[indexPath.row])
            } else {
                cell.heartButton.setImage(UIImage(named: "heart"), for: .normal)
                CardsModel.favoriteEvents.removeAll { $0 == CardsModel.events[indexPath.row] }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CardsModel.events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardsCell
        

        
            let vc = EventsPage()
            vc.modalPresentationStyle = .fullScreen
            vc.image = cell.image
            vc.name = cell.labels
            vc.city = cell.cities
            self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

