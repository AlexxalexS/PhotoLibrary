//
//  MainTabBarController.swift
//  PhotoLibrary
//
//  Created by Leha on 04.05.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarColor()

        let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())

        viewControllers = [
            generateNavigationController(rootViewController: photosVC, title: "Photos", image: UIImage(systemName: "photo")),
            generateNavigationController(rootViewController: ViewController(), title: "Favourites", image: UIImage(systemName: "heart.fill")),
        ]
    }

    private func setupTabBarColor() {
        let color: UIColor = .systemBackground
        view.backgroundColor = color
        if #available(iOS 15.0, *) {
            let appearanceTabBar = UITabBarAppearance()
            appearanceTabBar.configureWithOpaqueBackground()
            appearanceTabBar.backgroundColor = color
            UITabBar.appearance().standardAppearance = appearanceTabBar
            UITabBar.appearance().scrollEdgeAppearance = appearanceTabBar

            let appearanceNavBar = UINavigationBarAppearance()
            appearanceNavBar.configureWithOpaqueBackground()
            appearanceNavBar.backgroundColor = color
            UINavigationBar.appearance().standardAppearance = appearanceNavBar
            UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBar.appearance().standardAppearance
        }
    }

    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }

}
