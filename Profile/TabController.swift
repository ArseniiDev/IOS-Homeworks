//
//  TabController.swift
//  Profile1
//
//  Created by Arseniy Gusev on 7/25/23.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()

        self.selectedIndex = 1
    }

    private func setupTabs() {
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house.fill"), vc: FeedViewController())
        let account = self.createNav(with: "Account", and: UIImage(systemName: "person.badge.plus"), vc: LogInViewController())
        self.setViewControllers([home, account], animated: true)
    }



    private func createNav(with title:String, and image:UIImage?,vc:UIViewController)->UINavigationController{

        let nav = UINavigationController(rootViewController: vc)

        nav.tabBarItem.title = title
        nav.tabBarItem.image = image

        return nav

    }

}
