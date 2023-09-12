//
//  ProfileHeaderView.swift
//  Profile
//
//  Created by Arseniy Gusev on 3/17/23.
//

import UIKit

class ProfileViewController: UIViewController {

    var currentUser: User?

    
    // MARK: - viewDidLoad()

    override func viewDidLoad() {
        super.viewDidLoad()
        //test if user was saved
        print(currentUser?.login)
        setupSelf()
        view.backgroundColor = .systemGray3
    }


    struct Cells {
        static let videoCell = "VideoCell"
    }



    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: Cells.videoCell)
        return tableView
    }()





    struct Images {
        static let first = UIImage(named: "img1")!
        static let secound = UIImage(named: "img2")!
        static let third = UIImage(named: "img3")!
        static let forth = UIImage(named: "img4")!
        static let fifth = UIImage(named: "img5")!

    }

    // MARK: - Adding tableView

    private func setupSelf() {

        view.addSubview(tableView)

        NSLayoutConstraint.activate([

            self.tableView.topAnchor.constraint(equalTo: view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: view.self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: view.self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: view.self.bottomAnchor)
        ])


    }


}


// MARK: - Extension for TableView

extension ProfileViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell, for: indexPath) as! PostTableViewCell

        let video = videos[indexPath.row]
        cell.set(video: video)

        return cell
    }


    // MARK: - User Avatar/Name/Status Setup as well as headerView

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
                    let headerView = ProfileHeaderView()
                    if let currentUser = currentUser {
                        headerView.setup(name: currentUser.fullName, description: currentUser.status, image: currentUser.avatar)
                    }
                    return headerView
                }
                return nil
       }

}
