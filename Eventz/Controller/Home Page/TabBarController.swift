//
//  TabBarController.swift
//  Eventz
//
//  Created by Caio Chaves on 21.06.23.
//

import UIKit
/**
 The `TabBarController` class is a custom implementation of `UITabBarController` that configures and manages a tab bar interface with three tabs: Home, Favorites, and Profile.
 
 ## Usage
 1. Instantiate an instance of `TabBarController`.
 2. Customize the appearance and behavior of the tab bar by modifying the `configureTabControll` method.
 3. Set up the view controllers for each tab and assign corresponding icons.
 
 ## Example
 ```
 let tabBarController = TabBarController()
 self.present(tabBarController, animated: true, completion: nil)
 ```
 ## Important Note
 
 - Make sure to provide valid image names for the icons in the configureTabControll method. Ensure that the images are added to the project's asset catalog.
 
 ## Methods
 
 - configureTabControll(): Configures the tab bar controller by initializing view controllers for each tab, setting them as the root view controllers of navigation controllers where needed, and assigning icons to the tab bar items.
 
 ## Overrides
 
 - `viewDidLoad()`: Overrides the superclass's `viewDidLoad` method to call `configureTabControll` during the page lifecycle.
 */
class TabBarController: UITabBarController {
    
    //MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabControll()
        
    }
    
    //MARK: Configuring Tab Controller
    private func configureTabControll() {
        //Initializing all the UIViewControllers
        let homePage = HomePage()
        let favoritePage = FavoritePage()
        let profilePage = UINavigationController(rootViewController: ProfilePage())
        
        setViewControllers([homePage, favoritePage, profilePage], animated: true)
        
        //Adding image to the tabBarItems
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(named: "compass-resized")
        items[1].image = UIImage(named: "heart-resized")
        items[2].image = UIImage(named: "user-resized")
    }
    
}

