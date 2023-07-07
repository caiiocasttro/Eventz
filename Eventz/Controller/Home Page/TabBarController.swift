//
//  TabBarController.swift
//  Eventz
//
//  Created by Caio Chaves on 21.06.23.
//

import UIKit

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
