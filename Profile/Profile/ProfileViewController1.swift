//
//  ProfileViewController.swift
//  IOS30-GusevA-HW
//
//  Created by Arseniy Gusev on 3/16/23.
//

import UIKit

class ProfileViewController1: UIViewController {
    //private let profileHeaderView = ProfileHeaderView1()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray3

       // view.addSubview(profileHeaderView)

//        NSLayoutConstraint.activate([
//            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            profileHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])

   //     self.profileHeaderView.setup(name: "Personal Profile",description: "Waiting for something...",image: UIImage(named: "Image2"))

    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        

   //     profileHeaderView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.width, height: view.bounds.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }

   
}
