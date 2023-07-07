//
//  EventPageV2.swift
//  Eventz
//
//  Created by Caio Chaves on 29.06.23.
//

import UIKit
import EventKit
import EventKitUI

class EventsPage: UIViewController {
    
    //MARK: Initializers
    let reviewModel = reviewsModel()
    
    let eventStore = EKEventStore()
    
    let eventVC = EKEventEditViewController()
    
    //MARK: Properties
   public var image: String?
    
   public var name: String?
    
   public var city: String?
    
    public var date: String?
    
    private var collectionView: UICollectionView!
    
    private var headerIdentifier = "EventsPageHeader"
    
    private var cellIdentifier = "reviewsCell"
    
    private var footerIdentifier = "EventsPageFooter"
    
    private var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(named: "dots-resized")
        return button
    }()
    
    private var addToCalendarButton = customGenericButton()
    
    private var footerButton: UIView = {
        let footer = UIView()
        footer.backgroundColor = UIColor(named: "Principal6")
        footer.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        footer.layer.shadowRadius = 4
        footer.layer.shadowOpacity = 0.5
        footer.layer.shadowOffset = CGSize(width: 0, height: 0)
        return footer
    }()
    
    private var line: UIImageView = {
        let line = UIImageView()
        line.image = UIImage(named: "Line")?.withTintColor(UIColor(named: "Aux4") ?? UIColor.lightGray)
        return line
    }()

    //MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
    
    //MARK: Configuring CollectionViewLayout
    private func configureCollectionView() -> UICollectionViewCompositionalLayout {
        
        //Item
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        //Group
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(114)), subitems: [item])
        //Section
        let section = NSCollectionLayoutSection(group: group)
//        section.interGroupSpacing = 30
        section.supplementaryContentInsetsReference = .none
        section.boundarySupplementaryItems = [configureHeader(), configureFooter()]
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    //MARK: Configuring header & footer
    private func configureHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(780)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
    private func configureFooter() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
    }

    //MARK: Configuring layout
    private func configureLayout() {
        //View Background
        view.backgroundColor = UIColor(named: "Principal6")
        
        //Add to calendar button
        addToCalendarButton.backgroundColor = UIColor(named: "Pink3")
        addToCalendarButton.setTitle("Add to calendar", for: .normal)
        addToCalendarButton.layer.cornerRadius = 25
        
        //Setting navigation bar items
        navigationController?.navigationBar.tintColor = UIColor(named: "Principal6")
        navigationItem.rightBarButtonItem = plusButton
        
        self.collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: configureCollectionView())
        
        self.collectionView.delegate = self
        
        self.collectionView.dataSource = self
        
        self.collectionView.isScrollEnabled = true
        
        self.collectionView.register(EventsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
        self.collectionView.register(ReviewsCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        self.collectionView.register(EventsPageFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerIdentifier)
        
        //Adding subview
        view.addSubview(collectionView)
        view.addSubview(footerButton)
        footerButton.addSubview(line)
        footerButton.addSubview(addToCalendarButton)
        
        footerButton.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        addToCalendarButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Adding constraints
        NSLayoutConstraint.activate([
            
          //Footer
            footerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footerButton.heightAnchor.constraint(equalToConstant: 90),
            
            //Line
            line.topAnchor.constraint(equalTo: footerButton.topAnchor, constant: -1),
            line.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        //Add to calendar button
            addToCalendarButton.topAnchor.constraint(equalTo: footerButton.topAnchor, constant: 20),
            addToCalendarButton.trailingAnchor.constraint(equalTo: footerButton.trailingAnchor, constant: -20),
            addToCalendarButton.widthAnchor.constraint(equalToConstant: 150),
            addToCalendarButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        //Adding button target
        addToCalendarButton.addTarget(self, action: #selector(addToCalendarTapped), for: .touchUpInside)
        plusButton.target = self
        plusButton.action = #selector(plusButtonDidTapped)
        
    }
    
    //MARK: Button action
   @objc private func addToCalendarTapped() {
        
       switch EKEventStore.authorizationStatus(for: .event) {
       case .notDetermined:
           eventStore.requestAccess(to: .event) { success, error in
               if success, error == nil {
                   self.presentingEventVC()
               }
           }
       case .authorized:
           presentingEventVC()
       default:
           break
       }
        
    }
    
    @objc private func plusButtonDidTapped() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Share this event", style: .default))
        
        actionSheet.addAction(UIAlertAction(title: "Report this event", style: .default))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(actionSheet, animated: true)
    }
    
    //Presenting EventVC function
    private func presentingEventVC() {
        eventVC.editViewDelegate = self
        eventVC.eventStore = EKEventStore()
        
        let newEvent = EKEvent(eventStore: eventVC.eventStore)
        newEvent.title = name
        newEvent.location = city
        newEvent.startDate = Date()
        
        eventVC.event = newEvent
        self.present(eventVC, animated: true)
    }
    
    //ActionSheet function
    

}

//MARK: CollectionView delegate
extension EventsPage: UICollectionViewDelegateFlowLayout {
    
}

//MARK: CollectionView DataSoure
extension EventsPage: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewModel.title.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ReviewsCell
        cell.title = reviewModel.title[indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
                
            case UICollectionView.elementKindSectionHeader:
                
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! EventsPageHeader
            
            header.image = image
            header.name = name
            header.city = city
            
            return header
                
            case UICollectionView.elementKindSectionFooter:
            
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerIdentifier, for: indexPath) as! EventsPageFooter
            return footer
                
            default:
                
                assert(false, "Unexpected element kind")
            }
        
    }
  
}

//MARK: Event delegate
extension EventsPage: EKEventEditViewDelegate {
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        if action == EKEventEditViewAction.saved {
            controller.dismiss(animated: true)
            self.addToCalendarButton.setTitle("Event saved", for: .normal)
        } else {
            controller.dismiss(animated: true)
        }
        
        
    }
    
    
}
