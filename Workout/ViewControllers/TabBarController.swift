//
//  MainTabViewController.swift
//  Workout
//
//  Created by Айдар Оспанов on 20.02.2023.
//

import UIKit

enum Tabs: String {
    case main
    case statistic
    case profile
}

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tabBar.backgroundColor = .specialTabBar
        tabBar.tintColor = .specialDarkGreen
        tabBar.unselectedItemTintColor = .specialGray
        tabBar.layer.borderColor = UIColor.specialBrown.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        setupBar()
    }
    
    private func setupBar() {
        
        let mainViewController = MainViewController()
        mainViewController.tabBarItem = UITabBarItem(title: Tabs.main.rawValue,
                                                     image: UIImage(named: "mainTabBar"),
                                                     tag: 0)
       
        let statisticViewController = StatisticViewController()
        statisticViewController.tabBarItem = UITabBarItem(
            title: Tabs.statistic.rawValue,
            image: UIImage(named: "statisticTabBar"),
            tag: 0
        )
        
        
        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(
            title: Tabs.profile.rawValue,
            image: UIImage(named: "profileTabBar"),
            tag: 0
        )
        
        viewControllers = [mainViewController, statisticViewController, profileViewController]
    }
    
    /*
    private func createNavigationController(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        
        let edge = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        
        let item = UITabBarItem(
            title: itemName,
            image: UIImage(named: itemImage)?.withAlignmentRectInsets(edge),
            tag: 0
        )
        
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        let navigationVC = UINavigationController(rootViewController: vc)
        navigationVC.tabBarItem = item
        navigationVC.navigationBar.scrollEdgeAppearance = navigationVC.navigationBar.standardAppearance
        return navigationVC
        
    }
     */
}

