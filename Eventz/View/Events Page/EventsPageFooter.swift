//
//  EventsPageFooter.swift
//  Eventz
//
//  Created by Caio Chaves on 29.06.23.
//

import UIKit
/**
 `EventsPageFooter` is a custom `UICollectionReusableView` used as a footer for a collection view section in the Events page.

  ## Properties
  - `footer`: A private lazy property representing the UIView used as the footer in the collection view section.

  ## Page Lifecycle
  - `init(frame:)`: Initializes the `EventsPageFooter` with a given frame. Calls `configureLayout()` to set up the initial layout.
  - `init?(coder:)`: Not implemented as the class should not be initialized from a storyboard or a nib.

  ## Configuring Layout
  - `configureLayout()`: Configures the layout of the `EventsPageFooter`, adding the `footer` as a subview, setting up constraints, and defining its height.

  ## Example Usage
  ```
  // Creating an instance of EventsPageFooter
  let eventsFooter = EventsPageFooter(frame: CGRect(x: 0, y: 0, width: collectionView.bounds.width, height: 90))

  // Adding the footer to a collection view section
  collectionView.addSubview(eventsFooter)
 ```
 - Note: Customize the height and appearance of the footer by adjusting the constraints and properties as needed.
 */
class EventsPageFooter: UICollectionReusableView {
    
    //MARK: Properties
    private lazy var footer: UIView = {
        let footer = UIView()
        return footer
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
        addSubview(footer)
        
        footer.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraints
        NSLayoutConstraint.activate([
        
            //Footer
            footer.leadingAnchor.constraint(equalTo: leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: trailingAnchor),
            footer.heightAnchor.constraint(equalToConstant: 90)
        
        ])
    }
}
