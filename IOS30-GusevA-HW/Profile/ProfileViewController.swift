//
//  ProfileViewController.swift
//  IOS30-GusevA-HW
//
//  Created by Arseniy Gusev on 3/16/23.
//

import UIKit

class ProfileViewController: UIViewController {
    private let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray3

        view.addSubview(profileHeaderView)



        self.profileHeaderView.setup(name: "Personal Profile",description: "Waiting for something...",image: UIImage(named: "Image2"))

    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        

        profileHeaderView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.width, height: view.bounds.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }

   
}
