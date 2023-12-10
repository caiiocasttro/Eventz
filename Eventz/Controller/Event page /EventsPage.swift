//
//  EventPageV2.swift
//  Eventz
//
//  Created by Caio Chaves on 29.06.23.
//

import UIKit
import EventKit
import EventKitUI
/**
 `EventsPage` is a UIViewController responsible for displaying details about an event, including reviews and an option to add the event to the user's calendar.

 ## Properties
 - `reviewModel`: An instance of `reviewsModel` to manage and provide data for reviews.
 - `eventStore`: An instance of `EKEventStore` to handle calendar events.
 - `eventVC`: An instance of `EKEventEditViewController` for presenting the event editing view.

 ### Event Details Properties
 - `image`: String representing the image of the event.
 - `name`: String representing the name of the event.
 - `city`: String representing the city where the event is located.
 - `date`: String representing the date of the event.

 ## UI Components
 - `collectionView`: UICollectionView displaying reviews for the event.
 - `plusButton`: UIBarButtonItem with an icon for additional actions.
 - `calendarButton`: UIButton to add the event to the user's calendar.
 - `footerButton`: UIView serving as the footer for additional actions.
 - `line`: UIImageView displaying a line separator.

 ## Lifecycle Methods
 - `viewDidLoad()`: Configures the layout and initializes UI components.
 - `viewWillAppear(_:)`: Adjusts the appearance before the view appears.
 - `viewWillDisappear(_:)`: Handles actions before the view disappears.

 ## UICollectionViewLayout Configuration
 - `configureCollectionView()`: Configures the layout for the UICollectionView.
 - `configureHeader()`: Configures the header for the UICollectionView.
 - `configureFooter()`: Configures the footer for the UICollectionView.

 ## Layout Configuration
 - `configureLayout()`: Configures the overall layout of the view, including subviews and constraints.

 ## Button Actions
 - `addToCalendarTapped()`: Handles the action when the "Add to Calendar" button is tapped.
 - `plusButtonDidTapped()`: Handles the action when the plusButton button is tapped.

 ## Calendar Integration
 - `presentingEventVC()`: Presents the `EKEventEditViewController` for adding the event to the calendar.

 ## UICollectionViewDelegate & DataSource
 - `collectionView(_:numberOfItemsInSection:)`: Specifies the number of items in the UICollectionView.
 - `collectionView(_:cellForItemAt:)`: Configures and returns a cell for a specific index path.
 - `collectionView(_:viewForSupplementaryElementOfKind:at:)`: Configures and returns header/footer views for the UICollectionView.

 ## EKEventEditViewDelegate
 - `eventEditViewController(_:didCompleteWith:)`: Handles completion events when the user interacts with the `EKEventEditViewController`.
*/
class EventsPage: UIViewController {
    
    //MARK: Initializers
    let reviewModel = reviewsModel()
    
    let eventStore = EKEventStore()
    
    
    
    //MARK: Properties
    public var image: String?
    
    public var name: String?
    
    public var city: String?
    
    public var date: String?
    
    private var collectionView: UICollectionView!
    
    lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(named: "dots-resized")
        return button
    }()
    
    lazy var calendarButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "Pink3")
        button.setTitle("Add to calendar", for: .normal)
        button.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .heavy)
        button.layer.cornerRadius = 25
        button.clipsToBounds = false
        return button
    }()
    
    lazy var footerButton: UIView = {
        let footer = UIView()
        footer.backgroundColor = UIColor(named: "Principal6")
        footer.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        footer.layer.shadowRadius = 4
        footer.layer.shadowOpacity = 0.5
        footer.layer.shadowOffset = CGSize(width: 0, height: 0)
        return footer
    }()
    
    lazy var line: UIImageView = {
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
        
        //Setting navigation bar items
        navigationController?.navigationBar.tintColor = UIColor(named: "Principal6")
        navigationItem.rightBarButtonItem = plusButton
        
        self.collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: configureCollectionView())
        
        self.collectionView.delegate = self
        
        self.collectionView.dataSource = self
        
        self.collectionView.isScrollEnabled = true
        
        self.collectionView.register(EventsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: EventsPageIdentifier.header.rawValue)
        
        self.collectionView.register(ReviewsCell.self, forCellWithReuseIdentifier: EventsPageIdentifier.review.rawValue)
        
        self.collectionView.register(EventsPageFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: EventsPageIdentifier.footer.rawValue)
        
        //Adding subview
        view.addSubview(collectionView)
        view.addSubview(footerButton)
        footerButton.addSubview(line)
        footerButton.addSubview(calendarButton)
        
        footerButton.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        calendarButton.translatesAutoresizingMaskIntoConstraints = false
        
        
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
            calendarButton.topAnchor.constraint(equalTo: footerButton.topAnchor, constant: 20),
            calendarButton.trailingAnchor.constraint(equalTo: footerButton.trailingAnchor, constant: -20),
            calendarButton.widthAnchor.constraint(equalToConstant: 150),
            calendarButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        //Adding button target
        calendarButton.addTarget(self, action: #selector(addToCalendarTapped), for: .touchUpInside)
        plusButton.target = self
        plusButton.action = #selector(plusButtonDidTapped)
        
    }
    
    //MARK: Button action
    @objc private func addToCalendarTapped() {
        
        print("tapped")
        switch EKEventStore.authorizationStatus(for: .event) {
        case .notDetermined:
        
            if #available(iOS 17.0, *) {
                eventStore.requestFullAccessToEvents { success, error in
                    if success, error == nil {
                        self.presentingEventVC()
                    }
                }
            } else {
                eventStore.requestAccess(to: .event) { (granted, error) in
                    if granted, error == nil {
                        self.presentingEventVC()
                    }
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
        
        DispatchQueue.main.async { [weak self] in
            let eventVC = EKEventEditViewController()
            eventVC.editViewDelegate = self
            eventVC.eventStore = EKEventStore()
            
            let newEvent = EKEvent(eventStore: eventVC.eventStore)
            newEvent.title = self?.name
            newEvent.location = self?.city
            newEvent.startDate = Date()
            
            eventVC.event = newEvent
            self?.present(eventVC, animated: true)
        }
        
    }
    
}

//MARK: CollectionView Delegate & DataSoure
extension EventsPage: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewModel.title.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventsPageIdentifier.review.rawValue, for: indexPath) as! ReviewsCell
        cell.title = reviewModel.title[indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: EventsPageIdentifier.header.rawValue, for: indexPath) as! EventsPageHeader
            
            header.image = image
            header.name = name
            header.city = city
            
            return header
            
        case UICollectionView.elementKindSectionFooter:
            
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: EventsPageIdentifier.footer.rawValue, for: indexPath) as! EventsPageFooter
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
            self.calendarButton.setTitle("Event saved", for: .normal)
        } else {
            controller.dismiss(animated: true)
        }
        
        
    }
    
    
}
