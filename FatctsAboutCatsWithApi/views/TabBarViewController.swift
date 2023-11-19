//
//  TabBarViewController.swift
//  FatctsAboutCatsWithApi
//
//  Created by Sofo Machurishvili on 20.11.23.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let factListViewController = FactListViewController()
        let breedsViewController = BreedsViewController()


        viewControllers = [factListViewController, breedsViewController]

        factListViewController.tabBarItem = UITabBarItem(title: "Fact", image: nil, tag: 0)
        breedsViewController.tabBarItem = UITabBarItem(title: "Breeds", image: nil, tag: 1)
    }
}
