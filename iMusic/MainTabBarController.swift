//
//  MainTabBarViewController.swift
//  iMusic
//
//  Created by Ivan White on 01.08.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        tabBar()
        setupTabBar()
    }
    
    private func tabBar() {
        viewControllers = [
            generateVC(rootVC: SearchViewController(), image: UIImage(systemName: "magnifyingglass")!, title: "Search"),
            generateVC(rootVC: LibraryViewController(), image: UIImage(systemName: "music.note.list")!, title: "Library")
        ]
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.layer.borderWidth = 0.5
    }
    
    private func generateVC(rootVC: UIViewController, image: UIImage, title: String)-> UIViewController {
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.tabBarItem.image = image
        navVC.tabBarItem.title = title
        rootVC.navigationItem.title = title
        navVC.navigationBar.prefersLargeTitles = true
        return navVC
    }
    
}
